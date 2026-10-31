package app.template.extension.niagaralauncher;

import org.json.*;

import java.time.*;
import java.util.*;

public class WeatherCoreTest {
    static int checks;

    static void eq(Object actual, Object expected) {
        checks++;
        if (!Objects.equals(actual, expected))
            throw new AssertionError("Expected " + expected + " got " + actual);
    }

    static void bad(Runnable r) {
        checks++;
        try {
            r.run();
            throw new AssertionError("Unsafe/invalid expression accepted");
        } catch (IllegalArgumentException | ArithmeticException expected) {
        }
    }

    static WeatherData data(String source, double temperature, int condition) {
        WeatherData d = new WeatherData();
        d.source = source;
        d.current = new WeatherData.Point(1000);
        d.current.numbers.put("temp", temperature);
        d.current.condition = condition;
        d.current.description = "condition " + condition;
        d.current.icon = "01d";
        return d;
    }

    public static void main(String[] args) throws Exception {
        WeatherTemplate.Vars v = new WeatherTemplate.Vars(44.98, -93.27, 1);
        eq(WeatherTemplate.render("{n+1}", v, false), "2");
        eq(WeatherTemplate.render("{lat},{lon},{n}", v, false), "44.98,-93.27,1");
        eq(
                WeatherTemplate.render(
                        "{if (n == 0) \"one\" else if (n == 1) \"two\" else \"other\"}", v, false),
                "two");
        eq(
                WeatherTemplate.render(
                        "https://example.org/{n*3}?lat={lat}&lon={lon}&name={\"a b\"}", v, true),
                "https://example.org/3?lat=44.98&lon=-93.27&name=a%20b");
        eq(
                WeatherTemplate.render("{if (n > 0 && lon < 0) \"west\" else \"east\"}", v, false),
                "west");
        eq(WeatherTemplate.render("{if (true) 7 else 1/0}", v, false), "7");
        eq(WeatherTemplate.render("{(-5)/2}", v, false), "-2");
        eq(WeatherTemplate.render("{2+3*4}", v, false), "14");
        eq(WeatherTemplate.render("{(2+3)*4}", v, false), "20");
        JSONObject root =
                new JSONObject(
                        "{\"weather\":[{\"description\":\"clear\"},{\"description\":\"cloudy\"}],\"named\":{\"two\":7,\"2\":8},\"44.98\":{\"-93.27\":9},\"a.b\":10}");
        eq(WeatherTemplate.resolve(root, "x.weather[{n}].description", v), "cloudy");
        eq(WeatherTemplate.resolve(root, "x.named.{if (n==1) \"two\" else \"one\"}", v), 7);
        eq(WeatherTemplate.resolve(root, "x.named.{n+1}", v), 8);
        eq(WeatherTemplate.resolve(root, "x[\"{lat}\"][\"{lon}\"]", v), 9);
        eq(WeatherTemplate.resolve(root, "x[\"a.b\"]", v), 10);
        eq(WeatherTemplate.resolve(root, "", v), root);
        for (String s :
                new String[] {
                    "{Runtime.getRuntime()}",
                    "{java.lang.System}",
                    "{unknown}",
                    "{n/0}",
                    "{if (n) 1 else 0}",
                    "{n; 4}",
                    "{\"unterminated}",
                    "{1e9999}"
                }) bad(() -> WeatherTemplate.render(s, v, false));
        bad(() -> WeatherTemplate.resolve(root, "x.weather[-1]", v));
        bad(() -> WeatherTemplate.resolve(root, "x.weather[{lat}]", v));
        WeatherData a = data("A", 10, 800), b = data("B", 20, 501), c = data("C", 30, 501);
        a.current.numbers.put("pop", 0.8);
        b.current.numbers.put("feels_like", 18.0);
        WeatherData mean = WeatherData.merge(Arrays.asList(a, b, c), true);
        eq(mean.current.numbers.get("temp"), 20.0);
        eq(mean.current.numbers.get("pop"), 0.8);
        eq(mean.current.numbers.get("feels_like"), 18.0);
        eq(mean.current.condition, 501);
        eq(WeatherData.merge(Arrays.asList(a, b), true).current.condition, 800);
        WeatherData priority = WeatherData.merge(Arrays.asList(a, b), false);
        eq(priority.current.numbers.get("temp"), 10.0);
        eq(priority.current.numbers.get("feels_like"), 18.0);
        b.current.time = 2000;
        WeatherData merged = WeatherData.merge(Arrays.asList(a, b), true);
        eq(merged.current.time, 2000L);
        WeatherData roundtrip = WeatherData.read(mean.json());
        eq(roundtrip.current.numbers.get("temp"), 20.0);
        eq(roundtrip.current.condition, 501);
        ZoneId zone = ZoneId.of("America/New_York");
        long now = Instant.parse("2026-10-23T16:00:00Z").getEpochSecond();
        a.current.time = now;
        JSONObject nativeOnly = a.nativeJson(44.98, -93.27, now, zone);
        eq(nativeOnly.getJSONObject("forecast").getJSONArray("hourly").length(), 0);
        eq(nativeOnly.getJSONObject("forecast").getJSONArray("daily").length(), 0);
        eq(
                WeatherData.day(Instant.parse("2026-11-01T06:30:00Z").getEpochSecond(), zone),
                Instant.parse("2026-11-01T04:00:00Z").getEpochSecond());
        eq(WeatherTemplate.render("{2 + if (n==1) 3 else 4}", v, false), "5");
        bad(() -> WeatherTemplate.render("{" + "!".repeat(100) + "true}", v, false));
        for (int code : new int[] {80, 81, 82}) eq(WeatherProviders.wmo(code), 501);
        for (int code : new int[] {71, 73, 75, 77, 85, 86}) eq(WeatherProviders.wmo(code), 601);
        WeatherSource custom = new WeatherSource("custom", "Custom", "custom");
        custom.url = "https://example.org/{n+1}?lat={lat}&lon={lon}";
        custom.temperature = "F";
        custom.probability = "percent";
        custom.codes = "WMO";
        custom.mappings
                .put("current.temp", "x.temp")
                .put("current.dt", "x.time")
                .put("current.id", "x.code")
                .put("hourly.dt", "x.hours[{n}].time")
                .put("hourly.temp", "x.hours[{n}].temp")
                .put("hourly.pop", "x.hours[{n}].prob");
        JSONObject customResponse =
                new JSONObject()
                        .put("time", now)
                        .put("temp", 68)
                        .put("code", 80)
                        .put(
                                "hours",
                                new JSONArray()
                                        .put(
                                                new JSONObject()
                                                        .put("time", now + 3600)
                                                        .put("temp", 50)
                                                        .put("prob", 75)));
        java.util.List<String> calls = new ArrayList<>();
        WeatherData parsed =
                WeatherProviders.fetch(
                        custom,
                        44.98,
                        -93.27,
                        now,
                        zone,
                        url -> {
                            calls.add(url);
                            return customResponse;
                        });
        eq(calls.size(), 1);
        eq(calls.get(0), "https://example.org/1?lat=44.98&lon=-93.27");
        eq(parsed.current.numbers.get("temp"), 20.0);
        eq(parsed.current.condition, 501);
        eq(parsed.hourly.firstEntry().getValue().numbers.get("temp"), 10.0);
        eq(parsed.hourly.firstEntry().getValue().numbers.get("pop"), 0.75);
        WeatherSource draft = custom.copy();
        draft.mappings.put("current.temp", "x.other");
        eq(custom.mappings.getString("current.temp"), "x.temp");
        WeatherSource scalar = new WeatherSource("scalar", "Scalar", "custom");
        scalar.url = "https://example.org/{lat}/{lon}/{n}";
        scalar.mappings.put("current.temp", "x");
        WeatherData scalarData = WeatherProviders.fetch(scalar, 0, 0, now, zone, url -> 12.5);
        eq(scalarData.current.numbers.get("temp"), 12.5);
        WeatherSource indexed = new WeatherSource("indexed", "Indexed", "custom");
        indexed.url = "https://example.org/{if(n==0) \"today\" else \"tomorrow\"}";
        indexed.mode = "daily";
        indexed.count = 2;
        indexed.mappings.put("daily.dt", "x.time");
        for (String key : new String[] {"day", "min", "max", "morn", "eve", "night"})
            indexed.mappings.put("daily." + key, "x.temp");
        java.util.List<String> dailyCalls = new ArrayList<>();
        WeatherData indexedData =
                WeatherProviders.fetch(
                        indexed,
                        0,
                        0,
                        now,
                        zone,
                        url -> {
                            dailyCalls.add(url);
                            return new JSONObject()
                                    .put("time", now + (url.endsWith("tomorrow") ? 86400 : 0))
                                    .put("temp", 12);
                        });
        eq(dailyCalls.size(), 2);
        eq(indexedData.daily.size(), 2);
        WeatherSource first = new WeatherSource("A", "A", "custom"),
                second = new WeatherSource("B", "B", "custom"),
                disabled = new WeatherSource("D", "D", "custom");
        disabled.enabled = false;
        java.util.List<String> visited = new ArrayList<>();
        WeatherData selected =
                WeatherSelection.select(
                        Arrays.asList(disabled, first, second),
                        false,
                        profile -> {
                            visited.add(profile.id);
                            if (profile.id.equals("A")) return a;
                            return b;
                        },
                        now,
                        zone,
                        1000,
                        () -> {});
        eq(visited, Arrays.asList("A", "B"));
        eq(selected.current.numbers.get("temp"), 10.0);
        eq(selected.current.numbers.get("feels_like"), 18.0);
        java.util.concurrent.CountDownLatch started = new java.util.concurrent.CountDownLatch(2);
        WeatherData parallel =
                WeatherSelection.select(
                        Arrays.asList(first, second),
                        true,
                        profile -> {
                            started.countDown();
                            if (!started.await(1, java.util.concurrent.TimeUnit.SECONDS))
                                throw new AssertionError("Sources did not start concurrently");
                            return profile.id.equals("A") ? a : b;
                        },
                        now,
                        zone,
                        2000,
                        () -> {});
        eq(parallel.current.numbers.get("temp"), 15.0);
        WeatherData survived =
                WeatherSelection.select(
                        Arrays.asList(first, second),
                        true,
                        profile -> {
                            if (profile.id.equals("A"))
                                throw new java.io.IOException("fixture failure");
                            return b;
                        },
                        now,
                        zone,
                        1000,
                        () -> {});
        eq(survived.current.numbers.get("temp"), 20.0);
        bad(
                () -> {
                    try {
                        WeatherSelection.select(
                                Collections.emptyList(),
                                false,
                                profile -> {
                                    throw new AssertionError("Disabled source fetched");
                                },
                                now,
                                zone,
                                1000,
                                () -> {});
                    } catch (IllegalArgumentException e) {
                        throw e;
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                });
        WeatherTemplate.validatePointer("x.weather[{n+1}].description", v);
        bad(() -> WeatherTemplate.validatePointer("x.weather[", v));
        bad(() -> WeatherTemplate.validatePointer("xfoo", v));
        WeatherData timeoutSurvivor =
                WeatherSelection.select(
                        Arrays.asList(first, second),
                        true,
                        profile -> {
                            if (profile.id.equals("A")) {
                                Thread.sleep(2000);
                                return a;
                            }
                            return b;
                        },
                        now,
                        zone,
                        100,
                        () -> {});
        eq(timeoutSurvivor.current.numbers.get("temp"), 20.0);
        System.out.println(
                "PASS "
                        + checks
                        + " template, safety, merge, missing-data, current-only and timezone"
                        + " checks");
    }
}
