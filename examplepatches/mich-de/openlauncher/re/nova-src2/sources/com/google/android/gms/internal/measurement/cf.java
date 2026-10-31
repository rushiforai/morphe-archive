package com.google.android.gms.internal.measurement;

import android.accounts.Account;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public abstract class cf {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f32439a = Pattern.compile("[a-z]+(_[a-z]+)*");

    /* renamed from: b, reason: collision with root package name */
    public static final Account f32440b = ze.f33297a;

    /* renamed from: c, reason: collision with root package name */
    public static final Set f32441c = Collections.unmodifiableSet(new HashSet(Arrays.asList(CarrierConfigurator.APN_TYPE, "unused", "special", "reserved", "shared", "virtual", "managed")));

    /* renamed from: d, reason: collision with root package name */
    public static final Set f32442d = Collections.unmodifiableSet(new HashSet(Arrays.asList("files", "cache", "managed", "directboot-files", "directboot-cache", "external")));
}
