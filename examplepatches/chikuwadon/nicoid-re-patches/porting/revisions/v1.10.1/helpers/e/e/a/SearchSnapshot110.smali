.class public final Le/e/a/SearchSnapshot110;
.super Ljava/lang/Object;
.source "SearchSnapshot110.java"


# static fields
.field static final EDITS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final HIGH:Ljava/lang/String; = "nicoidMaxViews"

.field static final LOW:Ljava/lang/String; = "nicoidMinViews"

.field static final MODELS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Landroid/content/SharedPreferences;",
            ">;"
        }
    .end annotation
.end field

.field static final NETWORK:Ljava/lang/Object;

.field static current:Landroid/content/SharedPreferences;

.field static nextRequest:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SearchSnapshot110;->EDITS:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SearchSnapshot110;->MODELS:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Le/e/a/SearchSnapshot110;->NETWORK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bound(Ljava/lang/String;)J
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/SearchBounds110;->parse(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static editing(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 6
    sget-object v0, Le/e/a/SearchSnapshot110;->EDITS:Ljava/util/WeakHashMap;

    if-nez p1, :cond_6

    const-string p1, ""

    :cond_6
    invoke-virtual {v0, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Le/e/a/SearchSnapshot110;->MODELS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static install(Landroid/content/Context;Landroid/view/View;[I)V
    .registers 12

    .line 16
    invoke-static {p0}, Le/e/a/SearchSnapshot110;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {p0, p1, v0}, Le/e/a/SearchSnapshot110;->sortControl(Landroid/content/Context;Landroid/view/View;Landroid/content/SharedPreferences;)V

    const v1, 0x7f08018a

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_1b

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_19

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    goto :goto_21

    :cond_19
    move-object v1, v2

    goto :goto_21

    :cond_1b
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    :goto_1f
    check-cast v1, Landroid/view/ViewGroup;

    :goto_21
    if-eqz v1, :cond_3f

    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_32

    move-object v3, v1

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_32

    goto :goto_3f

    :cond_32
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_19

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_1f

    :cond_3f
    :goto_3f
    if-eqz v1, :cond_102

    const-string v3, "nicoid-view-range"

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_4b

    goto/16 :goto_102

    :cond_4b
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const-string v3, ""

    invoke-static {p0, v3}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setTextColor(I)V

    const v5, 0x800033

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    const/16 v5, 0xc

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v3, v6, v7, v8, v5}, Landroid/widget/Button;->setPadding(IIII)V

    const/16 v5, 0x10

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v5

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v6

    invoke-static {v5, v6}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v5

    const/16 v6, 0xa

    invoke-static {p0, v5, v6}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v5, "\u24d8"

    invoke-static {p0, v5}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    const-string v6, "nicoid-range-control"

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    invoke-virtual {v5, v4, v4, v4, v4}, Landroid/widget/Button;->setPadding(IIII)V

    const-string v2, "About view-count search"

    const-string v4, "\u95dc\u65bc\u64ad\u653e\u6b21\u6578\u641c\u5c0b"

    const-string v6, "\u518d\u751f\u6570\u691c\u7d22\u306b\u3064\u3044\u3066"

    invoke-static {p0, v6, v2, v4}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x2c

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance p1, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;

    invoke-direct {p1, v0, p0, v3}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda3;-><init>(Landroid/content/SharedPreferences;Landroid/content/Context;Landroid/widget/Button;)V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    new-instance v1, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda4;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, v0, p1, p2}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda5;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;[I)V

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_102
    :goto_102
    return-void
.end method

.method static synthetic lambda$0(Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 10
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "getAll"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object p1

    :cond_12
    const-string v0, "contains"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_26

    aget-object p1, p3, v1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_26
    const-string v0, "edit"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4b

    new-array p1, v2, [Ljava/lang/Object;

    const-class p2, Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p2

    const-class p3, Landroid/content/SharedPreferences$Editor;

    filled-new-array {p3}, [Ljava/lang/Class;

    move-result-object p3

    new-instance v0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0, p1}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda6;-><init>(Ljava/util/HashMap;[Ljava/lang/Object;)V

    invoke-static {p2, p3, v0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p0

    aput-object p0, p1, v1

    aget-object p0, p1, v1

    return-object p0

    :cond_4b
    const-string v0, "get"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_65

    aget-object p1, p3, v1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_62

    aget-object p1, p3, v1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_64

    :cond_62
    aget-object p0, p3, v2

    :goto_64
    return-object p0

    :cond_65
    const-string p0, "hashCode"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_76

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_76
    const-string p0, "equals"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8c

    aget-object p0, p3, v1

    if-ne p1, p0, :cond_87

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_87
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_8c
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$1(Ljava/util/HashMap;[Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 10
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    const-string p3, "put"

    invoke-virtual {p2, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_1a

    aget-object p2, p4, v0

    check-cast p2, Ljava/lang/String;

    const/4 p3, 0x1

    aget-object p3, p4, p3

    invoke-virtual {p0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    aget-object p0, p1, v0

    return-object p0

    :cond_1a
    const-string p3, "remove"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2a

    aget-object p2, p4, v0

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    aget-object p0, p1, v0

    return-object p0

    :cond_2a
    const-string p3, "clear"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_38

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    aget-object p0, p1, v0

    return-object p0

    :cond_38
    const-string p0, "commit"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_43

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_44

    :cond_43
    const/4 p0, 0x0

    :goto_44
    return-object p0
.end method

.method static synthetic lambda$2(Landroid/content/SharedPreferences;Landroid/content/Context;Landroid/widget/Button;)V
    .registers 8

    .line 16
    const-string v0, "nicoidMinViews"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "nicoidMaxViews"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Views"

    const-string v2, "\u64ad\u653e\u6b21\u6578"

    const-string v3, "\u518d\u751f\u6570"

    invoke-static {p1, v3, v1, v2}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2f

    const-string p0, "Any"

    const-string v0, "\u4e0d\u9650"

    const-string v2, "\u6307\u5b9a\u306a\u3057"

    invoke-static {p1, v2, p0, v0}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_5e

    :cond_2f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_39

    const-string v0, "0"

    :cond_39
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " \uff5e "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_56

    const-string p0, "No maximum"

    const-string v2, "\u7121\u4e0a\u9650"

    const-string v3, "\u4e0a\u9650\u306a\u3057"

    invoke-static {p1, v3, p0, v2}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_5e
    new-instance v0, Landroid/text/SpannableString;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p1

    invoke-static {p1}, Le/e/a/DialogColors;->muted(Z)I

    move-result p1

    invoke-direct {p0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v2, 0x0

    const/16 v3, 0x21

    invoke-virtual {v0, p0, v2, p1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Landroid/text/style/AbsoluteSizeSpan;

    const/16 p1, 0xc

    const/4 v4, 0x1

    invoke-direct {p0, p1, v4}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0, p0, v2, p1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Landroid/text/style/AbsoluteSizeSpan;

    const/16 p1, 0xf

    invoke-direct {p0, p1, v4}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr p1, v4

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v1

    invoke-virtual {v0, p0, p1, v1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/content/Context;Landroid/view/View;)V
    .registers 5

    .line 16
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "View-count range search"

    const-string v1, "\u64ad\u653e\u6b21\u6578\u7bc4\u570d\u641c\u5c0b"

    const-string v2, "\u518d\u751f\u6570\u306e\u7bc4\u56f2\u691c\u7d22"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "A view-count range uses Niconico\'s snapshot search API. Its index updates daily, so recent uploads and current counts may be absent. Results can differ from normal search. Most popular first is unavailable."

    const-string v1, "\u6307\u5b9a\u6b21\u6578\u7bc4\u570d\u6642\u4f7f\u7528\u6bcf\u65e5\u66f4\u65b0\u7684\u5feb\u7167\u641c\u5c0b\u3002\u65b0\u5f71\u7247\u53ca\u6700\u65b0\u6b21\u6578\u53ef\u80fd\u5c1a\u672a\u53cd\u6620\uff0c\u7d50\u679c\u53ef\u80fd\u8207\u4e00\u822c\u641c\u5c0b\u4e0d\u540c\u3002\u4e0d\u652f\u63f4\u71b1\u9580\u6392\u5e8f\u3002"

    const-string v2, "\u518d\u751f\u6570\u3092\u6307\u5b9a\u3057\u305f\u5834\u5408\u306e\u307f\u3001\u30cb\u30b3\u30cb\u30b3\u306e\u30b9\u30ca\u30c3\u30d7\u30b7\u30e7\u30c3\u30c8\u691c\u7d22API\u3092\u4f7f\u7528\u3057\u307e\u3059\u3002\u691c\u7d22\u30c7\u30fc\u30bf\u306f\u6bce\u65e51\u56de\u66f4\u65b0\u3055\u308c\u3001\u65b0\u7740\u52d5\u753b\u3084\u6700\u65b0\u306e\u518d\u751f\u6570\u304c\u53cd\u6620\u3055\u308c\u306a\u3044\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u901a\u5e38\u691c\u7d22\u3068\u7d50\u679c\u304c\u7570\u306a\u308b\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u4eba\u6c17\u304c\u9ad8\u3044\u9806\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x104000a

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;[ILandroid/view/View;)V
    .registers 14

    .line 16
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p4

    invoke-static {p4}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v0, "nicoid-managed-input"

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    invoke-static {v1}, Le/e/a/NumericInput114;->configure(Landroid/widget/EditText;)V

    invoke-static {v2}, Le/e/a/NumericInput114;->configure(Landroid/widget/EditText;)V

    const-string v0, "Minimum (optional)"

    const-string v3, "\u4e0b\u9650\uff08\u9078\u586b\uff09"

    const-string v4, "\u4e0b\u9650\uff08\u7a7a\u6b04\u306f\u6307\u5b9a\u306a\u3057\uff09"

    invoke-static {p0, v4, v0, v3}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NumericInput114;->hint(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const-string v0, "Maximum (optional)"

    const-string v3, "\u4e0a\u9650\uff08\u9078\u586b\uff09"

    const-string v4, "\u4e0a\u9650\uff08\u7a7a\u6b04\u306f\u6307\u5b9a\u306a\u3057\uff09"

    invoke-static {p0, v4, v0, v3}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/NumericInput114;->hint(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const-string v0, "nicoidMinViews"

    const-string v3, ""

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "nicoidMaxViews"

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "Views"

    const-string v4, "\u64ad\u653e\u6b21\u6578"

    const-string v5, "\u518d\u751f\u6570"

    invoke-static {p0, v5, v3, v4}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    const v0, 0x104000a

    const/4 v3, 0x0

    invoke-virtual {p4, v0, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    const-string v0, "Clear"

    const-string v4, "\u6e05\u9664"

    const-string v5, "\u6307\u5b9a\u306a\u3057"

    invoke-static {p0, v5, v0, v4}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;

    invoke-direct {v4, p1, p2}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda1;-><init>(Landroid/content/SharedPreferences;Ljava/lang/Runnable;)V

    invoke-virtual {p4, v0, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    const/high16 v0, 0x1040000

    invoke-virtual {p4, v0, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    invoke-virtual {p4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-static {v7}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p4, -0x1

    invoke-virtual {v7, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v8, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;

    move-object v0, v8

    move-object v3, p3

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v7}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 16
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p2, "nicoidMinViews"

    invoke-interface {p0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p2, "nicoidMaxViews"

    invoke-interface {p0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6(Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 14

    .line 16
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p7

    invoke-static {p7}, Le/e/a/SearchSnapshot110;->bound(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/SearchSnapshot110;->bound(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v0, v4

    if-ltz p1, :cond_2d

    cmp-long p7, v2, v4

    if-ltz p7, :cond_2d

    cmp-long p7, v0, v2

    if-gtz p7, :cond_27

    goto :goto_2d

    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    :cond_2d
    :goto_2d
    if-gez p1, :cond_33

    cmp-long p7, v2, v4

    if-ltz p7, :cond_48

    :cond_33
    const/4 p7, 0x1

    aget p2, p2, p7

    const/16 p7, 0xc

    if-ne p2, p7, :cond_48

    const-string p1, "\u518d\u751f\u6570\u7bc4\u56f2\u306f\u4eba\u6c17\u304c\u9ad8\u3044\u9806\u306b\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093\u3002\u4e26\u3079\u66ff\u3048\u3092\u5909\u66f4\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string p2, "Change Most popular first sort before setting a view range."

    const-string p4, "\u8acb\u5148\u8b8a\u66f4\u71b1\u9580\u6392\u5e8f\u3002"

    invoke-static {p3, p1, p2, p4}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_48
    invoke-interface {p4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p4, "nicoidMinViews"
    :try_end_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_4e} :catch_75

    const-string p7, ""

    if-gez p1, :cond_54

    move-object p1, p7

    goto :goto_58

    :cond_54
    :try_start_54
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    :goto_58
    invoke-interface {p2, p4, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "nicoidMaxViews"

    cmp-long p4, v2, v4

    if-gez p4, :cond_63

    goto :goto_67

    :cond_63
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p7

    :goto_67
    invoke-interface {p1, p2, p7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p6}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_74
    .catch Ljava/lang/IllegalArgumentException; {:try_start_54 .. :try_end_74} :catch_75

    goto :goto_83

    :catch_75
    move-exception p1

    const-string p1, "Enter non-negative integers with minimum \u2264 maximum"

    const-string p2, "\u8acb\u8f38\u5165\u975e\u8ca0\u6574\u6578\uff0c\u4e14\u4e0b\u9650\u4e0d\u5f97\u8d85\u904e\u4e0a\u9650"

    const-string p4, "0\u4ee5\u4e0a\u306e\u6574\u6570\u3067\u3001\u4e0b\u9650 \u2266 \u4e0a\u9650\u306b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p3, p4, p1, p2}, Le/e/a/SearchSnapshot110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_83
    return-void
.end method

.method public static load(Ljava/lang/Object;)Z
    .registers 30

    .line 17
    move-object/from16 v1, p0

    const/4 v2, 0x0

    :try_start_3
    const-string v0, "a"

    invoke-static {v1, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v4, "nicoidMinViews"

    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_22

    const-string v4, "nicoidMaxViews"

    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1f} :catch_478

    if-nez v3, :cond_22

    return v2

    :cond_22
    const/4 v4, 0x1

    :try_start_23
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const-string v0, "keyword"

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "tag"

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "sortKey"

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "hotMylist"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_3f} :catch_469

    if-nez v0, :cond_461

    :try_start_41
    const-string v0, "page"

    invoke-virtual {v5, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_4f} :catch_50

    goto :goto_52

    :catch_50
    move-exception v0

    move v0, v4

    :goto_52
    int-to-long v9, v0

    const-wide/16 v11, 0x1

    sub-long/2addr v9, v11

    const-wide/16 v13, 0x20

    mul-long/2addr v9, v13

    :try_start_59
    invoke-static {v8}, Le/e/a/SearchBounds110;->sort(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v8, "https://snapshot.search.nicovideo.jp/api/v2/snapshot/video/contents/search"

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v8

    const-string v13, "q"

    if-nez v6, :cond_6c

    goto :goto_6d

    :cond_6c
    move-object v7, v6

    :goto_6d
    invoke-virtual {v8, v13, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    const-string v8, "targets"

    if-nez v6, :cond_78

    const-string v6, "tagsExact"

    goto :goto_7a

    :cond_78
    const-string v6, "title,description,tags"

    :goto_7a
    invoke-virtual {v7, v8, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v7, "fields"

    const-string v8, "contentId,title,viewCounter,commentCounter,mylistCounter,likeCounter,lengthSeconds,startTime,thumbnailUrl,userId,channelId"

    invoke-virtual {v6, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v7, "_sort"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v13, "asc"

    const-string v14, "sortOrder"

    invoke-virtual {v5, v14}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9b

    const-string v13, "+"

    goto :goto_9d

    :cond_9b
    const-string v13, "-"

    :goto_9d
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v8, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v6, "_offset"

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v6, "_limit"

    const-string v7, "32"

    invoke-virtual {v0, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v6, "_context"

    const-string v7, "nicoidRe"

    invoke-virtual {v0, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v6, "nicoidMinViews"

    const-string v7, "filters[viewCounter][gte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v13

    const-string v6, "nicoidMaxViews"

    const-string v7, "filters[viewCounter][lte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v14

    const-string v6, "minDuration"

    const-string v7, "filters[lengthSeconds][gte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v15

    const-string v6, "maxDuration"

    const-string v7, "filters[lengthSeconds][lte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v16

    const-string v6, "minRegisteredAt"

    const-string v7, "filters[startTime][gte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v17

    const-string v6, "maxRegisteredAt"

    const-string v7, "filters[startTime][lte]"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v18

    filled-new-array/range {v13 .. v18}, [[Ljava/lang/String;

    move-result-object v6

    move v7, v2

    :goto_ff
    const/4 v8, 0x6

    if-lt v7, v8, :cond_442

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_107} :catch_469

    const-wide/32 v6, 0x186a0

    cmp-long v6, v9, v6

    const-wide/16 v7, 0x0

    if-gtz v6, :cond_3ec

    :try_start_110
    sget-object v6, Le/e/a/SearchSnapshot110;->NETWORK:Ljava/lang/Object;

    monitor-enter v6
    :try_end_113
    .catch Ljava/lang/Exception; {:try_start_110 .. :try_end_113} :catch_43e

    :try_start_113
    sget-wide v13, Le/e/a/SearchSnapshot110;->nextRequest:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    sub-long/2addr v13, v15

    const-wide/16 v15, 0x7530

    cmp-long v15, v13, v15

    if-gtz v15, :cond_3e1

    cmp-long v7, v13, v7

    if-lez v7, :cond_127

    invoke-static {v13, v14}, Ljava/lang/Thread;->sleep(J)V

    :cond_127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    new-instance v13, Ljava/net/URL;

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v13, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Ljava/net/HttpURLConnection;

    const/16 v0, 0x2710

    invoke-virtual {v13, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v13, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v0, "User-Agent"

    const-string v14, "nicoidRe/1.10.1"

    invoke-virtual {v13, v0, v14}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p0 .. p0}, Le/e/a/Followup3;->loading(Ljava/lang/Object;)V

    invoke-static {v13}, Le/e/a/Followup3;->connected(Ljava/net/HttpURLConnection;)V
    :try_end_154
    .catchall {:try_start_113 .. :try_end_154} :catchall_3e9

    :try_start_154
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v3, 0x1f7

    if-ne v0, v3, :cond_167

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    const-wide/32 v19, 0x493e0

    add-long v17, v17, v19

    sput-wide v17, Le/e/a/SearchSnapshot110;->nextRequest:J

    :cond_167
    const/16 v3, 0xc8

    if-ne v0, v3, :cond_3a8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_170
    .catchall {:try_start_154 .. :try_end_170} :catchall_3c1

    :try_start_170
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const-string v11, "UTF-8"

    invoke-direct {v3, v4, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_17b
    .catchall {:try_start_170 .. :try_end_17b} :catchall_39a

    const/16 v4, 0x1000

    :try_start_17d
    new-array v4, v4, [C

    :goto_17f
    invoke-virtual {v3, v4}, Ljava/io/Reader;->read([C)I

    move-result v11
    :try_end_183
    .catchall {:try_start_17d .. :try_end_183} :catchall_390

    const/4 v12, -0x1

    if-ne v11, v12, :cond_36b

    :try_start_186
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_189
    .catchall {:try_start_186 .. :try_end_189} :catchall_39a

    :try_start_189
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "meta"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v4, "totalCount"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v11

    const-wide/32 v14, 0x186c0

    invoke-static {v14, v15, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    const-string v0, "data"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SnapshotOwners110;->names(Lorg/json/JSONArray;)Ljava/util/Map;

    move-result-object v3

    move v4, v2

    :goto_1b0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v14
    :try_end_1b4
    .catchall {:try_start_189 .. :try_end_1b4} :catchall_3c1

    if-lt v4, v14, :cond_1db

    :try_start_1b6
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    sget-wide v2, Le/e/a/SearchSnapshot110;->nextRequest:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    sub-long v7, v18, v7

    move-wide/from16 v21, v11

    const-wide/16 v11, 0x4e20

    invoke-static {v11, v12, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    add-long/2addr v13, v7

    invoke-static {v2, v3, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Le/e/a/SearchSnapshot110;->nextRequest:J

    monitor-exit v6
    :try_end_1d5
    .catchall {:try_start_1b6 .. :try_end_1d5} :catchall_3e9

    move-wide/from16 v25, v9

    move-wide/from16 v7, v21

    goto/16 :goto_3ee

    :cond_1db
    move-wide/from16 v21, v11

    :try_start_1dd
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "e.e.a.x1"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    new-array v14, v2, [Ljava/lang/Class;

    invoke-virtual {v12, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v12

    new-array v14, v2, [Ljava/lang/Object;

    invoke-virtual {v12, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    const-string v14, "contentId"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "b"

    invoke-static {v12, v15, v14}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v15, "a"

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v23, v0

    const-string v0, "https://www.nicovideo.jp/watch/"

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v15, v0}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "h"

    const-string v2, "title"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v0, v2}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "c"

    const-string v2, "thumbnailUrl"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v0, v2}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "g"

    int-to-long v1, v4

    add-long/2addr v1, v9

    const-wide/16 v18, 0x1

    add-long v1, v1, v18

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v12, v0, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "p"

    const-string v1, "viewCounter"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v12, v0, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "q"

    const-string v1, "commentCounter"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v12, v0, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "m"

    const-string v1, "mylistCounter"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v12, v0, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "lengthSeconds"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "d"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v15, "%d:%02d"

    div-int/lit8 v24, v0, 0x3c

    move-wide/from16 v25, v9

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    rem-int/lit8 v0, v0, 0x3c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v9, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v2, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v12, v1, v0}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "f"

    const-string v1, "startTime"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ModernRanking;->formatJst(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-static {v12, v0, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "view"

    const-string v2, "viewCounter"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v0, v1, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "comment"

    const-string v2, "commentCounter"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v0, v1, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "mylist"

    const-string v2, "mylistCounter"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v0, v1, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "like"

    const-string v2, "likeCounter"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {v0, v1, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "e"

    invoke-static {v0}, Le/e/a/ModernRanking;->countInfo(Lorg/json/JSONObject;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v12, v1, v0}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "userId"

    const-string v1, ""

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "y"

    const-string v2, "channelId"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_304

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v9, "Channel ID: "

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "channelId"

    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_306

    :cond_304
    const-string v2, ""

    :goto_306
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v12, v1, v2}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "owner"

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "id"

    const-string v15, "userId"
    :try_end_31d
    .catchall {:try_start_1dd .. :try_end_31d} :catchall_3c1

    move-wide/from16 v27, v7

    :try_start_31f
    const-string v7, "channelId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v15, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v10, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "ownerType"

    const-string v9, "[0-9]+"

    invoke-virtual {v0, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_33a

    const-string v9, "user"

    goto :goto_33c

    :cond_33a
    const-string v9, "channel"

    :goto_33c
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "name"

    const-string v9, ""

    invoke-interface {v3, v0, v9}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v7, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v12, v0}, Le/e/a/ContentFilterId193;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_35c
    .catchall {:try_start_31f .. :try_end_35c} :catchall_3bf

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p0

    move-wide/from16 v11, v21

    move-object/from16 v0, v23

    move-wide/from16 v9, v25

    move-wide/from16 v7, v27

    const/4 v2, 0x0

    goto/16 :goto_1b0

    :cond_36b
    move-wide/from16 v27, v7

    move-wide/from16 v25, v9

    const-wide/16 v18, 0x1

    const/4 v1, 0x0

    :try_start_372
    invoke-virtual {v0, v4, v1, v11}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/high16 v2, 0x200000

    if-gt v1, v2, :cond_386

    const/4 v2, 0x0

    move-object/from16 v1, p0

    move-wide/from16 v9, v25

    move-wide/from16 v7, v27

    goto/16 :goto_17f

    :cond_386
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Oversized search"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_38e
    .catchall {:try_start_372 .. :try_end_38e} :catchall_38e

    :catchall_38e
    move-exception v0

    goto :goto_393

    :catchall_390
    move-exception v0

    move-wide/from16 v27, v7

    :goto_393
    move-object v1, v0

    :try_start_394
    invoke-virtual {v3}, Ljava/io/Reader;->close()V

    throw v1
    :try_end_398
    .catchall {:try_start_394 .. :try_end_398} :catchall_398

    :catchall_398
    move-exception v0

    goto :goto_39e

    :catchall_39a
    move-exception v0

    move-wide/from16 v27, v7

    const/4 v1, 0x0

    :goto_39e
    if-eqz v1, :cond_3a6

    if-eq v1, v0, :cond_3a7

    :try_start_3a2
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3a7

    :cond_3a6
    move-object v1, v0

    :cond_3a7
    :goto_3a7
    throw v1

    :cond_3a8
    move-wide/from16 v27, v7

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Snapshot HTTP "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_3be
    .catchall {:try_start_3a2 .. :try_end_3be} :catchall_3bf

    goto :goto_3a7

    :catchall_3bf
    move-exception v0

    goto :goto_3c4

    :catchall_3c1
    move-exception v0

    move-wide/from16 v27, v7

    :goto_3c4
    :try_start_3c4
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    sget-wide v1, Le/e/a/SearchSnapshot110;->nextRequest:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v7, v7, v27

    const-wide/16 v9, 0x4e20

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    add-long/2addr v3, v7

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    sput-wide v1, Le/e/a/SearchSnapshot110;->nextRequest:J

    :goto_3e0
    throw v0

    :cond_3e1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Snapshot search is temporarily unavailable; retry later"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3e0

    :catchall_3e9
    move-exception v0

    monitor-exit v6
    :try_end_3eb
    .catchall {:try_start_3c4 .. :try_end_3eb} :catchall_3e9

    :try_start_3eb
    throw v0

    :cond_3ec
    move-wide/from16 v25, v9

    .line 18
    :goto_3ee
    const-string v0, "f"
    :try_end_3f0
    .catch Ljava/lang/Exception; {:try_start_3eb .. :try_end_3f0} :catch_43e

    move-object/from16 v1, p0

    :try_start_3f2
    invoke-static {v1, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v0, v2

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "f"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "j"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "i"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    int-to-long v3, v3

    add-long v9, v25, v3

    cmp-long v3, v9, v7

    if-gez v3, :cond_432

    goto :goto_434

    :cond_432
    add-int/lit8 v0, v0, 0x1

    :goto_434
    invoke-virtual {v2, v1, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    const-string v0, "e.e.a.e0$i"

    invoke-static {v1, v0, v5}, Le/e/a/SearchSnapshot110;->post(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    :goto_43c
    const/4 v1, 0x1

    return v1

    :catch_43e
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_46a

    .line 17
    :cond_442
    move-wide/from16 v25, v9

    move-wide/from16 v18, v11

    aget-object v2, v6, v7

    const/4 v3, 0x0

    aget-object v4, v2, v3

    invoke-virtual {v5, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_457

    const/4 v4, 0x1

    aget-object v2, v2, v4

    invoke-virtual {v0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_457
    add-int/lit8 v7, v7, 0x1

    move-wide/from16 v11, v18

    move-wide/from16 v9, v25

    const/4 v2, 0x0

    const/4 v4, 0x1

    goto/16 :goto_ff

    :cond_461
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Snapshot search does not support trending sort"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_469
    .catch Ljava/lang/Exception; {:try_start_3f2 .. :try_end_469} :catch_469

    .line 18
    :catch_469
    move-exception v0

    :goto_46a
    const-string v2, "nicoid-search"

    const-string v3, "Snapshot search failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v0, "e.e.a.e0$c"

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Le/e/a/SearchSnapshot110;->post(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_43c

    .line 17
    :catch_478
    move-exception v0

    const/4 v1, 0x0

    return v1
.end method

.method static post(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 19
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-nez p2, :cond_13

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    goto :goto_23

    :cond_13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/util/ArrayList;

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0, v1, v2}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    :goto_23
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    if-nez p2, :cond_32

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_3f

    :cond_32
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p0, p2, v0}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_3f
    check-cast p1, Ljava/lang/Runnable;

    const-string p2, "l"

    invoke-static {p0, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4c} :catch_4d

    goto :goto_55

    :catch_4d
    move-exception p0

    const-string p1, "nicoid-search"

    const-string p2, "Cannot deliver search result"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_55
    return-void
.end method

.method static preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 15

    .line 8
    sget-object v0, Le/e/a/SearchSnapshot110;->MODELS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    if-eqz v0, :cond_d

    sput-object v0, Le/e/a/SearchSnapshot110;->current:Landroid/content/SharedPreferences;

    return-object v0

    :cond_d
    new-instance v0, Ljava/util/HashMap;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    sget-object v1, Le/e/a/SearchSnapshot110;->EDITS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_33

    instance-of v2, p0, Landroid/app/Activity;

    if-eqz v2, :cond_33

    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    :cond_33
    const-string v2, "nicoidMinViews"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "nicoidMaxViews"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    const/4 v4, 0x0

    if-eqz v1, :cond_10f

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_10f

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    move v3, v4

    :goto_4f
    const/4 v5, 0x2

    if-lt v3, v5, :cond_100

    const-string v6, "from"

    const-string v7, "to"

    const-string v8, "min"

    const-string v9, "max"

    filled-new-array {v6, v7, v8, v9}, [Ljava/lang/String;

    move-result-object v10

    move v2, v4

    :goto_5f
    const-string v3, "search_range_"

    const/4 v11, 0x4

    if-lt v2, v11, :cond_ea

    :try_start_64
    const-string v2, "minRegisteredAt"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "maxRegisteredAt"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array {v2, v6}, [[Ljava/lang/String;

    move-result-object v2

    move v6, v4

    :goto_75
    const/4 v7, 0x1

    if-lt v6, v5, :cond_b4

    const-string v2, "minDuration"

    filled-new-array {v2, v8}, [Ljava/lang/String;

    move-result-object v2

    const-string v6, "maxDuration"

    filled-new-array {v6, v9}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array {v2, v6}, [[Ljava/lang/String;

    move-result-object v2

    move v6, v4

    :goto_89
    if-lt v6, v5, :cond_8d

    goto/16 :goto_10f

    :cond_8d
    aget-object v8, v2, v6

    aget-object v9, v8, v4

    invoke-virtual {v1, v9}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_b1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v8, v8, v7

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b1
    add-int/lit8 v6, v6, 0x1

    goto :goto_89

    :cond_b4
    aget-object v10, v2, v6

    aget-object v11, v10, v4

    invoke-virtual {v1, v11}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_e5

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v7, v10, v7

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v10, Ljava/text/SimpleDateFormat;

    const-string v12, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v10, v12, v13}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v0, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e5
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_e5} :catch_e8

    :cond_e5
    add-int/lit8 v6, v6, 0x1

    goto :goto_75

    :catch_e8
    move-exception v1

    goto :goto_10f

    :cond_ea
    aget-object v11, v10, v2

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5f

    :cond_100
    aget-object v5, v2, v3

    invoke-virtual {v1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_10b

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_4f

    .line 10
    :cond_10f
    :goto_10f
    new-instance v1, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda0;-><init>(Ljava/util/HashMap;)V

    const-class v0, Landroid/content/SharedPreferences;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-class v2, Landroid/content/SharedPreferences;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-static {v0, v2, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    filled-new-array {v0}, [Landroid/content/SharedPreferences;

    move-result-object v0

    aget-object v0, v0, v4

    sget-object v1, Le/e/a/SearchSnapshot110;->MODELS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sput-object v0, Le/e/a/SearchSnapshot110;->current:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static restore(Landroid/content/Context;[I)V
    .registers 6

    .line 11
    invoke-static {p0}, Le/e/a/SearchSnapshot110;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    sget-object v0, Le/e/a/SearchSnapshot110;->EDITS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_e

    return-void

    :cond_e
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v0, "minRegisteredAt"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-nez v0, :cond_28

    const-string v0, "maxRegisteredAt"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_26

    goto :goto_28

    :cond_26
    move v0, v1

    goto :goto_29

    :cond_28
    :goto_28
    move v0, v2

    :goto_29
    const/4 v3, 0x2

    aput v0, p1, v3

    const-string v0, "minDuration"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3c

    const-string v0, "maxDuration"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3d

    :cond_3c
    move v1, v2

    :cond_3d
    const/4 p0, 0x3

    aput v1, p1, p0

    return-void
.end method

.method static sortControl(Landroid/content/Context;Landroid/view/View;Landroid/content/SharedPreferences;)V
    .registers 5

    .line 12
    const p0, 0x7f080188

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    instance-of p1, p0, Landroid/widget/Spinner;

    if-nez p1, :cond_c

    return-void

    :cond_c
    check-cast p0, Landroid/widget/Spinner;

    invoke-virtual {p0}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    invoke-virtual {p0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    new-instance v1, Le/e/a/SearchSnapshot110$1;

    invoke-direct {v1, p1, p2}, Le/e/a/SearchSnapshot110$1;-><init>(Landroid/widget/SpinnerAdapter;Landroid/content/SharedPreferences;)V

    invoke-virtual {p0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {p0, v0}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 7
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static url(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 13
    sget-object v0, Le/e/a/SearchSnapshot110;->current:Landroid/content/SharedPreferences;

    if-nez v0, :cond_5

    return-object p0

    :cond_5
    sget-object v0, Le/e/a/SearchSnapshot110;->current:Landroid/content/SharedPreferences;

    const-string v1, "nicoidMinViews"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Le/e/a/SearchSnapshot110;->current:Landroid/content/SharedPreferences;

    const-string v4, "nicoidMaxViews"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_24

    return-object p0

    :cond_24
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_35

    invoke-virtual {p0, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_35
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3e

    invoke-virtual {p0, v4, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_3e
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
