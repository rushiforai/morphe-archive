package app.template.extension.niagaralauncher;

import java.time.*;

public final class WeatherApiSmokeTest {
    public static void main(String[] args) throws Exception {
        long now = Instant.now().getEpochSecond();
        ZoneId zone = ZoneId.of("Europe/Oslo");
        for (String kind : new String[] {"met", "open-meteo"}) {
            WeatherSource source = new WeatherSource(kind, kind, kind);
            WeatherData data =
                    WeatherProviders.fetch(
                            source, 59.91, 10.75, now, zone, WeatherProviders::request);
            if (data.current == null || !data.current.temperature() || data.hourly.size() < 24)
                throw new AssertionError("Missing current/hourly " + kind);
            org.json.JSONObject nativeData = data.nativeJson(59.91, 10.75, now, zone);
            int days = nativeData.getJSONObject("forecast").getJSONArray("daily").length();
            if (kind.equals("open-meteo") && days != 7)
                throw new AssertionError("Expected seven normalized daily forecasts, got " + days);
            System.out.println(
                    "PASS "
                            + kind
                            + ": real current data; hourly="
                            + data.hourly.size()
                            + "; native daily="
                            + days);
        }
    }
}
