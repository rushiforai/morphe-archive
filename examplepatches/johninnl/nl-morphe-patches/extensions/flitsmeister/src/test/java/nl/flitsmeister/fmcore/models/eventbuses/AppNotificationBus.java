package nl.flitsmeister.fmcore.models.eventbuses;
public final class AppNotificationBus {
 public static Object getBusAlertedReports() throws Exception { return Class.forName("fs7").getConstructor().newInstance(); }
}
