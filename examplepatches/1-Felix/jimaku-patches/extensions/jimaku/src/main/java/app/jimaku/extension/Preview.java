package app.jimaku.extension;

import android.content.Context;
import android.os.SystemClock;
import android.provider.Settings;

import java.util.Locale;

import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;
import app.jimaku.extension.jobs.TimeLeft;
import app.jimaku.extension.jobs.TimedJob;
import app.jimaku.extension.gateway.Me;
import app.jimaku.extension.overlay.Message;
import app.jimaku.extension.session.AccountState;
import app.jimaku.extension.shared.Wording;

/**
 * The message and the button in each of their states, for screenshots of their look, in a build
 * made with {@code -Pjimaku.preview=true} only. The state is set from the shell, as
 * {@code adb shell settings put global jimaku_preview progress}, and read at most twice a second:
 * progress, reading, ask, failure, daily, busy, stopped, signed-in, or anything else for none. The
 * words are the extension's and the bar is the ported estimate's, for a 20-minute video translated to
 * German. Signed in, the menu reads a stand-in account with 300 minutes and the offer open.
 */
final class Preview {
    private static final String SETTING = "jimaku_preview";
    private static final String NAME = "German";

    /** What the button's bar shows, as the player keeps it for each button it makes. */
    interface Work {
        void set(boolean working, Glide glide, boolean failed);

        /** No preview state: the button shows the session's again. */
        void off();
    }

    private static final String SIGNED_IN = "{\"balance\":18000,\"signedIn\":true,\"accountId\":\"preview\",\"promotion\":"
            + "{\"availability\":\"open\",\"eligibility\":\"eligible\",\"text\":\"\",\"minutes\":60,\"endsAt\":1796083200000,"
            + "\"totalUsed\":3,\"totalLimit\":415,\"totalRemaining\":412,\"dailyUsed\":1,\"dailyLimit\":50,\"retryAt\":null}}";

    private final AccountState account;
    private String applied;

    Preview(AccountState account) {
        this.account = account;
    }
    private long readAt;

    void apply(Context context, Message message, Work button) {
        if (context == null || message == null) return;
        long now = SystemClock.uptimeMillis();
        if (now - readAt < 500) return;
        readAt = now;
        String state = Settings.Global.getString(context.getContentResolver(), SETTING);
        if (state == null) state = "";
        if (state.equals(applied)) return;
        applied = state;
        JimakuLog.info("Preview " + (state.isEmpty() ? "off" : state));
        show(state, message, button);
    }

    private void show(String state, Message message, Work button) {
        account.pretend(state.equals("signed-in") ? Me.parse(SIGNED_IN) : null);
        Locale locale = Locale.getDefault();
        Message.Action stop = new Message.Action(Wording.t(Wording.ACTION_STOP), () -> message.ask(Wording.t(Wording.ASK_STOP, NAME),
                () -> message.info(Wording.t(Wording.TOAST_STOPPED, NAME))));
        switch (state) {
            case "progress", "ask" -> {
                double at = System.currentTimeMillis();
                TimedJob job = new TimedJob(JobKind.CAPTIONS, JobState.TRANSLATING, 40.0, at - 120_000,
                        new TimedJob.Sample(at - 120_000, 10), new TimedJob.Sample(at - 5_000, 40));
                Glide glide = TimeLeft.progressOf(job, 1200, true, at);
                String percent = Wording.t(Wording.PROGRESS_PERCENT, "40");
                String step = Wording.t(Wording.PROGRESS_TRANSLATING_PERCENT, percent);
                String left = TimeLeft.timeLeftText(locale, TimeLeft.secondsLeft(job, 1200, true, at));
                String words = Wording.t(Wording.PROGRESS_LINE, NAME, left != null ? Wording.t(Wording.PROGRESS_LEFT, step, left) : step);
                message.progress(words, true, stop, percent, glide);
                if (state.equals("ask")) message.ask(Wording.t(Wording.ASK_STOP, NAME), () -> message.info(Wording.t(Wording.TOAST_STOPPED, NAME)));
                button.set(true, glide, false);
            }
            case "reading" -> {
                message.progress(Wording.t(Wording.PROGRESS_LINE, NAME, Wording.t(Wording.PROGRESS_READING)), true, stop, null, null);
                button.set(true, null, false);
            }
            case "failure" -> {
                message.hold(Wording.t(Wording.FAIL_UNREACHABLE), new Message.Action(Wording.t(Wording.ACTION_RETRY),
                        () -> show("reading", message, button)), null);
                button.set(false, null, true);
            }
            case "daily" -> {
                message.hold(Wording.t(Wording.FAIL_DAILY_LIMIT), null, null);
                button.set(false, null, false);
            }
            case "busy" -> {
                message.hold(Wording.t(Wording.FAIL_VIDEO_BUSY), null, null);
                button.set(false, null, false);
            }
            case "stopped" -> {
                message.info(Wording.t(Wording.TOAST_STOPPED, NAME));
                button.set(false, null, false);
            }
            default -> {
                message.hide();
                button.off();
            }
        }
    }
}
