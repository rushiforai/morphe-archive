package patches.gearslip;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.Intent;
import android.util.Log;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Absolute density for car projection; snapshot once so app metadata stays consistent mid-drive. */
public final class CarDensity {
    private static volatile int sessionDpi;

    private CarDensity() {
    }

    public static int begin(int original, String name) {
        if (!"gearslip-projection".equals(name) && !"gearslip-preview".equals(name)) return original;
        sessionDpi = selected(DrawerApps.context());
        int effective = hosted(original);
        Log.i("GearslipDensity", name + ": " + original + " -> " + effective + " DPI");
        return effective;
    }

    /** Used by both the hosted app's Configuration and its SurfaceContainer. Never multiply twice. */
    public static int hosted(int original) {
        int dpi = sessionDpi;
        return dpi == 0 ? original : dpi;
    }

    /** The preview caption composes before its display-start effect snapshots the new session. */
    public static int previewDpi(int original) {
        int dpi = selected(DrawerApps.context());
        return dpi == 0 ? original : dpi;
    }

    public static String title() {
        return DrawerApps.text("Dichtheid autoscherm", "Car display density");
    }

    public static String subtitle() {
        return DrawerApps.text("Grotere tekst en knoppen, ook in apps", "Larger text and controls, including in apps");
    }

    public static Function0<Unit> openAction() {
        return () -> {
            Context context = DrawerApps.context();
            context.startActivity(new Intent(context, CarDensityActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return Unit.INSTANCE;
        };
    }

    static int selected(Context context) {
        try {
            int dpi = prefs(context).getInt("dpi", 0);
            return valid(dpi) ? dpi : 0;
        } catch (ClassCastException error) {
            return 0;
        }
    }

    static void save(Context context, int dpi) {
        if (!valid(dpi)) throw new IllegalArgumentException("Unsupported car density: " + dpi);
        prefs(context).edit().putInt("dpi", dpi).apply();
    }

    private static boolean valid(int dpi) {
        return dpi == 0 || dpi == 160 || dpi == 180 || dpi == 200 || dpi == 220 || dpi == 240;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences("morphe_car_density", Context.MODE_PRIVATE);
    }
}
