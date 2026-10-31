package com.bytedance.sdk.openadsdk.core.model;

import java.util.List;

/* loaded from: classes2.dex */
public class fby {

    /* renamed from: dj, reason: collision with root package name */
    private int f25639dj;

    /* renamed from: lt, reason: collision with root package name */
    private int f25640lt;
    private List<String> lud;
    private List<Integer> sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f25641ul;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25642zb;

    public int dj() {
        return this.ycx;
    }

    public List<Integer> lt() {
        return this.sya;
    }

    public int lud() {
        return this.f25642zb;
    }

    public List<String> sya() {
        return this.lud;
    }

    public int ul() {
        return this.f25639dj;
    }

    public boolean ycx() {
        return this.f25640lt == 1;
    }

    public int zb() {
        int i5 = this.f25641ul;
        if (i5 >= 2) {
            return i5;
        }
        return 0;
    }

    public void dj(int i5) {
        this.f25642zb = i5;
    }

    public void lud(int i5) {
        this.f25639dj = i5;
    }

    public void sya(int i5) {
        this.ycx = i5;
    }

    public void ycx(int i5) {
        this.f25640lt = i5;
    }

    public void zb(int i5) {
        this.f25641ul = i5;
    }

    public void ycx(List<String> list) {
        this.lud = list;
    }

    public void zb(List<Integer> list) {
        this.sya = list;
    }
}
