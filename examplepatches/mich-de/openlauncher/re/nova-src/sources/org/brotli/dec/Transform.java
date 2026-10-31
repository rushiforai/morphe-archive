package org.brotli.dec;

import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;

/* loaded from: classes5.dex */
final class Transform {
    private static final int IDENTITY = 0;
    static final int NUM_RFC_TRANSFORMS = 121;
    private static final int OMIT_FIRST_BASE = 11;
    private static final int OMIT_FIRST_LAST_LIMIT = 9;
    private static final int OMIT_LAST_BASE = 0;
    private static final String PREFIX_SUFFIX_SRC = "# #s #, #e #.# the #.com/#Â # of # and # in # to #\"#\">#\n#]# for # a # that #. # with #'# from # by #. The # on # as # is #ing #\n\t#:#ed #(# at #ly #=\"# of the #. This #,# not #er #al #='#ful #ive #less #est #ize #ous #";
    static final Transforms RFC_TRANSFORMS;
    private static final int SHIFT_ALL = 22;
    private static final int SHIFT_FIRST = 21;
    private static final String TRANSFORMS_SRC = "     !! ! ,  *!  &!  \" !  ) *   * -  ! # !  #!*!  +  ,$ !  -  %  .  / #   0  1 .  \"   2  3!*   4%  ! # /   5  6  7  8 0  1 &   $   9 +   :  ;  < '  !=  >  ?! 4  @ 4  2  &   A *# (   B  C& ) %  ) !*# *-% A +! *.  D! %'  & E *6  F  G% ! *A *%  H! D  I!+!  J!+   K +- *4! A  L!*4  M  N +6  O!*% +.! K *G  P +%(  ! G *D +D  Q +# *K!*G!+D!+# +G +A +4!+% +K!+4!*D!+K!*K";
    private static final int UPPERCASE_ALL = 11;
    private static final int UPPERCASE_FIRST = 10;

    public static final class Transforms {
        final int numTransforms;
        final short[] params;
        final int[] prefixSuffixHeads;
        final byte[] prefixSuffixStorage;
        final int[] triplets;

        public Transforms(int i5, int i11, int i12) {
            this.numTransforms = i5;
            this.triplets = new int[i5 * 3];
            this.params = new short[i5];
            this.prefixSuffixStorage = new byte[i11];
            this.prefixSuffixHeads = new int[i12 + 1];
        }
    }

    static {
        Transforms transforms = new Transforms(121, 167, 50);
        RFC_TRANSFORMS = transforms;
        unpackTransforms(transforms.prefixSuffixStorage, transforms.prefixSuffixHeads, transforms.triplets, PREFIX_SUFFIX_SRC, TRANSFORMS_SRC);
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x014c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int transformDictionaryWord(byte[] bArr, int i5, ByteBuffer byteBuffer, int i11, int i12, Transforms transforms, int i13) {
        int i14;
        int i15;
        int i16;
        int[] iArr = transforms.triplets;
        byte[] bArr2 = transforms.prefixSuffixStorage;
        int[] iArr2 = transforms.prefixSuffixHeads;
        int i17 = i13 * 3;
        int i18 = iArr[i17];
        int i19 = iArr[i17 + 1];
        int i21 = 2;
        int i22 = iArr[i17 + 2];
        int i23 = iArr2[i18 + 1];
        int i24 = iArr2[i22 + 1];
        int i25 = i19 - 11;
        if (i25 < 1 || i25 > 9) {
            i25 = 0;
        }
        if (i19 < 1 || i19 > 9) {
            i14 = i5;
            i15 = 0;
        } else {
            i14 = i5;
            i15 = i19;
        }
        for (int i26 = iArr2[i18]; i26 != i23; i26++) {
            bArr[i14] = bArr2[i26];
            i14++;
        }
        if (i25 > i12) {
            i25 = i12;
        }
        int i27 = i11 + i25;
        int i28 = (i12 - i25) - i15;
        int i29 = i28;
        while (i29 > 0) {
            bArr[i14] = byteBuffer.get(i27);
            i29--;
            i14++;
            i27++;
        }
        int i31 = Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE;
        if (i19 == 10 || i19 == 11) {
            int i32 = i14 - i28;
            int i33 = i19 == 10 ? 1 : i28;
            while (i33 > 0) {
                byte b11 = bArr[i32];
                int i34 = b11 & 255;
                if (i34 < 192) {
                    if (i34 >= 97 && i34 <= 122) {
                        bArr[i32] = (byte) (b11 ^ 32);
                    }
                    i32++;
                    i33--;
                } else if (i34 < 224) {
                    int i35 = i32 + 1;
                    bArr[i35] = (byte) (bArr[i35] ^ 32);
                    i32 += 2;
                    i33 -= 2;
                } else {
                    int i36 = i32 + 2;
                    bArr[i36] = (byte) (bArr[i36] ^ 5);
                    i32 += 3;
                    i33 -= 3;
                }
            }
        } else if (i19 == 21 || i19 == 22) {
            int i37 = i14 - i28;
            short s11 = transforms.params[i13];
            int i38 = (16777216 - (s11 & Short.MIN_VALUE)) + (s11 & Short.MAX_VALUE);
            while (i28 > 0) {
                byte b12 = bArr[i37];
                int i39 = b12 & 255;
                if (i39 < 128) {
                    i38 += i39;
                    bArr[i37] = (byte) (i38 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                } else {
                    if (i39 >= 192) {
                        if (i39 < i31) {
                            if (i28 >= i21) {
                                int i40 = i37 + 1;
                                byte b13 = bArr[i40];
                                i38 += (b13 & 63) | ((b12 & 31) << 6);
                                bArr[i37] = (byte) (((i38 >> 6) & 31) | 192);
                                bArr[i40] = (byte) ((b13 & 192) | (i38 & 63));
                                i16 = i21;
                            } else {
                                i16 = i28;
                            }
                        } else if (i39 < 240) {
                            if (i28 >= 3) {
                                int i41 = i37 + 1;
                                byte b14 = bArr[i41];
                                int i42 = i37 + 2;
                                byte b15 = bArr[i42];
                                i38 += (b15 & 63) | ((b14 & 63) << 6) | ((b12 & 15) << 12);
                                bArr[i37] = (byte) (((i38 >> 12) & 15) | i31);
                                bArr[i41] = (byte) ((b14 & 192) | ((i38 >> 6) & 63));
                                bArr[i42] = (byte) ((b15 & 192) | (i38 & 63));
                                i16 = 3;
                            }
                        } else if (i39 < 248) {
                            if (i28 >= 4) {
                                int i43 = i37 + 1;
                                byte b16 = bArr[i43];
                                int i44 = i37 + 2;
                                byte b17 = bArr[i44];
                                int i45 = i37 + 3;
                                byte b18 = bArr[i45];
                                i38 += (b18 & 63) | ((b17 & 63) << 6) | ((b16 & 63) << 12) | ((b12 & 7) << 18);
                                bArr[i37] = (byte) (((i38 >> 18) & 7) | 240);
                                bArr[i43] = (byte) ((b16 & 192) | ((i38 >> 12) & 63));
                                bArr[i44] = (byte) ((b17 & 192) | ((i38 >> 6) & 63));
                                bArr[i45] = (byte) ((b18 & 192) | (i38 & 63));
                                i16 = 4;
                            }
                        }
                    }
                    i37 += i16;
                    i28 -= i16;
                    if (i19 != 21) {
                        i28 = 0;
                    }
                    i31 = Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE;
                    i21 = 2;
                }
                i16 = 1;
                i37 += i16;
                i28 -= i16;
                if (i19 != 21) {
                }
                i31 = Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE;
                i21 = 2;
            }
        }
        for (int i46 = iArr2[i22]; i46 != i24; i46++) {
            bArr[i14] = bArr2[i46];
            i14++;
        }
        return i14 - i5;
    }

    private static void unpackTransforms(byte[] bArr, int[] iArr, int[] iArr2, String str, String str2) {
        int i5 = 1;
        int i11 = 0;
        for (int i12 : Utils.toUtf8Runes(str)) {
            if (i12 == 35) {
                iArr[i5] = i11;
                i5++;
            } else {
                bArr[i11] = (byte) i12;
                i11++;
            }
        }
        for (int i13 = 0; i13 < 363; i13++) {
            iArr2[i13] = str2.charAt(i13) - ' ';
        }
    }
}
