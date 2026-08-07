.class public Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;,
        Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;
    }
.end annotation


# instance fields
.field public final GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

.field public final GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

.field public final LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

.field public final LiveVChatOpenH5Event:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

.field public final LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

.field public final SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

.field public final SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

.field public final TraysViewEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;

.field private final mEventBusImpl:Ll/v3f;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v3f;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v3f;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->mEventBusImpl:Ll/v3f;

    .line 10
    .line 11
    new-instance v1, Ll/c7s;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/c7s;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v3f;->j(Ll/cu6;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftTraysEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$b;

    .line 39
    .line 40
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->TraysViewEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$h;

    .line 46
    .line 47
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SendGiftEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$g;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 67
    .line 68
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatOpenH5Event:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 74
    .line 75
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;)Ll/v3f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->mEventBusImpl:Ll/v3f;

    return-object p0
.end method
