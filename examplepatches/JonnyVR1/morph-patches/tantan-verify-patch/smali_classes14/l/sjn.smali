.class public Ll/sjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rjn;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

.field public b:Ll/rjn;

.field public c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sjn;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Ll/rjn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjn;->b:Ll/rjn;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rjn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sjn;->a(Ll/rjn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, Ll/xec0;->P0:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/sjn;->d:Landroid/view/View;

    .line 17
    .line 18
    sget p2, Ll/ldc0;->J2:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 25
    .line 26
    iput-object p1, p0, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 27
    .line 28
    iget-object p0, p0, Ll/sjn;->d:Landroid/view/View;

    .line 29
    .line 30
    return-object p0
.end method
