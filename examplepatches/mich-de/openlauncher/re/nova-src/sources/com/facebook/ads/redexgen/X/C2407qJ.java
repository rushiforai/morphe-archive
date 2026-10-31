package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.io.Writer;

/* renamed from: com.facebook.ads.redexgen.X.qJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2407qJ extends Writer {
    public static String[] A03 = {"m3VYVt1tyYlWEg8H2HS3pUr0VsrhpbIN", "rEdvzR", "IUQqTrakmjCy7RtoUebGZ8YLkwuKbv7t", "x1ufNW", "e7NtJ1", "AK7iWzpXctzvcUrQA38QQTSmPkrm2HP", "25DCnOqD1cr08G9nl6wTfczykol7NaSA", "0bM1VBntYb2o4FFsMu8yzxmwObMsLmHM"};
    public int A00;
    public char[] A01 = new char[1024];
    public final InterfaceC2406qI A02;

    public C2407qJ(InterfaceC2406qI interfaceC2406qI) {
        this.A02 = interfaceC2406qI;
    }

    private void A00() {
        this.A02.AIL(new String(this.A01, 0, this.A00));
        this.A00 = 0;
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        flush();
    }

    @Override // java.io.Writer, java.io.Flushable
    public final void flush() {
        if (this.A00 > 0) {
            A00();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    @Override // java.io.Writer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void write(char[] cArr, int i5, int i11) throws IOException {
        int i12 = i5;
        while (true) {
            int i13 = i5 + i11;
            String[] strArr = A03;
            String str = strArr[3];
            String str2 = strArr[1];
            int length = str.length();
            int i14 = str2.length();
            if (length != i14) {
                throw new RuntimeException();
            }
            A03[5] = "5m1TKypG4e5yu";
            if (i12 < i13) {
                if (cArr[i12] != '\n') {
                    int i15 = this.A00;
                    int i16 = this.A01.length;
                    if (i15 == i16) {
                        A00();
                    } else {
                        this.A01[this.A00] = cArr[i12];
                        int i17 = this.A00;
                        this.A00 = i17 + 1;
                    }
                }
                i12++;
            } else {
                return;
            }
        }
    }
}
