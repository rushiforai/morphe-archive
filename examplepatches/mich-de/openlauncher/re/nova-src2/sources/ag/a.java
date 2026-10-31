package ag;

import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public interface a {
    void a(View view, int i5, int i11, com.google.android.flexbox.a aVar);

    int b(int i5, int i11, int i12);

    View c(int i5);

    int d(int i5, int i11, int i12);

    int e(View view);

    void f(com.google.android.flexbox.a aVar);

    View g(int i5);

    int getAlignContent();

    int getAlignItems();

    int getFlexDirection();

    int getFlexItemCount();

    List getFlexLinesInternal();

    int getFlexWrap();

    int getLargestMainSize();

    int getMaxLine();

    int getPaddingBottom();

    int getPaddingEnd();

    int getPaddingLeft();

    int getPaddingRight();

    int getPaddingStart();

    int getPaddingTop();

    int getSumOfCrossSize();

    void h(int i5, View view);

    void i(ArrayList arrayList);

    int j(View view, int i5, int i11);

    boolean k();
}
