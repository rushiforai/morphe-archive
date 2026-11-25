package nl.flitsmeister.fmcore.models.eventbuses;
public final class AppNotificationBus {
 public static boolean version15;
 public static Object getBusAlertedReports() throws Exception { return Class.forName(version15 ? "as7" : "fs7").getConstructor().newInstance(); }
}
