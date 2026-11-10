package io.github.bryceaspringfield.morphe.extension.youtube;

/** Video lengths typed by the user: h:mm:ss, m:ss, or a number of minutes (decimals allowed). */
final class Lengths {

    private Lengths() {
    }

    /** Seconds, or -1 for a blank or unreadable length. */
    static int parse(String raw) {
        if (raw == null) return -1;
        String s = raw.trim().toLowerCase().replace("min", "").replace("m", "").trim();
        if (s.isEmpty()) return -1;
        try {
            if (s.contains(":")) {
                String[] p = s.split(":");
                int total = 0;
                for (String x : p) total = total * 60 + Integer.parseInt(x.trim());
                return total;
            }
            return (int) Math.round(Double.parseDouble(s.replace(',', '.')) * 60);
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}
