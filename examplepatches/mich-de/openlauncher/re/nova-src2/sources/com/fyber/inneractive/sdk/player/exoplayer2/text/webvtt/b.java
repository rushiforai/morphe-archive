package com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt;

import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f30254a = Pattern.compile("^NOTE(( |\t).*)?$");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f30255b = Pattern.compile("^\ufeff?WEBVTT(( |\t).*)?$");

    public static long a(String str) throws NumberFormatException {
        String[] strArrSplit = str.split("\\.", 2);
        long j11 = 0;
        for (String str2 : strArrSplit[0].split(":")) {
            j11 = (j11 * 60) + Long.parseLong(str2);
        }
        return (Long.parseLong(strArrSplit[1]) + (j11 * 1000)) * 1000;
    }
}
