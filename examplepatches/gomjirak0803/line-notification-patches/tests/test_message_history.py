"""Execute the production history query against SQLite regression fixtures."""
import json
from pathlib import Path
import re
import sqlite3
import unittest


SOURCE = Path(__file__).resolve().parents[1] / "extensions/extension/src/main/java/app/linenotifications/extension/NativeLine.java"


def production_query():
    source = SOURCE.read_text(encoding="utf-8")
    expression = re.search(r"static final String RECENT_MESSAGES_SQL\s*=\s*(.*?);", source, re.S).group(1)
    return "".join(json.loads(s) for s in re.findall(r'"(?:[^"\\]|\\.)*"', expression))


class MessageHistoryTest(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(":memory:")
        self.db.execute("CREATE TABLE chat_history(server_id TEXT, created_time INTEGER, from_mid TEXT, content TEXT, chat_id TEXT)")
        # The first batch's third message has the smallest server id. The old
        # server-id LIMIT kept message 1 and dropped message 3 instead of message 1.
        ids = [103, 104, 101, 102, 105] + list(range(106, 127))
        self.db.executemany("INSERT INTO chat_history VALUES(?,?,?,?,?)",
                            [(str(sid), index, "peer", str(index), "test-room") for index, sid in enumerate(ids, 1)])

    def tearDown(self):
        self.db.close()

    def selected(self, lower=0, count=25):
        return self.db.execute(production_query(), ("test-room", "self", str(lower), str(count))).fetchall()

    def test_newest_25_by_time_even_when_server_ids_reorder(self):
        self.assertEqual([int(r[3]) for r in self.selected()], list(range(26, 1, -1)))

    def test_native_read_boundary_still_uses_server_ids(self):
        self.assertTrue(all(int(row[0]) > 104 for row in self.selected(lower=104)))

    def test_other_rooms_self_and_unsent_messages_do_not_leak(self):
        self.db.executemany("INSERT INTO chat_history VALUES(?,?,?,?,?)", [
            ("900", 999, "peer", "wrong-room", "other-room"),
            ("901", 999, "self", "outgoing", "test-room"),
            ("902", 999, None, "no-sender", "test-room"),
            (None, 999, "peer", "not-posted", "test-room"),
        ])
        self.assertEqual([int(r[3]) for r in self.selected(count=1)], [26])

    def test_equal_times_have_deterministic_numeric_id_order(self):
        self.db.execute("UPDATE chat_history SET created_time=999 WHERE content IN ('1','3')")
        self.assertEqual([int(r[0]) for r in self.selected(count=2)], [103, 101])


if __name__ == "__main__":
    unittest.main()
