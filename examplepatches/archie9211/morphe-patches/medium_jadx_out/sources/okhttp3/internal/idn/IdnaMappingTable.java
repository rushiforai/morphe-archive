package okhttp3.internal.idn;

import defpackage.b09;
import defpackage.g76;
import defpackage.lg8;
import defpackage.pwd;
import defpackage.xz0;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B!\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bH\u0002¢\u0006\u0004\b\n\u0010\u000bJ'\u0010\u000e\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\bH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u001d\u0010\u0013\u001a\u00020\u00122\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0015\u001a\u0004\b\u0018\u0010\u0017R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0015\u001a\u0004\b\u0019\u0010\u0017¨\u0006\u001a"}, d2 = {"Lokhttp3/internal/idn/IdnaMappingTable;", "", "", "sections", "ranges", "mappings", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "", "codePoint", "findSectionsIndex", "(I)I", "position", "limit", "findRangesOffset", "(III)I", "Lxz0;", "sink", "", "map", "(ILxz0;)Z", "Ljava/lang/String;", "getSections", "()Ljava/lang/String;", "getRanges", "getMappings", "okhttp"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class IdnaMappingTable {
    private final String mappings;
    private final String ranges;
    private final String sections;

    public IdnaMappingTable(String str, String str2, String str3) {
        b09.I(str, str2, str3);
        this.sections = str;
        this.ranges = str2;
        this.mappings = str3;
    }

    private final int findRangesOffset(int codePoint, int position, int limit) {
        int i;
        int i2 = codePoint & 127;
        int i3 = limit - 1;
        while (true) {
            if (position > i3) {
                i = (-position) - 1;
                break;
            }
            i = (position + i3) / 2;
            int iQ = g76.Q(i2, this.ranges.charAt(i * 4));
            if (iQ >= 0) {
                if (iQ <= 0) {
                    break;
                }
                position = i + 1;
            } else {
                i3 = i - 1;
            }
        }
        return i >= 0 ? i * 4 : ((-i) - 2) * 4;
    }

    private final int findSectionsIndex(int codePoint) {
        int i;
        int i2 = (codePoint & 2097024) >> 7;
        int length = (this.sections.length() / 4) - 1;
        int i3 = 0;
        while (true) {
            if (i3 > length) {
                i = (-i3) - 1;
                break;
            }
            i = (i3 + length) / 2;
            int iQ = g76.Q(i2, pwd.W(i * 4, this.sections));
            if (iQ >= 0) {
                if (iQ <= 0) {
                    break;
                }
                i3 = i + 1;
            } else {
                length = i - 1;
            }
        }
        return i >= 0 ? i * 4 : ((-i) - 2) * 4;
    }

    public final String getMappings() {
        return this.mappings;
    }

    public final String getRanges() {
        return this.ranges;
    }

    public final String getSections() {
        return this.sections;
    }

    public final boolean map(int codePoint, xz0 sink) {
        int length;
        sink.getClass();
        int iFindSectionsIndex = findSectionsIndex(codePoint);
        int iW = pwd.W(iFindSectionsIndex + 2, this.sections);
        if (iFindSectionsIndex + 4 < this.sections.length()) {
            length = pwd.W(iFindSectionsIndex + 6, this.sections);
        } else {
            length = this.ranges.length() / 4;
        }
        int iFindRangesOffset = findRangesOffset(codePoint, iW, length);
        char cCharAt = this.ranges.charAt(iFindRangesOffset + 1);
        if (cCharAt >= 0 && cCharAt < '@') {
            int iW2 = pwd.W(iFindRangesOffset + 2, this.ranges);
            sink.e0(iW2, cCharAt + iW2, this.mappings);
            return true;
        }
        if ('@' <= cCharAt && cCharAt < 'P') {
            sink.y(codePoint - (this.ranges.charAt(iFindRangesOffset + 3) | (((cCharAt & 15) << 14) | (this.ranges.charAt(iFindRangesOffset + 2) << 7))));
            return true;
        }
        if ('P' <= cCharAt && cCharAt < '`') {
            sink.y(codePoint + (this.ranges.charAt(iFindRangesOffset + 3) | ((cCharAt & 15) << 14) | (this.ranges.charAt(iFindRangesOffset + 2) << 7)));
            return true;
        }
        if (cCharAt == 'w') {
            return true;
        }
        if (cCharAt == 'x') {
            sink.y(codePoint);
            return true;
        }
        if (cCharAt == 'y') {
            sink.y(codePoint);
            return false;
        }
        if (cCharAt == 'z') {
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2));
            return true;
        }
        if (cCharAt == '{') {
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2) | 128);
            return true;
        }
        if (cCharAt == '|') {
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2));
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 3));
            return true;
        }
        if (cCharAt == '}') {
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2) | 128);
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 3));
            return true;
        }
        if (cCharAt == '~') {
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2));
            sink.writeByte(this.ranges.charAt(iFindRangesOffset + 3) | 128);
            return true;
        }
        if (cCharAt != 127) {
            lg8.g(codePoint, "unexpected rangesIndex for ");
            return false;
        }
        sink.writeByte(this.ranges.charAt(iFindRangesOffset + 2) | 128);
        sink.writeByte(this.ranges.charAt(iFindRangesOffset + 3) | 128);
        return true;
    }
}
