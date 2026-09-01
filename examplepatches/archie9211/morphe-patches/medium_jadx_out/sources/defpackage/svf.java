package defpackage;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.view.MotionEvent;
import androidx.core.widget.nRCC.nGxjfIr;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class svf {
    public final long a;
    public final qvf b;
    public long c;

    public final void a(String str, MotionEvent motionEvent) {
        long eventTime = motionEvent.getEventTime();
        if (eventTime - this.c < this.a) {
            return;
        }
        SQLiteDatabase writableDatabase = this.b.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(kp7.F(vqf.MEC_ACTIVITY_NAME), str.getBytes(wk1.a));
        contentValues.put(kp7.F(vqf.MEC_DOWN_TIME), Long.valueOf(motionEvent.getDownTime()));
        contentValues.put(kp7.F(vqf.MEC_EVENT_TIME), Long.valueOf(motionEvent.getEventTime()));
        contentValues.put(kp7.F(vqf.MEC_ACTION), Integer.valueOf(motionEvent.getAction()));
        contentValues.put(kp7.F(vqf.MEC_POINTER_COUNT), Integer.valueOf(motionEvent.getPointerCount()));
        contentValues.put(kp7.F(vqf.MEC_META_STATE), Integer.valueOf(motionEvent.getMetaState()));
        contentValues.put(kp7.F(vqf.MEC_BUTTON_STATE), Integer.valueOf(motionEvent.getButtonState()));
        contentValues.put(kp7.F(vqf.MEC_X), Float.valueOf(motionEvent.getRawX()));
        contentValues.put(kp7.F(vqf.zzk), Float.valueOf(motionEvent.getRawY()));
        contentValues.put(kp7.F(vqf.MEC_DEVICE_ID), Integer.valueOf(motionEvent.getDeviceId()));
        contentValues.put(kp7.F(vqf.MEC_TOOL_TYPE), Integer.valueOf(motionEvent.getToolType(motionEvent.getActionIndex())));
        contentValues.put(kp7.F(vqf.MEC_EDGE_FLAGS), Integer.valueOf(motionEvent.getEdgeFlags()));
        contentValues.put(kp7.F(vqf.MEC_SOURCE), Integer.valueOf(motionEvent.getSource()));
        contentValues.put(kp7.F(vqf.MEC_PRESSURE), Float.valueOf(motionEvent.getPressure()));
        contentValues.put(kp7.F(vqf.MEC_SIZE), Float.valueOf(motionEvent.getSize()));
        contentValues.put(kp7.F(vqf.MEC_FLAGS), Integer.valueOf(motionEvent.getFlags()));
        writableDatabase.insert("tbl64158", null, contentValues);
        this.c = eventTime;
    }

    public svf(Context context, int i, long j) throws IOException {
        this.a = j;
        qvf qvfVar = new qvf(context, null, null, 1);
        this.b = qvfVar;
        SQLiteDatabase writableDatabase = qvfVar.getWritableDatabase();
        vqf vqfVar = vqf.MEC_ID;
        String strF = kp7.F(vqfVar);
        String strF2 = kp7.F(vqfVar);
        String strF3 = kp7.F(vqfVar);
        int i2 = (int) (i * 0.2f);
        int i3 = 1 < i2 ? i2 : 1;
        int length = String.valueOf(i).length();
        int length2 = strF.length();
        StringBuilder sb = new StringBuilder(length + NikonType2MakernoteDirectory.TAG_IMAGE_COUNT + length2 + 25 + strF2.length() + 24 + strF3.length() + 7 + String.valueOf(i3).length() + 31);
        sb.append("\n        CREATE TRIGGER tgr48932\n        AFTER INSERT ON tbl64158\n        WHEN (SELECT COUNT(*) FROM tbl64158) > ");
        sb.append(i);
        sb.append("\n        BEGIN\n          DELETE FROM tbl64158 WHERE ");
        sb.append(strF);
        ka1.C(sb, " IN (\n            SELECT ", strF2, nGxjfIr.ISSjfqwuotL, strF3);
        sb.append(" LIMIT ");
        sb.append(i3);
        sb.append("\n          );\n        END;\n    ");
        String strB = nuc.B(sb.toString());
        writableDatabase.getClass();
        writableDatabase.beginTransaction();
        try {
            writableDatabase.execSQL("DROP TRIGGER IF EXISTS tgr48932");
            writableDatabase.execSQL(strB);
            writableDatabase.setTransactionSuccessful();
        } finally {
            writableDatabase.endTransaction();
        }
    }
}
