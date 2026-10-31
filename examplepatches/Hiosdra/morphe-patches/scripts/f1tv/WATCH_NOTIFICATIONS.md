## APK update monitor

The scheduled workflow runs daily at 06:17 UTC and can also be started manually.
It first requests APKMirror with Python's standard HTTP client. On HTTP or network
failure it uses curl_cffi with a browser TLS profile and up to three attempts.
Install the optional local dependency with:

```sh
python3 -m pip install -r scripts/f1tv/requirements-watch.txt
```

This transport can help with HTTP 403 but cannot guarantee access through an
interactive anti-bot challenge. If both transports fail, the workflow stays red
and creates a separate monitor-outage issue. An unavailable listing is never
reported as an up-to-date target.

A numerically newer mobile release creates a GitHub issue assigned to Hiosdra.
The same version is announced only once, including when its issue was closed.
An open outage issue is also deduplicated; a later outage reopens it if closed.
The workflow needs `issues: write` and serializes runs to prevent duplicate issues.
Fork maintainers should change WATCH_ASSIGNEE to their GitHub login.

For email delivery, enable **Settings → Notifications → Subscriptions →
Participating, @mentions and custom → Email** in GitHub, and ensure this repository
is not ignored. Assignment delivers a GitHub notification; email delivery depends
on the recipient's settings. No SMTP credentials are required. Workflow failure
emails are separate and depend on GitHub Actions notification settings.

After merging, manually run **Check F1 TV APK** to check the live listing and
exercise the notification path. No patch target is changed or APK downloaded.

Run the offline regression checks with:

```sh
python3 -m unittest discover -s scripts/f1tv -p 'test_apk_watch.py'
```
