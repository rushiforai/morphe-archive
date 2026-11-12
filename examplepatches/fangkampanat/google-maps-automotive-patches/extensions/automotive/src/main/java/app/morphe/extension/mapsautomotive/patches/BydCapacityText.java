package app.morphe.extension.mapsautomotive.patches;

import java.util.Locale;

/**
 * The BYD battery dialog's capacity texts. At 10% SOC or more the capacity is the car's own figure (remaining kWh over
 * SOC), so Maps shows the dashboard's percentage; on every car seen it is a few percent below the size on the spec
 * sheet, which owners read as a wrong value, so the texts call it usable and say where it comes from. Plain Java.
 */
final class BydCapacityText {
    /** Where the capacity comes from: the reading itself (10% SOC or more), else the one measured earlier at 50% SOC or
     *  more, a manual one of a legacy setting, or the default before any was measured (a new install, a head-unit
     *  firmware update or cleared data). */
    static final int FROM_CAR = 0, FROM_MEASURED = 1, FROM_MANUAL = 2, FROM_DEFAULT = 3;
    /** Keeps each number with its unit. */
    private static final String NBSP = " ";

    private BydCapacityText() {
    }

    /** The source of a capacity below 10% SOC, from BydVehicleModel.lowSocCapacityBasis. */
    static int from(String lowSocBasis) {
        if ("measured_capacity".equals(lowSocBasis)) return FROM_MEASURED;
        if ("manual_capacity".equals(lowSocBasis)) return FROM_MANUAL;
        return FROM_DEFAULT;
    }

    /** Whether the capacity comes from the car's readings, so the texts may call it usable. */
    static boolean fromReadings(int from) {
        return from == FROM_CAR || from == FROM_MEASURED;
    }

    /** The details label: "Usable capacity" from the car's readings, else "Capacity". */
    static String label(int from, boolean thai) {
        return fromReadings(from) ? (thai ? "ความจุที่ใช้ได้" : "Usable capacity") : (thai ? "ความจุ" : "Capacity");
    }

    /** The battery line beside the percentage: "48.6 of 87.6 kWh usable"; without "usable" for a set capacity. */
    static String energyLine(int energyWh, int capacityWh, int from, boolean thai) {
        boolean usable = fromReadings(from);
        return String.format(Locale.ROOT, thai ? "%.1f จาก %.1f" + NBSP + "kWh" + (usable ? " ที่ใช้ได้" : "")
                : "%.1f of %.1f" + NBSP + "kWh" + (usable ? " usable" : ""), energyWh / 1000.0, capacityWh / 1000.0);
    }

    /** The details value of the usable capacity, with where it comes from. */
    static String usable(int capacityWh, int from, boolean thai) {
        double kwh = capacityWh / 1000.0;
        switch (from) {
            case FROM_MEASURED:
                // Measured at a higher SOC, so Maps' percentage may differ from the car's by a point.
                return String.format(Locale.ROOT, thai
                        ? "%.1f" + NBSP + "kWh วัดไว้ก่อนหน้าจากค่าที่รถรายงาน มักน้อยกว่าความจุในสเปคไม่กี่ %%"
                        : "%.1f" + NBSP + "kWh, measured earlier from the car's readings. Usually a few percent below the"
                        + " size on the spec sheet.", kwh);
            case FROM_MANUAL:
                return String.format(Locale.ROOT, thai ? "%.1f" + NBSP + "kWh ค่าที่ตั้งเอง"
                        : "%.1f" + NBSP + "kWh, set by hand", kwh);
            case FROM_DEFAULT:
                return String.format(Locale.ROOT, thai ? "%.1f" + NBSP + "kWh ค่าเริ่มต้น จนกว่าแบตจะถึง 10%%"
                        : "%.1f" + NBSP + "kWh, a default until the battery reaches 10%%", kwh);
            default:
                return String.format(Locale.ROOT, thai
                        ? "%.1f" + NBSP + "kWh จากค่าที่รถรายงาน Maps จึงแสดง %% ตรงกับรถ มักน้อยกว่าความจุในสเปคไม่กี่ %%"
                        : "%.1f" + NBSP + "kWh from the car's readings, so Maps shows the same %% as the car. Usually a few"
                        + " percent below the size on the spec sheet.", kwh);
        }
    }
}
