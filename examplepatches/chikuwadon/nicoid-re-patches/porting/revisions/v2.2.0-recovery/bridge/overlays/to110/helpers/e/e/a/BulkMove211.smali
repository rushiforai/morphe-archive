.class public final Le/e/a/BulkMove211;
.super Ljava/lang/Object;
.source "BulkMove211.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "nicoid-v211-bulk-move"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static add(Landroid/widget/LinearLayout;Ljava/lang/Object;Z)V
    .registers 6

    .line 75
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 76
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "nicoid-v211-bulk-move"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 75
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 79
    invoke-static {v0}, Le/e/a/BulkMove211;->newButton(Landroid/content/Context;)Landroid/widget/Button;

    move-result-object v1

    .line 80
    new-instance v2, Le/e/a/BulkMove211$0;

    invoke-direct {v2, v1, p2, p1, v0}, Le/e/a/BulkMove211$0;-><init>(Landroid/widget/Button;ZLjava/lang/Object;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 100
    const/16 p2, 0x30

    invoke-static {v0, p2}, Le/e/a/BulkMove211;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 v2, -0x2

    invoke-direct {p1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 101
    const/16 p2, 0x8

    invoke-static {v0, p2}, Le/e/a/BulkMove211;->dp(Landroid/content/Context;I)I

    move-result p2

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 102
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p2

    const/4 v0, 0x1

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p0, v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 103
    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 38
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V
    .registers 3

    .line 23
    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/BulkMove211;->add(Landroid/widget/LinearLayout;Ljava/lang/Object;Z)V

    .line 25
    return-void

    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public static installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V
    .registers 3

    .line 18
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    invoke-static {p1}, Le/e/a/BulkMove211;->nativeMylist(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/BulkMove211;->add(Landroid/widget/LinearLayout;Ljava/lang/Object;Z)V

    .line 20
    return-void

    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$add$0(Landroid/widget/Button;ZLjava/lang/Object;Landroid/content/Context;Landroid/view/View;)V
    .registers 7

    .line 81
    invoke-virtual {p0}, Landroid/widget/Button;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 83
    :cond_0
    const/4 p0, 0x1

    const/4 p4, 0x0

    if-eqz p1, :cond_1

    .line 84
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v0, "moveSelected"

    new-array v1, p4, [Ljava/lang/Class;

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 85
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 86
    new-array p0, p4, [Ljava/lang/Object;

    invoke-virtual {p1, p2, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    goto :goto_0

    .line 90
    :cond_1
    const-string p1, "com.sauzask.nicoid.NicoidVideoListFragment$j"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 91
    new-array p0, p0, [Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    aput-object v0, p0, p4

    invoke-virtual {p1, p0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    .line 92
    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View$OnClickListener;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    goto :goto_1

    .line 94
    :catch_0
    move-exception p0

    .line 95
    const-string p1, "nicoid-bulk"

    const-string p2, "Bulk transfer action unavailable"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p3}, Le/e/a/BulkMove211;->moveText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " failed"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p0, p4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 98
    :goto_1
    return-void
.end method

.method private static moveText(Landroid/content/Context;)Ljava/lang/String;
    .registers 8

    .line 43
    const-string/jumbo v0, "\u79fb\u52d5"

    :try_start_0
    const-string v1, "e.e.a.UiStrings"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "translate"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 44
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 45
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 46
    :catch_0
    move-exception v1

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 48
    const-string v1, "ja"

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    const-string v1, "zh"

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "Move"

    .line 48
    :goto_0
    return-object v0
.end method

.method private static nativeMylist(Ljava/lang/Object;)Z
    .registers 4

    .line 29
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "g0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    .line 30
    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    const/16 v2, 0x9

    if-ne v1, v2, :cond_1

    .line 31
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "h0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x4

    if-eq p0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 30
    :goto_0
    return v0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    return v0
.end method

.method private static newButton(Landroid/content/Context;)Landroid/widget/Button;
    .registers 9

    .line 56
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "e.e.a.PanelUi"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "button"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v0

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 57
    invoke-virtual {v1, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 58
    invoke-static {p0}, Le/e/a/BulkMove211;->moveText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {p0, v2}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 59
    const-string v2, "e.e.a.UiDialogs"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v5, "actionButton"

    new-array v3, v3, [Ljava/lang/Class;

    const-class v7, Landroid/widget/Button;

    aput-object v7, v3, v0

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v7, v3, v6

    invoke-virtual {v2, v5, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 60
    invoke-virtual {v2, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 61
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    goto :goto_0

    .line 62
    :catch_0
    move-exception v1

    .line 63
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 64
    invoke-static {p0}, Le/e/a/BulkMove211;->moveText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 66
    :goto_0
    const/high16 p0, 0x41500000    # 13.0f

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setTextSize(F)V

    .line 67
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setMinWidth(I)V

    .line 68
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 69
    const-string p0, "nicoid-v211-bulk-move"

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 70
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 71
    return-object v1
.end method

.method public static refresh(Landroid/widget/LinearLayout;I)V
    .registers 7

    .line 106
    if-nez p0, :cond_0

    return-void

    .line 107
    :cond_0
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 108
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 109
    const-string v3, "nicoid-v211-bulk-move"

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-lez p1, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 107
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 111
    :cond_3
    return-void
.end method
