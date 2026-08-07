.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->b:Ll/x20;

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
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;->b:Ll/x20;

    .line 11
    .line 12
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
