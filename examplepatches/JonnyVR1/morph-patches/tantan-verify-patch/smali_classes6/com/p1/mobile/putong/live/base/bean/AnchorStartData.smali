.class public Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;,
        Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;
    }
.end annotation


# static fields
.field public static final ANCHOR_SOURCE_BACK_FROM_OFFICIAL_SHOW:Ljava/lang/String; = "back-from-official-show"

.field public static final ANCHOR_SOURCE_H5:Ljava/lang/String; = "H5"

.field public static final ANCHOR_SOURCE_MULTI_CALL_MATCH:Ljava/lang/String; = "moment-nearby-match"

.field public static final ANCHOR_SOURCE_P_LIVE:Ljava/lang/String; = "p_live"


# instance fields
.field public final anchorSource:Ljava/lang/String;

.field public final gameType:Ljava/lang/String;

.field public final isFromFloatWindow:Z

.field public final needFinish:Z

.field public final needVerification:Z

.field public final switchRoomData:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

.field public final template:Ljava/lang/String;

.field public final topicId:Ljava/lang/String;

.field public final traceId:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public final voiceEntranceType:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->i(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->h(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->topicId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->d(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->needFinish:Z

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->e(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->needVerification:Z

    .line 27
    .line 28
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->traceId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->j(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->voiceEntranceType:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->c(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->isFromFloatWindow:Z

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->f(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->f(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->switchRoomData:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 61
    .line 62
    const-string v0, "back-from-official-show"

    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const/4 v0, 0x0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->switchRoomData:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->a(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 75
    .line 76
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->g(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->template:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->b(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->gameType:Ljava/lang/String;

    .line 87
    .line 88
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;Ll/xm0;)V
    .locals 0

    .line 89
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;-><init>(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;)V

    return-void
.end method

.method public static getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
