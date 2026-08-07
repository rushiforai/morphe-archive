.class public final Ll/qtj0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vtj0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qtj0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u000f\u0010\u0005\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "l/qtj0$b",
        "Ll/vtj0$a;",
        "",
        "a",
        "()V",
        "b",
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
.field public final synthetic a:Ll/qtj0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;


# direct methods
.method public constructor <init>(Ll/qtj0;Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qtj0$b;->a:Ll/qtj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qtj0$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static c(Ll/qtj0;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qtj0;->V3(Ll/qtj0;)Ll/vtj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "confirmDialog"

    .line 8
    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/vtj0;->c()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtj0$b;->a:Ll/qtj0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qtj0$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 4
    .line 5
    new-instance v1, Ll/rtj0;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/rtj0;-><init>(Ll/qtj0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Ll/qtj0;->U3(Ll/qtj0;Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;Lkotlin/jvm/functions/Function0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qtj0$b;->a:Ll/qtj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/qtj0;->V3(Ll/qtj0;)Ll/vtj0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "confirmDialog"

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :cond_0
    invoke-virtual {v0}, Ll/vtj0;->c()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/qtj0$b;->a:Ll/qtj0;

    .line 19
    .line 20
    invoke-static {p0}, Ll/qtj0;->X3(Ll/qtj0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
