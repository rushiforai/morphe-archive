package h60;

import android.text.Spanned;
import android.widget.TextView;
import ba0.r;

/* loaded from: classes4.dex */
public interface f {
    void afterRender(r rVar, l lVar);

    void afterSetText(TextView textView);

    void beforeRender(r rVar);

    void beforeSetText(TextView textView, Spanned spanned);

    void configure(e eVar);

    void configureConfiguration(c cVar);

    void configureParser(ca0.a aVar);

    void configureSpansFactory(g gVar);

    void configureTheme(i60.e eVar);

    void configureVisitor(j jVar);

    String processMarkdown(String str);
}
