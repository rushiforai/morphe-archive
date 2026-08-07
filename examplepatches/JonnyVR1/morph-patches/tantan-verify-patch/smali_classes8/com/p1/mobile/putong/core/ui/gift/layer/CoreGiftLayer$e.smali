.class public Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->x(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->l(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->a:Ll/x20;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->a:Ll/x20;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/x20;->call()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
