package e.e.a;
public final class FrameScheduleRegression {
    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
    static int simulate(int refresh, int fps) {
        long target = 1_000_000_000L / fps, due = 0L;
        int frames = 0;
        for (int tick = 0; tick < refresh * 10; tick++) {
            long now = Math.round(tick * (1_000_000_000.0 / refresh));
            if (due == 0L || now + 500_000L >= due) {
                frames++;
                long updated = CommentFrames.nextDeadline(due, now, target);
                check(updated > now, "next deadline must be in future");
                due = updated;
            }
        }
        return frames;
    }
    public static void main(String[] args) {
        for (int hz : new int[]{60, 90, 120}) {
            for (int fps : new int[]{25, 30, 60, 90, 120}) {
                int count = simulate(hz, fps);
                check(Math.abs(count - Math.min(hz, fps) * 10) <= 1,
                        "unexpected frames: " + hz + "Hz " + fps + "fps -> " + count);
            }
        }
        long period = 16_666_666L;
        check(CommentFrames.nextDeadline(period, 200_000_000L, period) > 200_000_000L,
                "do not draw lagged frames in bursts");
        check(CommentFrames.nextDeadline(period, period, period) == 2 * period,
                "fractional phase must persist");
        System.out.println("PASS: VSYNC pacing 60/90/120 Hz, 25/30/60/90/120 fps, late frames");
    }
}
