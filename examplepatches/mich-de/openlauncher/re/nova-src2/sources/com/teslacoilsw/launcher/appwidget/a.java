package com.teslacoilsw.launcher.appwidget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextClock;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements LayoutInflater.Factory {
    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Method method;
        if (!"TextClock".equals(str) || (method = b.f45715b) == null) {
            return null;
        }
        TextClock textClock = new TextClock(context, attributeSet);
        try {
            method.invoke(textClock, Boolean.FALSE);
            return textClock;
        } catch (IllegalAccessException e3) {
            e3.printStackTrace();
            return textClock;
        } catch (InvocationTargetException e11) {
            e11.printStackTrace();
            return textClock;
        }
    }
}
