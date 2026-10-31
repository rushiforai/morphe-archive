package com.bytedance.sdk.openadsdk;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class FilterWord {

    /* renamed from: dj, reason: collision with root package name */
    private List<FilterWord> f24269dj;
    private boolean sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f24270zb;

    public FilterWord(String str, String str2) {
        this.ycx = str;
        this.f24270zb = str2;
    }

    public void addOption(FilterWord filterWord) {
        if (filterWord == null) {
            return;
        }
        if (this.f24269dj == null) {
            this.f24269dj = new ArrayList();
        }
        this.f24269dj.add(filterWord);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FilterWord)) {
            return false;
        }
        FilterWord filterWord = (FilterWord) obj;
        return filterWord.getId().equals(getId()) && filterWord.getName().equals(getName());
    }

    public String getId() {
        return this.ycx;
    }

    public boolean getIsSelected() {
        return this.sya;
    }

    public String getName() {
        return this.f24270zb;
    }

    public List<FilterWord> getOptions() {
        return this.f24269dj;
    }

    public boolean hasSecondOptions() {
        List<FilterWord> list = this.f24269dj;
        return (list == null || list.isEmpty()) ? false : true;
    }

    public boolean isValid() {
        return (TextUtils.isEmpty(this.ycx) || TextUtils.isEmpty(this.f24270zb)) ? false : true;
    }

    public void setId(String str) {
        this.ycx = str;
    }

    public void setIsSelected(boolean z11) {
        this.sya = z11;
    }

    public void setName(String str) {
        this.f24270zb = str;
    }

    public FilterWord() {
    }
}
