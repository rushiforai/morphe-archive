.class public final Ll/ke60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zd60;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ke60;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "l/ke60$a",
        "Ll/zd60;",
        "",
        "a",
        "()V",
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
.field public final synthetic a:Ll/ke60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ke60<",
            "TD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ke60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ke60<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ke60$a;->a:Ll/ke60;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ke60$a;->a:Ll/ke60;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ke60;->U3(Ll/ke60;)Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ke60$a;->a:Ll/ke60;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {p0, v0, v1}, Ll/ke60;->W3(Ll/ke60;Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;Z)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, v0}, Ll/ke60;->X3(Ll/ke60;Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p0}, Ll/ke60;->V3(Ll/ke60;)Ll/iam;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;->z0()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
