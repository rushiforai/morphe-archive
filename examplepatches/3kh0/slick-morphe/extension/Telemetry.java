package slick.android;

import java.io.IOException;
import java.util.Locale;

public final class Telemetry {
  public static boolean blocked() {
    return Settings.enabled("block_telemetry");
  }

  public static void checkRequest(String host, String path) throws IOException {
    if (blocked() && isTelemetry(host, path)) throw new IOException("Blocked telemetry request");
  }

  static boolean isTelemetry(String host, String path) {
    if (host == null) return false;
    String normalized = host.toLowerCase(Locale.ROOT);
    for (String domain : new String[] {"slackb.com", "slackb-gov.com", "slackb.mil"}) {
      if (normalized.equals(domain) || normalized.endsWith("." + domain)) return true;
    }
    boolean slackHost = false;
    for (String domain : new String[] {"slack.com", "slack-gov.com", "slack.mil"}) {
      if (normalized.equals(domain) || normalized.endsWith("." + domain)) slackHost = true;
    }
    if (!slackHost || path == null) return false;
    for (String endpoint :
        new String[] {"/api/client.clog.track", "/api/clog.track", "/api/slog.track"}) {
      if (path.equals(endpoint) || path.startsWith(endpoint + "/")) return true;
    }
    return path.startsWith("/apps/sentryproxy/");
  }
}
