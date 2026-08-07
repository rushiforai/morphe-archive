.class public Ll/jny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xmy;
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/xmy<",
        "Ljava/lang/String;",
        ">;",
        "Lcom/tantan/library/svga/data/request/RequestCallback;"
    }
.end annotation


# instance fields
.field public final a:Lcom/tantan/library/svga/SVGAnimationView;

.field public final b:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/jny;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    iput-object p2, p0, Ll/jny;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lcom/tantan/library/svga/SVGAnimationView;->setRequestCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGAnimationView;->setRequestCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jny;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jny;->g(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jny;->f(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jny;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jny;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jny;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Ll/jny;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public g(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jny;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object p2, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->BEFORE:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Ll/jny;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    return-void
.end method
