package app.local.extension.curve;
/** Offline lock owner only; the financial service is never loaded by this test APK. */
final class BatchGbitService { static final Object LOCK=new Object(); static volatile boolean running; }
