# Local LINE Official Account Test Sender

A standalone local developer utility for sending controlled test notifications to **your own LINE account** using the official LINE Messaging API (`Create Official Account → Enable Messaging API → Add yourself as friend → Send from PC`). Because it sends one-way push messages to your own `userId`, no webhook server, public URL, or Channel secret is needed. **This tool is not bundled in `.mpp` or patched LINE APKs.**

## 1. Create a test Official Account

1. Sign in to [LINE Official Account Manager](https://manager.line.biz/) with a Business ID linked to your LINE account and create a dedicated test account (e.g., `LINE Notify Test`). See [Messaging API getting started](https://developers.line.biz/en/docs/messaging-api/getting-started/).
2. In the account's web dashboard, go to **Settings → Messaging API → Enable Messaging API** and select a personal test provider (providers cannot be changed later). See [Official Account Messaging API setup](https://www.lycbiz.com/jp/manual/OfficialAccountManager/account-settings_messaging_api/).

## 2. Add friend & obtain credentials

Open [LINE Developers Console](https://developers.line.biz/console/) → your provider → your Messaging API channel:

* Scan the **Messaging API** tab QR code from your phone's LINE app to add the test Official Account as a friend.
* Under **Channel access token (long-lived)**, click **Issue** to generate a test token.
* Under **Basic settings → Your user ID**, copy the 33-character ID starting with `U`.

Never commit or paste tokens or user IDs into chats or public repositories. The PC tool keeps credentials in memory only and never writes them to disk.

## 3. Run the PC sender tool

Double-click `LINE-test-sender.bat` or run:

```powershell
python scripts/line_test_sender.py
```

1. Enter your Channel access token and Your user ID.
2. Start with **1 message** and a **10s delay**, put LINE in the background on your phone, and verify delivery.
3. Read the room to reset unread count, then test 2 or 26 messages (`short`, `long`, `lines`, `mixed`; batch size 1 or 5).
4. Requests target `https://api.line.me/v2/bot/message/push` only, block HTTP redirects (`NoRedirect`) so bearer tokens are never forwarded, do not auto-retry on timeout/error, and never print response bodies or credentials.

## Offline unit tests & dry run

```powershell
python -m unittest discover -s tests -p test_line_test_sender.py -v
python scripts/line_test_sender.py --dry-run --count 26 --kind mixed
```

All 8 offline tests pass (26-message batching/order, invalid target/header rejection, sanitized errors without secret leakage, redirect blocking, cancellation before send, and no automatic retry).
