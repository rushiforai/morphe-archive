.class public final Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u00012\u00020\u0002B%\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\rJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u000bH\u0014\u00a2\u0006\u0004\u0008\u0013\u0010\rJ\u0019\u0010\u0016\u001a\u00020\u000b2\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0019R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;",
        "Landroid/widget/FrameLayout;",
        "Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "b",
        "()V",
        "d",
        "c",
        "",
        "getURl",
        "()Ljava/lang/String;",
        "onDetachedFromWindow",
        "Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;",
        "event",
        "a",
        "(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;)V",
        "Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;",
        "Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;",
        "mkWebViewHelper",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mWebView",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

.field private b:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 18
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->b()Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "native"

    .line 12
    .line 13
    invoke-virtual {p1, p0, p2}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->c(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 17
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->d()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->getURl()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method private final c()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final d()V
    .locals 3

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 17
    .line 18
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView$a;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView$a;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    check-cast v1, Landroid/app/Activity;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 48
    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    invoke-static {}, Ll/sjw;->i()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, ""

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void

    .line 61
    :cond_1
    const-string p0, "null cannot be cast to non-null type android.app.Activity"

    .line 62
    .line 63
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private final getURl()Ljava/lang/String;
    .locals 2

    .line 1
    const-string p0, "https://test-s.immomo.com/fep/momo/m-fes-sdk/fdt-landing-page/monitor.html?_bid=1001009"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/hellogroup/mk/fdt/FDTManager;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "ip"

    .line 18
    .line 19
    invoke-virtual {p0, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    return-object p0
.end method


# virtual methods
.method public a(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;)V
    .locals 2
    .param p1    # Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const v1, -0x4bea2adf

    .line 15
    .line 16
    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const v1, 0x6877d05

    .line 20
    .line 21
    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const-string v0, "fdt_disconnect"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->c()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    const-string v0, "fdt_connect"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->b()V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/fdt/view/FDTStatusView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-static {}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->b()Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "native"

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager;->e(Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$a;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
