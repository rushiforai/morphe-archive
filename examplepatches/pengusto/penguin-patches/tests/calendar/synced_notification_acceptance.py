#!/usr/bin/env python3
"""Exercise a provider-imported event through Fossify's scheduled reminder.

The named disposable AVD must already have the sole synthetic LOCAL calendar
penguin-test/PenguinSyntheticSync selected in Fossify's CalDAV settings.
No network account is used. The installed APK must match --apk exactly.
"""
import argparse
import hashlib
from pathlib import Path
import re
import shlex
import subprocess
import time

PKG = 'org.fossify.calendar'
EXCHANGE = ('<html><head><meta name="Generator" content="Microsoft Exchange Server">'
            '<style></style></head><body><font size="2"><span><div class="PlainText">'
            'Workshop schedule confirmed.</div></span></font></body></html>')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('adb', 'serial', 'avd-name'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--apk', type=Path, required=True)
    p.add_argument('--baseline', action='store_true')
    p.add_argument('--disposable-emulator', required=True, action='store_true')
    a = p.parse_args()
    assert a.serial.startswith('emulator-')
    def adb(*args):
        return subprocess.check_output([a.adb, '-s', a.serial, *map(str, args)], timeout=30, text=True)
    def shell(*args):
        return adb('shell', ' '.join(shlex.quote(str(arg)) for arg in args))
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert shell('getprop', 'ro.hardware').strip() == 'ranchu'
    assert shell('getprop', 'ro.kernel.qemu').strip() == '1'
    assert shell('am', 'get-current-user').strip() == '0'
    assert 'uid=0' in shell('id'), 'Rooted disposable AVD required'
    installed = shell('pm', 'path', PKG).strip()
    assert installed.startswith('package:') and len(installed.splitlines()) == 1
    expected = hashlib.sha256(a.apk.read_bytes()).hexdigest()
    assert shell('sha256sum', installed.removeprefix('package:')).split()[0] == expected
    calendars = shell('content', 'query', '--uri', 'content://com.android.calendar/calendars',
                      '--projection', '_id:name:calendar_displayName:account_name:account_type')
    assert calendars.count('Row:') == 1 and all(s in calendars for s in
        ('name=penguin-test', 'calendar_displayName=PenguinSyntheticSync',
         'account_name=penguin-test', 'account_type=LOCAL')), 'Expected sole synthetic provider calendar'
    calendar_id = int(re.search(r'_id=(\d+)', calendars).group(1))
    token = str(time.time_ns())
    title = 'PenguinSyncReminder' + token
    start = int(time.time() * 1000) + 45000
    uri = ('content://com.android.calendar/events?caller_is_syncadapter=true'
           '&account_name=penguin-test&account_type=LOCAL')
    shell('content', 'insert', '--uri', uri,
          '--bind', f'calendar_id:i:{calendar_id}', '--bind', 'title:s:' + title,
          '--bind', 'description:s:' + EXCHANGE, '--bind', f'dtstart:l:{start}',
          '--bind', f'dtend:l:{start + 3600000}', '--bind', 'eventTimezone:s:UTC',
          '--bind', 'hasAlarm:i:1', '--bind', '_sync_id:s:' + token)
    events = shell('content', 'query', '--uri', 'content://com.android.calendar/events',
                   '--projection', '_id:title', '--where', f"title='{title}'")
    assert events.count('Row:') == 1, events
    event_id = int(re.search(r'_id=(\d+)', events).group(1))
    reminders_uri = ('content://com.android.calendar/reminders?caller_is_syncadapter=true'
                     '&account_name=penguin-test&account_type=LOCAL')
    shell('content', 'insert', '--uri', reminders_uri, '--bind', f'event_id:i:{event_id}',
          '--bind', 'minutes:i:0', '--bind', 'method:i:1')
    shell('am', 'broadcast', '--user', '0', '-n', PKG + '/.receivers.CalDAVSyncReceiver')
    db = '/data/user/0/' + PKG + '/databases/events.db'
    query = "select id,source,reminder_1_minutes,description from events where title='" + title + "';"
    row = ''
    for _ in range(120):
        row = shell('sqlite3', db, query).strip()
        if row:
            break
        time.sleep(.25)
    columns = row.split('|', 3)
    assert len(columns) == 4 and columns[1] == f'Caldav-{calendar_id}' and columns[2] == '0', row
    assert columns[3] == EXCHANGE, 'Sync changed the original description'
    native_id = int(columns[0])
    alarm = shell('dumpsys', 'alarm')
    assert PKG + '/.receivers.NotificationReceiver' in alarm, 'No Calendar reminder scheduled'
    deadline = time.monotonic() + 80
    while time.monotonic() < deadline:
        dump = shell('dumpsys', 'notification', '--noredact')
        records = re.split(r'(?=    NotificationRecord\()', dump)
        matching = [r for r in records if f'pkg={PKG} ' in r and f'id={native_id} ' in r
                    and f'android.title=String ({title})' in r]
        if matching:
            record = matching[0]
            text = re.search(r'android\.text=String \((.*?)\)', record)
            expanded = re.search(r'android\.bigText=String \((.*?)\)', record)
            assert text and expanded and text.group(1) == expanded.group(1), 'Collapsed/expanded mismatch'
            value = text.group(1)
            assert 'Workshop schedule confirmed.' in value
            if a.baseline:
                assert '<html>' in value, value
            else:
                assert all(tag not in value for tag in ('<html>', '<div', '<font')), value
            assert shell('sqlite3', db, query).strip().split('|', 3)[3] == EXCHANGE
            print(('baseline' if a.baseline else 'patched') + ': provider import, scheduled reminder, notification and unchanged source PASS')
            return
        time.sleep(1)
    raise AssertionError('Scheduled reminder did not produce a notification')


if __name__ == '__main__':
    main()
