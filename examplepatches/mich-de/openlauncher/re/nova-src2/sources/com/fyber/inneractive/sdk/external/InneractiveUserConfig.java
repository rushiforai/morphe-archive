package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public class InneractiveUserConfig {

    /* renamed from: a, reason: collision with root package name */
    public Gender f28005a = null;

    /* renamed from: b, reason: collision with root package name */
    public String f28006b = null;

    public enum Gender {
        MALE,
        FEMALE
    }

    public Gender getGender() {
        return this.f28005a;
    }

    @Deprecated
    public String getZipCode() {
        return this.f28006b;
    }

    public InneractiveUserConfig setGender(Gender gender) {
        if (gender != null) {
            this.f28005a = gender;
            return this;
        }
        IAlog.f("The gender is invalid. Please use one of the suggested InneractiveAdView.Gender", new Object[0]);
        return this;
    }

    @Deprecated
    public InneractiveUserConfig setZipCode(String str) {
        if (str == null || !Pattern.compile("(^\\d{5}$)|(^\\d{5}-\\d{4}$)").matcher(str).matches()) {
            IAlog.c("The zipcode format is invalid. Please use a valid value.", new Object[0]);
            return this;
        }
        this.f28006b = str;
        return this;
    }
}
