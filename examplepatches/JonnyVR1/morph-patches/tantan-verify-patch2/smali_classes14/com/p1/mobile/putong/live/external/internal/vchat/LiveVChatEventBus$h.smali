.class public Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "3_1"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
