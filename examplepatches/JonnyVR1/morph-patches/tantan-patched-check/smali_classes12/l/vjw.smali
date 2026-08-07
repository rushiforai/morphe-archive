.class public final Ll/vjw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JW\u0010\u0011\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\r\u00a2\u0006\u0004\u0008\u0011\u0010\u0012JA\u0010\u0015\u001a\u0004\u0018\u00010\t2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/vjw;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "",
        "startUrl",
        "loadingCustomFlag",
        "Landroid/view/ViewGroup;",
        "viewContainer",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mkWebView",
        "",
        "needDefaultManager",
        "isPanel",
        "Ll/d2f;",
        "b",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Boolean;Z)Ll/d2f;",
        "url",
        "customNavbar",
        "a",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Landroid/view/ViewGroup;",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Ll/vjw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vjw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vjw;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vjw;->INSTANCE:Ll/vjw;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/vjw;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Boolean;ZILjava/lang/Object;)Ll/d2f;
    .locals 8

    .line 1
    and-int/lit8 v0, p8, 0x20

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    :cond_0
    move-object v6, p6

    .line 8
    and-int/lit8 p6, p8, 0x40

    .line 9
    .line 10
    if-eqz p6, :cond_1

    .line 11
    .line 12
    const/4 p6, 0x0

    .line 13
    move v7, p6

    .line 14
    :goto_0
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move-object v2, p2

    .line 17
    move-object v3, p3

    .line 18
    move-object v4, p4

    .line 19
    move-object v5, p5

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move v7, p7

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    invoke-virtual/range {v0 .. v7}, Ll/vjw;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Boolean;Z)Ll/d2f;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Landroid/view/ViewGroup;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p3, :cond_2

    .line 3
    .line 4
    invoke-static {p3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2, p3, p5}, Ll/ojw;->g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Landroid/view/ViewGroup;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    if-eqz p4, :cond_1

    .line 26
    .line 27
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    const/4 p2, -0x1

    .line 30
    const/4 p3, -0x2

    .line 31
    invoke-direct {p0, p2, p3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p4, p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-object p1

    .line 38
    :cond_2
    :goto_0
    return-object p0
.end method

.method public final b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/Boolean;Z)Ll/d2f;
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Boolean;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    if-eqz p2, :cond_2

    .line 5
    .line 6
    if-eqz p3, :cond_2

    .line 7
    .line 8
    if-eqz p4, :cond_2

    .line 9
    .line 10
    if-eqz p5, :cond_2

    .line 11
    .line 12
    invoke-static {p3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    move-object v2, p1

    .line 25
    move-object v3, p2

    .line 26
    move-object v4, p3

    .line 27
    move-object v5, p5

    .line 28
    move v6, p7

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/ojw;->r(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Lcom/hellogroup/mk/business/widget/enhance/MKEnhanceView;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object p1, p0

    .line 37
    :goto_0
    if-nez p1, :cond_1

    .line 38
    .line 39
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-static {p6, p2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    new-instance p1, Lcom/hellogroup/mk/business/widget/enhance/MKEnhanceViewDefault;

    .line 48
    .line 49
    invoke-direct {p1, v2, v5, v6}, Lcom/hellogroup/mk/business/widget/enhance/MKEnhanceViewDefault;-><init>(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    if-eqz p1, :cond_2

    .line 53
    .line 54
    new-instance p0, Ll/d2f;

    .line 55
    .line 56
    invoke-direct {p0, v2}, Ll/d2f;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p4, v3, v4, p1}, Ll/d2f;->a(Landroid/view/ViewGroup;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/business/widget/enhance/MKEnhanceView;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-object p0
.end method
