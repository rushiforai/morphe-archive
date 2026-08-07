.class public final Ll/i4h0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\"\u0010\u0003\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\u0008\u0010\n\"\u0004\u0008\u000b\u0010\u000cR$\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\r\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/i4h0;",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;",
        "item",
        "Landroid/view/View;",
        "view",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;Landroid/view/View;)V",
        "a",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;",
        "setItem",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;)V",
        "b",
        "Landroid/view/View;",
        "()Landroid/view/View;",
        "setView",
        "(Landroid/view/View;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Landroid/view/View;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;Landroid/view/View;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/i4h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;

    .line 8
    .line 9
    iput-object p2, p0, Ll/i4h0;->b:Landroid/view/View;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i4h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i4h0;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method
