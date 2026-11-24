"""Execute the production history query against SQLite regression fixtures."""
import json
from pathlib import Path
import re
import sqlite3
import unittest


SOURCE = Path(__file__).resolve().parents[1] / "extensions/extension/src/main/java/app/linenotifications/extension/NativeLine.java"


def production_query(name="RECENT_MESSAGES_SQL"):
    source = SOURCE.read_text(encoding="utf-8")
    expression = re.search(rf"static final String {re.escape(name)}\s*=\s*(.*?);", source, re.S).group(1)
    return "".join(json.loads(s) for s in re.findall(r'"(?:[^"\\]|\\.)*"', expression))


class MessageHistoryTest(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(":memory:")
        self.db.execute(
            "CREATE TABLE chat_history(id INTEGER PRIMARY KEY AUTOINCREMENT, type INTEGER DEFAULT 1, "
            "server_id TEXT, created_time INTEGER, from_mid TEXT, content TEXT, "
            "chat_id TEXT, attachement_type INTEGER, parameter TEXT, location_name TEXT, location_address TEXT, "
            "attachement_local_uri TEXT)"
        )
        # The first batch's third message has the smallest server id. The old
        # server-id LIMIT kept message 1 and dropped message 3 instead of message 1.
        ids = [103, 104, 101, 102, 105] + list(range(106, 127))
        self.db.executemany(
            "INSERT INTO chat_history(server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address) "
            "VALUES(?,?,?,?,?,?,?,?,?)",
            [(str(sid), index, "peer", str(index), "test-room", 0, None, None, None) for index, sid in enumerate(ids, 1)],
        )

    def tearDown(self):
        self.db.close()

    def selected(self, lower=0, count=25):
        return self.db.execute(production_query(), ("test-room", "self", str(lower), str(count))).fetchall()

    def test_newest_25_by_time_even_when_server_ids_reorder(self):
        self.assertEqual([int(r[3]) for r in self.selected()], list(range(26, 1, -1)))

    def test_native_read_boundary_still_uses_server_ids(self):
        self.assertTrue(all(int(row[0]) > 104 for row in self.selected(lower=104)))

    def test_other_rooms_self_and_unsent_messages_do_not_leak(self):
        self.db.executemany(
            "INSERT INTO chat_history(server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address) "
            "VALUES(?,?,?,?,?,?,?,?,?)",
            [
                ("900", 999, "peer", "wrong-room", "other-room", 0, None, None, None),
                ("901", 999, "self", "outgoing", "test-room", 0, None, None, None),
                ("902", 999, None, "no-sender", "test-room", 0, None, None, None),
                (None, 999, "peer", "not-posted", "test-room", 0, None, None, None),
            ],
        )
        self.assertEqual([int(r[3]) for r in self.selected(count=1)], [26])

    def test_equal_times_have_deterministic_numeric_id_order(self):
        self.db.execute("UPDATE chat_history SET created_time=999 WHERE content IN ('1','3')")
        self.assertEqual([int(r[0]) for r in self.selected(count=2)], [103, 101])

    def test_selects_attachment_type_and_details_including_null(self):
        self.db.executemany(
            "INSERT INTO chat_history(server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address, attachement_local_uri) "
            "VALUES(?,?,?,?,?,?,?,?,?,?)",
            [
                ("201", 2001, "peer", None, "test-room", 1, None, None, None, "file:///data/user/0/jp.naver.line.android/cache/photo.jpg"),
                ("202", 2002, "peer", None, "test-room", 2, None, None, None, None),
                ("203", 2003, "peer", None, "test-room", 14, "FILE_NAME\tdoc.pdf", None, None, None),
                ("204", 2004, "peer", None, "test-room", 15, None, "Gangnam", "Seoul", None),
                ("205", 2005, "peer", None, "test-room", None, None, None, None, None),
            ],
        )
        rows = self.selected(lower=200, count=5)
        self.assertEqual([(r[0], r[4], r[5], r[6], r[7], r[9]) for r in rows], [
            ("205", None, None, None, None, None),
            ("204", 15, None, "Gangnam", "Seoul", None),
            ("203", 14, "FILE_NAME\tdoc.pdf", None, None, None),
            ("202", 2, None, None, None, None),
            ("201", 1, None, None, None, "file:///data/user/0/jp.naver.line.android/cache/photo.jpg"),
        ])
        self.assertTrue(all(isinstance(r[8], int) and r[8] > 0 for r in rows))

    def test_message_metadata_query_checks_sender_and_room(self):
        self.db.executemany(
            "INSERT INTO chat_history(server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address) "
            "VALUES(?,?,?,?,?,?,?,?,?)",
            [
                ("301", 3001, "peer", "urgent file", "test-room", 14, "FILE_NAME\tdoc.pdf\tMENTION\t{}", "Gangnam", "Seoul"),
                ("302", 3002, "self", "urgent file", "test-room", 14, "MENTION\t{}", None, None),
                ("303", 3003, None, "urgent file", "test-room", 0, "MENTION\t{}", None, None),
                ("304", 3004, "peer", "urgent file", "other-room", 0, "MENTION\t{}", None, None),
            ],
        )
        sql = production_query("MESSAGE_METADATA_SQL")
        self.assertEqual(
            self.db.execute(sql, ("test-room", "301", "self")).fetchall(),
            [("urgent file", 14, "FILE_NAME\tdoc.pdf\tMENTION\t{}", "Gangnam", "Seoul")],
        )
        for sid in ("302", "303", "304"):
            self.assertEqual(self.db.execute(sql, ("test-room", sid, "self")).fetchall(), [])

    def test_latest_chat_message_query_includes_self_and_isolates_rooms(self):
        self.db.executemany(
            "INSERT INTO chat_history(type, server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address) "
            "VALUES(?,?,?,?,?,?,?,?,?,?)",
            [
                (1, "401", 4000, "peer", "old", "test-room", 0, None, None, None),
                (1, "402", 4001, "self", None, "test-room", 15, None, "Gangnam", "Seoul"),
                (1, "403", 5000, "peer", "other", "other-room", 14, "FILE_NAME\tsecret.pdf", None, None),
            ],
        )
        sql = production_query("LATEST_CHAT_MESSAGE_SQL")
        self.assertEqual(
            self.db.execute(sql, ("test-room",)).fetchall(),
            [(1, 4001, None, 15, None, "Gangnam", "Seoul")],
        )

    def test_message_exists_query_checks_room_id_and_sender(self):
        self.db.executemany(
            "INSERT INTO chat_history(server_id, created_time, from_mid, content, chat_id, attachement_type, parameter, location_name, location_address) "
            "VALUES(?,?,?,?,?,?,?,?,?)",
            [
                ("501", 5001, "peer", "stored", "test-room", 0, None, None, None),
                ("502", 5002, "self", "outgoing", "test-room", 0, None, None, None),
                ("503", 5003, None, "system", "test-room", 0, None, None, None),
                ("504", 5004, "peer", "wrong-room", "other-room", 0, None, None, None),
            ],
        )
        sql = production_query("MESSAGE_EXISTS_SQL")
        self.assertEqual(self.db.execute(sql, ("test-room", "501", "self")).fetchall(), [(1,)])
        for sid in ("502", "503", "504", "999"):
            self.assertEqual(self.db.execute(sql, ("test-room", sid, "self")).fetchall(), [])


if __name__ == "__main__":
    unittest.main()
