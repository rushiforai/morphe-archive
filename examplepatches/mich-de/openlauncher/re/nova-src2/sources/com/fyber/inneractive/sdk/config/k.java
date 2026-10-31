package com.fyber.inneractive.sdk.config;

import android.content.Context;
import android.os.LocaleList;
import android.text.TextUtils;
import android.view.inputmethod.InputMethodInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public abstract class k {
    public static ArrayList a(Context context) {
        HashSet hashSet = new HashSet();
        try {
            InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService("input_method");
            List<InputMethodInfo> enabledInputMethodList = inputMethodManager.getEnabledInputMethodList();
            if (enabledInputMethodList != null) {
                Iterator<InputMethodInfo> it = enabledInputMethodList.iterator();
                int i5 = 0;
                while (it.hasNext()) {
                    for (InputMethodSubtype inputMethodSubtype : inputMethodManager.getEnabledInputMethodSubtypeList(it.next(), true)) {
                        if (inputMethodSubtype.getMode().equals("keyboard") && i5 < 10) {
                            String locale = inputMethodSubtype.getLocale();
                            if (!TextUtils.isEmpty(locale)) {
                                try {
                                    String strReplace = locale.replace("_", Identify.UNSET_VALUE);
                                    hashSet.add(strReplace);
                                    IAlog.a("Available input language: %s", strReplace);
                                    i5++;
                                } catch (Exception unused) {
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable unused2) {
            IAlog.f("%s : Failed to initialize InputMethodManager (known issue on some Android 15 devices). Device input languages unavailable, but SDK will continue normally.", IAlog.a(k.class));
        }
        if (hashSet.isEmpty()) {
            hashSet.addAll(Arrays.asList(LocaleList.getDefault().toLanguageTags().split(",")));
        }
        return new ArrayList(hashSet);
    }
}
