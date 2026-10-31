package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import cf.a;
import fe.v0;
import java.util.ArrayList;
import wf.v;

/* loaded from: classes3.dex */
public final class TextInformationFrame extends Id3Frame {
    public static final Parcelable.Creator<TextInformationFrame> CREATOR = new a(8);

    /* renamed from: b, reason: collision with root package name */
    public final String f31540b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31541c;

    public TextInformationFrame(String str, String str2, String str3) {
        super(str);
        this.f31540b = str2;
        this.f31541c = str3;
    }

    public static ArrayList a(String str) {
        ArrayList arrayList = new ArrayList();
        try {
            if (str.length() >= 10) {
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(0, 4))));
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(5, 7))));
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(8, 10))));
                return arrayList;
            }
            if (str.length() >= 7) {
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(0, 4))));
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(5, 7))));
                return arrayList;
            }
            if (str.length() >= 4) {
                arrayList.add(Integer.valueOf(Integer.parseInt(str.substring(0, 4))));
            }
            return arrayList;
        } catch (NumberFormatException unused) {
            return new ArrayList();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0012  */
    @Override // com.google.android.exoplayer2.metadata.Metadata.Entry
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void W(v0 v0Var) throws NumberFormatException {
        char c11;
        String str = this.f31529a;
        str.getClass();
        switch (str.hashCode()) {
            case 82815:
                if (!str.equals("TAL")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case 82878:
                if (str.equals("TCM")) {
                    c11 = 1;
                    break;
                }
                break;
            case 82897:
                if (str.equals("TDA")) {
                    c11 = 2;
                    break;
                }
                break;
            case 83253:
                if (str.equals("TP1")) {
                    c11 = 3;
                    break;
                }
                break;
            case 83254:
                if (str.equals("TP2")) {
                    c11 = 4;
                    break;
                }
                break;
            case 83255:
                if (str.equals("TP3")) {
                    c11 = 5;
                    break;
                }
                break;
            case 83341:
                if (str.equals("TRK")) {
                    c11 = 6;
                    break;
                }
                break;
            case 83378:
                if (str.equals("TT2")) {
                    c11 = 7;
                    break;
                }
                break;
            case 83536:
                if (str.equals("TXT")) {
                    c11 = '\b';
                    break;
                }
                break;
            case 83552:
                if (str.equals("TYE")) {
                    c11 = '\t';
                    break;
                }
                break;
            case 2567331:
                if (str.equals("TALB")) {
                    c11 = '\n';
                    break;
                }
                break;
            case 2569357:
                if (str.equals("TCOM")) {
                    c11 = 11;
                    break;
                }
                break;
            case 2569891:
                if (str.equals("TDAT")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 2570401:
                if (str.equals("TDRC")) {
                    c11 = '\r';
                    break;
                }
                break;
            case 2570410:
                if (str.equals("TDRL")) {
                    c11 = 14;
                    break;
                }
                break;
            case 2571565:
                if (str.equals("TEXT")) {
                    c11 = 15;
                    break;
                }
                break;
            case 2575251:
                if (str.equals("TIT2")) {
                    c11 = 16;
                    break;
                }
                break;
            case 2581512:
                if (str.equals("TPE1")) {
                    c11 = 17;
                    break;
                }
                break;
            case 2581513:
                if (str.equals("TPE2")) {
                    c11 = 18;
                    break;
                }
                break;
            case 2581514:
                if (str.equals("TPE3")) {
                    c11 = 19;
                    break;
                }
                break;
            case 2583398:
                if (str.equals("TRCK")) {
                    c11 = 20;
                    break;
                }
                break;
            case 2590194:
                if (str.equals("TYER")) {
                    c11 = 21;
                    break;
                }
                break;
        }
        String str2 = this.f31541c;
        try {
            switch (c11) {
                case 0:
                case '\n':
                    v0Var.f55011c = str2;
                    break;
                case 1:
                case 11:
                    v0Var.f55030x = str2;
                    break;
                case 2:
                case '\f':
                    int i5 = Integer.parseInt(str2.substring(2, 4));
                    int i11 = Integer.parseInt(str2.substring(0, 2));
                    v0Var.f55024r = Integer.valueOf(i5);
                    v0Var.f55025s = Integer.valueOf(i11);
                    break;
                case 3:
                case 17:
                    v0Var.f55010b = str2;
                    break;
                case 4:
                case 18:
                    v0Var.f55012d = str2;
                    break;
                case 5:
                case 19:
                    v0Var.f55031y = str2;
                    break;
                case 6:
                case 20:
                    int i12 = v.f94376a;
                    String[] strArrSplit = str2.split("/", -1);
                    int i13 = Integer.parseInt(strArrSplit[0]);
                    Integer numValueOf = strArrSplit.length > 1 ? Integer.valueOf(Integer.parseInt(strArrSplit[1])) : null;
                    v0Var.f55021m = Integer.valueOf(i13);
                    v0Var.n = numValueOf;
                    break;
                case 7:
                case 16:
                    v0Var.f55009a = str2;
                    break;
                case '\b':
                case 15:
                    v0Var.f55029w = str2;
                    break;
                case '\t':
                case 21:
                    v0Var.f55023q = Integer.valueOf(Integer.parseInt(str2));
                    break;
                case '\r':
                    ArrayList arrayListA = a(str2);
                    int size = arrayListA.size();
                    if (size != 1) {
                        if (size != 2) {
                            if (size == 3) {
                                v0Var.f55025s = (Integer) arrayListA.get(2);
                            }
                        }
                        v0Var.f55024r = (Integer) arrayListA.get(1);
                    }
                    v0Var.f55023q = (Integer) arrayListA.get(0);
                    break;
                case 14:
                    ArrayList arrayListA2 = a(str2);
                    int size2 = arrayListA2.size();
                    if (size2 != 1) {
                        if (size2 != 2) {
                            if (size2 == 3) {
                                v0Var.f55028v = (Integer) arrayListA2.get(2);
                            }
                        }
                        v0Var.f55027u = (Integer) arrayListA2.get(1);
                    }
                    v0Var.f55026t = (Integer) arrayListA2.get(0);
                    break;
            }
        } catch (NumberFormatException | StringIndexOutOfBoundsException unused) {
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && TextInformationFrame.class == obj.getClass()) {
            TextInformationFrame textInformationFrame = (TextInformationFrame) obj;
            if (v.a(this.f31529a, textInformationFrame.f31529a) && v.a(this.f31540b, textInformationFrame.f31540b) && v.a(this.f31541c, textInformationFrame.f31541c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iE = c0.e(527, 31, this.f31529a);
        String str = this.f31540b;
        int iHashCode = (iE + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.f31541c;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame
    public final String toString() {
        return this.f31529a + ": description=" + this.f31540b + ": value=" + this.f31541c;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31529a);
        parcel.writeString(this.f31540b);
        parcel.writeString(this.f31541c);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public TextInformationFrame(Parcel parcel) {
        String string = parcel.readString();
        int i5 = v.f94376a;
        super(string);
        this.f31540b = parcel.readString();
        this.f31541c = parcel.readString();
    }
}
