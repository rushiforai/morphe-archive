package biz.kushan.ltkey;

import android.util.Log;

/** Thin logging wrapper — one tag, swallow any logging failure. */
final class DtLog {
    static final String TAG = "LtKey";
    static void i(String m) { try { Log.i(TAG, m); } catch (Throwable ignored) {} }
    static void w(String m, Throwable t) { try { Log.w(TAG, m, t); } catch (Throwable ignored) {} }
}
