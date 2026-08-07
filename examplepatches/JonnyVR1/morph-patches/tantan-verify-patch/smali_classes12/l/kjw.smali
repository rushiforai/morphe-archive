.class public final Ll/kjw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/kjw;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mkWebView",
        "Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;",
        "webViewHelper",
        "",
        "a",
        "(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V",
        "b",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V",
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
.field public static final INSTANCE:Ll/kjw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kjw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kjw;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kjw;->INSTANCE:Ll/kjw;

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


# virtual methods
.method public final a(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "media"

    .line 13
    .line 14
    invoke-virtual {p3, v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->H(Ljava/lang/String;Ll/qpl;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/hm3;

    .line 18
    .line 19
    invoke-direct {p0, p2, p3}, Ll/hm3;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/flw;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "ui"

    .line 23
    .line 24
    invoke-virtual {p3, v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->H(Ljava/lang/String;Ll/qpl;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/oj3;

    .line 28
    .line 29
    invoke-direct {p0, p1, p2}, Ll/oj3;-><init>(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 30
    .line 31
    .line 32
    const-string v0, "analyze"

    .line 33
    .line 34
    invoke-virtual {p3, v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->H(Ljava/lang/String;Ll/qpl;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2, p3}, Ll/ojw;->a(Landroid/content/Context;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/hk3;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/hk3;-><init>(Ll/hul;)V

    .line 12
    .line 13
    .line 14
    const-string v1, "device"

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    if-eqz p0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/yj3;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/yj3;-><init>(Ll/hul;)V

    .line 24
    .line 25
    .line 26
    const-string v1, "app"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    if-eqz p0, :cond_2

    .line 32
    .line 33
    new-instance v0, Ll/nj3;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Ll/nj3;-><init>(Ll/hul;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "action"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    if-eqz p0, :cond_3

    .line 44
    .line 45
    new-instance v0, Ll/em3;

    .line 46
    .line 47
    invoke-direct {v0, p1}, Ll/em3;-><init>(Ll/hul;)V

    .line 48
    .line 49
    .line 50
    const-string v1, "sensor"

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    if-eqz p0, :cond_4

    .line 56
    .line 57
    new-instance v0, Ll/pl3;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/pl3;-><init>(Ll/hul;)V

    .line 60
    .line 61
    .line 62
    const-string p1, "http"

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    return-void
.end method
