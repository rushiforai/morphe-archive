.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->l0(Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of p1, p1, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 14
    .line 15
    invoke-static {p1}, Ll/so0;->a(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)Ll/so0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/so0;->b()Ll/cp0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/cp0;->c()D

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-virtual {p1}, Ll/cp0;->b()D

    .line 28
    .line 29
    .line 30
    move-result-wide p1

    .line 31
    div-double/2addr v0, p1

    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    int-to-double p1, p1

    .line 39
    mul-double/2addr p1, v0

    .line 40
    double-to-int p1, p1

    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    new-array v0, v0, [Landroid/view/View;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    aput-object p2, v0, v1

    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;->b:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method
