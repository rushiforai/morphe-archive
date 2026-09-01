package sprig.j;

import defpackage.g76;
import defpackage.gy2;
import defpackage.wgd;
import j$.util.DesugarTimeZone;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0082\b\u0018\u00002\u00020\u0001B%\u0012\b\b\u0002\u0010\b\u001a\u00020\u0004\u0012\u0006\u0010\t\u001a\u00020\u0002\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\b\u0010\u0003\u001a\u00020\u0002H\u0016J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0002HÆ\u0003J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0002HÆ\u0003J)\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u00022\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0002HÆ\u0001J\t\u0010\r\u001a\u00020\fHÖ\u0001J\u0013\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u0017\u0010\t\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0016\u001a\u0004\b\u001a\u0010\u0018¨\u0006\u001d"}, d2 = {"Lsprig/j/c;", "", "", "toString", "Ljava/util/Date;", "component1", "component2", "component3", "timeStamp", "value", "details", "copy", "", "hashCode", "other", "", "equals", "a", "Ljava/util/Date;", "getTimeStamp", "()Ljava/util/Date;", "b", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", "c", "getDetails", "<init>", "(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
final /* data */ class c {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final Date timeStamp;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final String value;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final String details;

    public /* synthetic */ c(Date date, String str, String str2, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? new Date() : date, str, (i & 4) != 0 ? null : str2);
    }

    public static /* synthetic */ c copy$default(c cVar, Date date, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            date = cVar.timeStamp;
        }
        if ((i & 2) != 0) {
            str = cVar.value;
        }
        if ((i & 4) != 0) {
            str2 = cVar.details;
        }
        return cVar.copy(date, str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final Date getTimeStamp() {
        return this.timeStamp;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getValue() {
        return this.value;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getDetails() {
        return this.details;
    }

    public final c copy(Date timeStamp, String value, String details) {
        timeStamp.getClass();
        value.getClass();
        return new c(timeStamp, value, details);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof c)) {
            return false;
        }
        c cVar = (c) other;
        return g76.L(this.timeStamp, cVar.timeStamp) && g76.L(this.value, cVar.value) && g76.L(this.details, cVar.details);
    }

    public final String getDetails() {
        return this.details;
    }

    public final Date getTimeStamp() {
        return this.timeStamp;
    }

    public final String getValue() {
        return this.value;
    }

    public int hashCode() {
        int iO = wgd.o(this.timeStamp.hashCode() * 31, 31, this.value);
        String str = this.details;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public String toString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss '+'SSSS", Locale.getDefault());
        simpleDateFormat.setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        String str = simpleDateFormat.format(this.timeStamp);
        String str2 = this.value;
        String str3 = this.details;
        if (str3 == null) {
            str3 = "";
        }
        return str + " UTC " + str2 + " " + str3;
    }

    public c(Date date, String str, String str2) {
        date.getClass();
        str.getClass();
        this.timeStamp = date;
        this.value = str;
        this.details = str2;
    }
}
