package sprig.view;

import android.graphics.Point;
import com.userleap.internal.data.ReplayRequest;
import defpackage.g76;
import defpackage.gy2;
import defpackage.x45;
import kotlin.Metadata;
import sprig.graphics.EnumC0050b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\t\b`\u0018\u00002\u00020\u0001:\u0003$%&J\u000f\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0005H&¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000b\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\tH&¢\u0006\u0004\b\u000b\u0010\fJ\u0017\u0010\u000f\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\rH&¢\u0006\u0004\b\u000f\u0010\u0010J#\u0010\u0014\u001a\u00020\u00022\u0012\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00020\u0011H&¢\u0006\u0004\b\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u00020\u00022\u0006\u0010\u0017\u001a\u00020\u0016H&¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u001d\u001a\u00020\u001a8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u001cR\u001c\u0010#\u001a\u00020\u001e8&@&X¦\u000e¢\u0006\f\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\"¨\u0006'"}, d2 = {"Lsprig/d/b;", "", "Lc1e;", "startRecordingScreen", "()V", "Landroid/graphics/Point;", "touchPoint", "onTouch", "(Landroid/graphics/Point;)V", "Lsprig/d/b$c;", "swipe", "onSwipe", "(Lsprig/d/b$c;)V", "Lsprig/d/b$a;", "digest", "addEventDigest", "(Lsprig/d/b$a;)V", "Lkotlin/Function1;", "Lsprig/g/b;", "completionHandler", "waitForCompletion", "(Lx45;)V", "Lsprig/h/b;", "reason", "cancelRecording", "(Lsprig/h/b;)V", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "", "getReplayWindowSize", "()J", "setReplayWindowSize", "(J)V", "replayWindowSize", "a", "b", "c", "userleap_release"}, k = 1, mv = {1, 8, 0})
public interface b {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0004\u001a\u00020\u0002HÆ\u0003J\u001d\u0010\u0007\u001a\u00020\u00002\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001J\t\u0010\t\u001a\u00020\bHÖ\u0001J\t\u0010\u000b\u001a\u00020\nHÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0010\u001a\u0004\b\u0014\u0010\u0012¨\u0006\u0017"}, d2 = {"Lsprig/d/b$c;", "", "Landroid/graphics/Point;", "component1", "component2", "start", "end", "copy", "", "toString", "", "hashCode", "other", "", "equals", "a", "Landroid/graphics/Point;", "getStart", "()Landroid/graphics/Point;", "b", "getEnd", "<init>", "(Landroid/graphics/Point;Landroid/graphics/Point;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class c {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final Point start;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final Point end;

        public c(Point point, Point point2) {
            point.getClass();
            point2.getClass();
            this.start = point;
            this.end = point2;
        }

        public static /* synthetic */ c copy$default(c cVar, Point point, Point point2, int i, Object obj) {
            if ((i & 1) != 0) {
                point = cVar.start;
            }
            if ((i & 2) != 0) {
                point2 = cVar.end;
            }
            return cVar.copy(point, point2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Point getStart() {
            return this.start;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Point getEnd() {
            return this.end;
        }

        public final c copy(Point start, Point end) {
            start.getClass();
            end.getClass();
            return new c(start, end);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof c)) {
                return false;
            }
            c cVar = (c) other;
            return g76.L(this.start, cVar.start) && g76.L(this.end, cVar.end);
        }

        public final Point getEnd() {
            return this.end;
        }

        public final Point getStart() {
            return this.start;
        }

        public int hashCode() {
            return this.end.hashCode() + (this.start.hashCode() * 31);
        }

        public String toString() {
            return "SwipeData(start=" + this.start + ", end=" + this.end + ")";
        }
    }

    void addEventDigest(a digest);

    void cancelRecording(EnumC0050b reason);

    ReplayRequest getReplayRequest();

    long getReplayWindowSize();

    void onSwipe(c swipe);

    void onTouch(Point touchPoint);

    void setReplayWindowSize(long j);

    void startRecordingScreen();

    void waitForCompletion(x45 completionHandler);

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    /* JADX INFO: renamed from: sprig.d.b$b, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lsprig/d/b$b;", "", "<init>", "(Ljava/lang/String;I)V", "TOUCH", "SWIPE", "TRACK_EVENT", "SHOW_SURVEY", "SUBMIT_SURVEY", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class EnumC0010b {
        public static final EnumC0010b TOUCH = new d("TOUCH", 0);
        public static final EnumC0010b SWIPE = new c("SWIPE", 1);
        public static final EnumC0010b TRACK_EVENT = new e("TRACK_EVENT", 2);
        public static final EnumC0010b SHOW_SURVEY = new a("SHOW_SURVEY", 3);
        public static final EnumC0010b SUBMIT_SURVEY = new C0011b("SUBMIT_SURVEY", 4);
        public static final /* synthetic */ EnumC0010b[] a = a();

        /* JADX INFO: renamed from: sprig.d.b$b$a */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/d/b$b$a;", "Lsprig/d/b$b;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class a extends EnumC0010b {
            public a(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_ShowSurvey";
            }
        }

        /* JADX INFO: renamed from: sprig.d.b$b$b, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/d/b$b$b;", "Lsprig/d/b$b;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class C0011b extends EnumC0010b {
            public C0011b(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_SubmitSurvey";
            }
        }

        /* JADX INFO: renamed from: sprig.d.b$b$c */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/d/b$b$c;", "Lsprig/d/b$b;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class c extends EnumC0010b {
            public c(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_Swipe";
            }
        }

        /* JADX INFO: renamed from: sprig.d.b$b$d */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/d/b$b$d;", "Lsprig/d/b$b;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class d extends EnumC0010b {
            public d(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_Touch";
            }
        }

        /* JADX INFO: renamed from: sprig.d.b$b$e */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\bÆ\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\u0004"}, d2 = {"Lsprig/d/b$b$e;", "Lsprig/d/b$b;", "", "toString", "userleap_release"}, k = 1, mv = {1, 8, 0})
        public static final class e extends EnumC0010b {
            public e(String str, int i) {
                super(str, i, null);
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Sprig_TrackEvent";
            }
        }

        public /* synthetic */ EnumC0010b(String str, int i, gy2 gy2Var) {
            this(str, i);
        }

        public static final /* synthetic */ EnumC0010b[] a() {
            return new EnumC0010b[]{TOUCH, SWIPE, TRACK_EVENT, SHOW_SURVEY, SUBMIT_SURVEY};
        }

        public static EnumC0010b valueOf(String str) {
            return (EnumC0010b) Enum.valueOf(EnumC0010b.class, str);
        }

        public static EnumC0010b[] values() {
            return (EnumC0010b[]) a.clone();
        }

        public EnumC0010b(String str, int i) {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0013\b\u0086\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\u0006\u0010\f\u001a\u00020\u0004\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b%\u0010&J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\u0012\u0010\t\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\t\u0010\nJ<\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u000b\u001a\u00020\u00022\b\b\u0002\u0010\f\u001a\u00020\u00042\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\bHÆ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\t\u0010\u0011\u001a\u00020\u0006HÖ\u0001J\t\u0010\u0012\u001a\u00020\bHÖ\u0001J\u0013\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010\u0017\u001a\u0004\b\u0018\u0010\u0019R\u0017\u0010\f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u0019\u0010\r\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u001e\u0010\u001f\u001a\u0004\b \u0010!R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010\n¨\u0006'"}, d2 = {"Lsprig/d/b$a;", "", "", "component1", "Lsprig/d/b$b;", "component2", "", "component3", "", "component4", "()Ljava/lang/Integer;", "timestamp", "type", "name", "surveyId", "copy", "(JLsprig/d/b$b;Ljava/lang/String;Ljava/lang/Integer;)Lsprig/d/b$a;", "toString", "hashCode", "other", "", "equals", "a", "J", "getTimestamp", "()J", "b", "Lsprig/d/b$b;", "getType", "()Lsprig/d/b$b;", "c", "Ljava/lang/String;", "getName", "()Ljava/lang/String;", "d", "Ljava/lang/Integer;", "getSurveyId", "<init>", "(JLsprig/d/b$b;Ljava/lang/String;Ljava/lang/Integer;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class a {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final long timestamp;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final EnumC0010b type;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final String name;

        /* JADX INFO: renamed from: d, reason: from kotlin metadata */
        public final Integer surveyId;

        public a(long j, EnumC0010b enumC0010b, String str, Integer num) {
            enumC0010b.getClass();
            this.timestamp = j;
            this.type = enumC0010b;
            this.name = str;
            this.surveyId = num;
        }

        public static /* synthetic */ a copy$default(a aVar, long j, EnumC0010b enumC0010b, String str, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                j = aVar.timestamp;
            }
            long j2 = j;
            if ((i & 2) != 0) {
                enumC0010b = aVar.type;
            }
            EnumC0010b enumC0010b2 = enumC0010b;
            if ((i & 4) != 0) {
                str = aVar.name;
            }
            String str2 = str;
            if ((i & 8) != 0) {
                num = aVar.surveyId;
            }
            return aVar.copy(j2, enumC0010b2, str2, num);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final EnumC0010b getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Integer getSurveyId() {
            return this.surveyId;
        }

        public final a copy(long timestamp, EnumC0010b type, String name, Integer surveyId) {
            type.getClass();
            return new a(timestamp, type, name, surveyId);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof a)) {
                return false;
            }
            a aVar = (a) other;
            return this.timestamp == aVar.timestamp && this.type == aVar.type && g76.L(this.name, aVar.name) && g76.L(this.surveyId, aVar.surveyId);
        }

        public final String getName() {
            return this.name;
        }

        public final Integer getSurveyId() {
            return this.surveyId;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public final EnumC0010b getType() {
            return this.type;
        }

        public int hashCode() {
            long j = this.timestamp;
            int iHashCode = (this.type.hashCode() + (((int) (j ^ (j >>> 32))) * 31)) * 31;
            String str = this.name;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Integer num = this.surveyId;
            return iHashCode2 + (num != null ? num.hashCode() : 0);
        }

        public String toString() {
            return "EventDigest(timestamp=" + this.timestamp + ", type=" + this.type + ", name=" + this.name + ", surveyId=" + this.surveyId + ")";
        }

        public /* synthetic */ a(long j, EnumC0010b enumC0010b, String str, Integer num, int i, gy2 gy2Var) {
            this(j, enumC0010b, (i & 4) != 0 ? null : str, (i & 8) != 0 ? null : num);
        }
    }
}
