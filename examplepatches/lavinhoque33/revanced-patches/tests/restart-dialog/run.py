#!/usr/bin/env python3
# Copyright (C) 2026 lavinhoque33
# Licensed under the GNU General Public License v3.0 or later.
# Written by lavinhoque33, 2026-11-17.
"""Exercise the actual shared restart presenter with deterministic Android boundaries."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / ('extensions/shared/src/main/java/app/morphe/extension/shared/'
                 'settings/preference/AbstractPreferenceFragment.java')

BOUNDARIES = r'''
import java.util.ArrayDeque;
import java.util.function.Consumer;
import java.util.function.Supplier;
@interface NonNull {}
class Context {}
class Activity extends Context {
    boolean finishing, destroyed;
    boolean isFinishing() { return finishing; }
    boolean isDestroyed() { return destroyed; }
}
class LinearLayout {}
class Pair<A, B> {
    A first;
    Pair(A value) { first = value; }
}
class Dialog {
    Consumer<Dialog> dismiss;
    boolean cancelable = true, outside = true;
    void setOnDismissListener(Consumer<Dialog> listener) { dismiss = listener; }
    void setCancelable(boolean value) { cancelable = value; }
    void setCanceledOnTouchOutside(boolean value) { outside = value; }
    void show() {
        if (CustomDialog.failShow) throw new IllegalStateException("Host abandoned");
    }
    void dismiss() { dismiss.accept(this); }
}
class CustomDialog {
    static int count;
    static boolean failShow;
    static String message, button;
    static Dialog last;
    static Pair<Dialog, LinearLayout> create(Context context, String title, String text, Object edit,
            String positive, Runnable action, Object cancel, Object neutral, Object onNeutral, boolean close) {
        count++;
        message = text;
        button = positive;
        return new Pair<>(last = new Dialog());
    }
}
class Logger {
    static void printDebug(Supplier<String> message) {}
}
class Utils {
    static ArrayDeque<Runnable> pending = new ArrayDeque<>();
    static int restarts;
    static long delay;
    static void verifyOnMainThread() {}
    static void runOnMainThreadDelayed(Runnable action, long milliseconds) {
        delay = milliseconds;
        pending.add(action);
    }
    static void restartApp(Context context) {
        check(!RestartDialogTest.showRestartDialogIfNeeded(context) || CustomDialog.count == 1,
                "Restart execution must retain the presentation guard");
        restarts++;
    }
    static void check(boolean result, String message) { RestartDialogTest.check(result, message); }
}
'''

TEST = r'''
    static String str(String key) { return key; }
    static void check(boolean result, String message) {
        if (!result) throw new AssertionError(message);
    }
    static void reset() {
        restartNeeded = showingRestartDialog = false;
        CustomDialog.count = Utils.restarts = 0;
        CustomDialog.failShow = false;
        Utils.pending.clear();
    }
    public static void main(String[] args) {
        Activity activity = new Activity();
        check(!showRestartDialogIfNeeded(activity), "No change must not prompt");
        setRestartNeeded();
        check(showRestartDialogIfNeeded(activity), "Changed setting must prompt");
        check(CustomDialog.count == 1 && !restartNeeded, "Shown prompt consumes pending flag");
        check(showRestartDialogIfNeeded(activity), "Visible prompt must block settings exit");
        setRestartNeeded();
        check(!restartNeeded, "Visible prompt must not re-arm pending flag");
        check(showRestartDialog(activity) == null, "Direct duplicate must be ignored");
        CustomDialog.last.dismiss();
        check(showingRestartDialog, "Dismissal must retain guard until restart");
        check(showRestartDialogIfNeeded(activity), "Delayed restart must block another prompt");
        check(CustomDialog.count == 1 && !restartNeeded, "No second pending prompt");
        Utils.pending.remove().run();
        check(Utils.restarts == 1 && !showingRestartDialog, "Exactly one restart");
        check(!showRestartDialogIfNeeded(activity), "Restart must not leave a pending prompt");

        reset();
        Dialog firstRun = showRestartDialog(activity, "first run", 1000, false);
        check(!firstRun.cancelable && !firstRun.outside, "First run must not be cancelable");
        check("first run".equals(CustomDialog.message), "Custom first-run message");
        check("revanced_restart".equals(CustomDialog.button), "Modern restart button");
        firstRun.dismiss();
        check(Utils.delay == 1000, "Keep first-run restart delay");
        check(showRestartDialog(activity) == null, "No prompt during first-run delay");
        Utils.pending.remove().run();
        check(Utils.restarts == 1 && !restartNeeded, "First run restarts exactly once");

        reset();
        setRestartNeeded();
        activity.destroyed = true;
        check(showRestartDialog(activity) == null, "Dead activity cannot present");
        check(restartNeeded && !showingRestartDialog, "Dead host retains change without guard");
        activity.destroyed = false;
        showRestartDialogIfNeeded(activity);
        CustomDialog.last.dismiss();
        activity.finishing = true;
        Utils.pending.remove().run();
        check(Utils.restarts == 0 && restartNeeded && !showingRestartDialog,
                "Abandoned host releases guard and preserves required restart");
        activity.finishing = false;
        check(showRestartDialogIfNeeded(activity), "Replacement host can prompt");

        reset();
        setRestartNeeded();
        CustomDialog.failShow = true;
        try {
            showRestartDialogIfNeeded(activity);
            throw new AssertionError("Expected presentation failure");
        } catch (IllegalStateException expected) {
            check(restartNeeded && !showingRestartDialog, "Failed show releases guard without losing change");
        }
        System.out.println("Restart dialog regression tests passed (5 scenarios)");
    }
'''


def main():
    source = SOURCE.read_text()
    start = source.index('    private static boolean restartNeeded;')
    end = source.index('    @SuppressLint("ResourceType")', start)
    methods = source[start:end]
    java = (BOUNDARIES + '\npublic class RestartDialogTest {\n'
            + '    static boolean showingRestartDialog;\n'
            + '    static String restartDialogTitle, restartDialogMessage, restartDialogButtonText;\n'
            + methods + TEST + '\n}\n')
    java_home = os.environ.get('JAVA_HOME')
    def tool(name):
        return str(Path(java_home) / 'bin' / name) if java_home else name
    with tempfile.TemporaryDirectory(prefix='rvx-restart-tests-') as directory:
        output = Path(directory)
        path = output / 'RestartDialogTest.java'
        path.write_text(java)
        subprocess.run([tool('javac'), '-d', str(output), str(path)], check=True)
        subprocess.run([tool('java'), '-cp', str(output), 'RestartDialogTest'], check=True)


if __name__ == '__main__':
    main()
