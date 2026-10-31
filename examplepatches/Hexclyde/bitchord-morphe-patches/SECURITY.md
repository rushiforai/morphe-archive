# Security

To report a vulnerability privately, use **Security → Report a vulnerability** on this repository. Please don't open a public issue for it.

Include the patch, BitChord and Android versions, along with steps to reproduce. Use test data only. Never send your API hash, login codes, password or session files.

If you think someone else has your Telegram session, revoke it in the official Telegram app under **Settings → Devices**.

## Known limits

- This project has not had an independent security audit.
- The patch runs inside BitChord's process, so it shares BitChord's access to the Telegram session.
- API credentials are encrypted on the device. Cached and downloaded audio is not.
