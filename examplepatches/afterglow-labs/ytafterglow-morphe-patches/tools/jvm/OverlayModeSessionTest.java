import app.afterglow.extension.playback.OverlayModeSession;

public final class OverlayModeSessionTest {
    private static int checks;
    private static void check(String name, boolean value) {
        checks++;
        if (!value) throw new AssertionError(name);
    }
    private static void presentation(OverlayModeSession state, int mode, boolean controls, float alpha) {
        check("expected mode " + mode, state.mode() == mode);
        check("stock suppression", state.suppressStock() == (mode != 0));
        check("utility presentation", state.controlsVisible() == controls);
        check("eye opacity", Math.abs(state.eyeOpacity() - alpha) < .0001f);
    }
    public static void main(String[] args) {
        OverlayModeSession state = new OverlayModeSession();
        presentation(state, 0, true, 1f);
        check("fresh process has no timeout", state.deadline() == 0);
        check("native show in default is inert", !state.nativeShow(100));
        state.cycle(200);
        presentation(state, 1, true, .85f);
        check("pinned has no timer", state.deadline() == 0);
        check("pinned survives arbitrarily late timeout", !state.timeout(90000));
        state.cycle(1000);
        presentation(state, 2, true, .65f);
        check("timed starts exactly three seconds later", state.deadline() == 4000);
        check("repeated native show does not rearm", !state.nativeShow(3999) && state.deadline() == 4000);
        check("early timer cannot hide", !state.timeout(3999));
        check("deadline hides", state.timeout(4000));
        presentation(state, 2, false, .16f);
        check("hidden timer is cleared", state.deadline() == 0);
        check("duplicate timeout inert", !state.timeout(4001));
        check("fresh native show reveals timed row", state.nativeShow(5000));
        presentation(state, 2, true, .65f);
        check("fresh show owns new deadline", state.deadline() == 8000);
        check("stale earlier timeout cannot hide new row", !state.timeout(7000));
        state.cycle(7100);
        presentation(state, 3, false, .10f);
        check("eye only has no timer", state.deadline() == 0);
        check("native show cannot leave eye only", !state.nativeShow(9000));
        check("old timer cannot change eye only", !state.timeout(9000));
        state.cycle(10000);
        presentation(state, 0, true, 1f);
        check("fourth press cancels timer", state.deadline() == 0);
        state.cycle(11000);state.cycle(12000);state.timeout(15000);
        state.reset();
        presentation(state, 0, true, 1f);
        check("explicit reset clears deadline", state.deadline() == 0);
        state.cycle(16000);state.cycle(17000);state.reset();
        check("reset prevents pending timeout", !state.timeout(20000));
        presentation(new OverlayModeSession(), 0, true, 1f);
        System.out.println(checks + " overlay mode session checks passed");
    }
}
