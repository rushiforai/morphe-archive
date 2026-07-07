# Investigation: Reddit Permanent-Ban Banner

Inspected app: Reddit Android `com.reddit.frontpage`, version `2026.10.0`, version code `2610110`.

Input bundle: `D:\Users\Bernardo\Documents\com.reddit.frontpage_2026.10.0-2610110_3arch_7dpi_22lang_154a27aded55e3228b79c07a8faa8c21_apkmirror.com.apkm`.

The APKM was unpacked and `base.apk` plus language/resource splits were inspected with JADX and apktool. The relevant resources are in `base.apk`; the APKM metadata identifies the package as `com.reddit.frontpage` and version as `2026.10.0`.

## Found Strings And Resources

The exact user-provided wording is assembled from string resources rather than present as one literal:

- `go_to_inbox`, id `0x7f130e9c`: `Visit Inbox`
- `suspended_user_banner_text`, id `0x7f1323ae`: `%s Check your inbox for a message with more information.`
- `user_suspended_permanently_banner_text`, id `0x7f132579`: `This account has been banned permanently.`
- `user_suspended_reset_password_locked_banner_text`, id `0x7f13257a`: password-reset locked-account banner text
- `user_suspended_url_reset_password`, id `0x7f13257b`: reset-password URL used in the inbox banner flow

The web banner text supplied during the investigation says `This account has been permanently banned...`; the Android resource for Reddit `2026.10.0` says `This account has been banned permanently.` and then wraps it with the shared inbox guidance string.

## Banner Text Builder

The banner text is built in:

- Class: `Lip1/c;`
- Method: `j(Landroid/content/res/Resources;)Ljava/lang/String;`

This method reads `Lcom/reddit/session/p;->isSuspended()Z`, `getSuspensionExpirationUtc()`, and a `SuspendedReason`. It returns:

- the password-reset lockout banner for the password-reset suspended reason;
- a temporary suspension banner when there is a suspension expiry;
- the permanent-ban banner by loading `user_suspended_permanently_banner_text` and formatting it through `suspended_user_banner_text`.

This method is narrow to suspended-account banner text, but it is not the final patch target because returning an empty string would still let the UI render an empty banner and button.

## UI Render Targets

Only two call sites of `Lip1/c;->j(Resources)` were found:

- `Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/HomePagerScreen;->O5(Landroidx/compose/ui/s;Landroidx/compose/runtime/l;I)V`
- `Lcom/reddit/notification/impl/ui/pager/InboxTabPagerScreen;->u5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;`

The home screen call site passes the generated message to `Lm22/e;->i(...)`, a Compose banner renderer. The inbox screen call site passes the generated message into `Lcom/reddit/notification/impl/ui/notifications/compose/b1;` and then sets a `RedditComposeView` content for the banner.

## Patch Target

The patch targets the two UI render call sites, not session/account APIs:

- Home: skip the `Lm22/e;->i(...)` banner renderer when the generated message contains `This account has been banned permanently.`
- Inbox: skip the suspended-user banner content setup when the generated message contains `This account has been banned permanently.`

This is narrow enough because it does not change `isSuspended()`, `SuspendedReason`, API requests, or any account-status data. Other suspended-account states, such as temporary suspensions or password-reset lockout banners, do not contain the permanent-ban sentence and are left alone.

## Limitations

The target was verified against Reddit Android `2026.10.0 / 2610110`. The patch relies on the current permanent-ban resource wording and on the two UI call sites found in that version. Future Reddit releases may rename, move, or restructure these Compose methods.
