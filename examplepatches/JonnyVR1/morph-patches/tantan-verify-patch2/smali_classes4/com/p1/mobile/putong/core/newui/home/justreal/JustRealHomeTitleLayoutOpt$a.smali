.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
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

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->b:Lv/VImage;

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->f()Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->b:Lv/VImage;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p2, p1}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->f()Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
