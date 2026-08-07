.class public final synthetic Ll/o81$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/o81;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->values()[Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    :try_start_0
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->endAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    :catch_0
    const/4 v2, 0x2

    .line 18
    :try_start_1
    sget-object v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->settleAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    aput v2, v0, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 25
    .line 26
    :catch_1
    const/4 v3, 0x3

    .line 27
    :try_start_2
    sget-object v4, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->endPledgeAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    aput v3, v0, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 34
    .line 35
    :catch_2
    sput-object v0, Ll/o81$a;->a:[I

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;->values()[Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    array-length v0, v0

    .line 42
    new-array v0, v0, [I

    .line 43
    .line 44
    :try_start_3
    sget-object v4, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;->refreshAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    aput v1, v0, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 51
    .line 52
    :catch_3
    :try_start_4
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;->updateRank:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 59
    .line 60
    :catch_4
    :try_start_5
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;->updateWorth:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    aput v3, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 67
    .line 68
    :catch_5
    :try_start_6
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;->updateGap:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    const/4 v2, 0x4

    .line 75
    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    .line 76
    .line 77
    :catch_6
    sput-object v0, Ll/o81$a;->b:[I

    .line 78
    .line 79
    return-void
.end method
