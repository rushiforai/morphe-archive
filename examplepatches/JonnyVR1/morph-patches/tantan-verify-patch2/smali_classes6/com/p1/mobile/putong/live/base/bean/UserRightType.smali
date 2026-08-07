.class public abstract enum Lcom/p1/mobile/putong/live/base/bean/UserRightType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum CHAT_UNDER_SHADE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum LIVE_NICE_NUMBER:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final PAGE_LIMIT:I = 0x14

.field public static final enum PROFILE_CARD_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum VOICE_AVATAR_MEDAL:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public static final enum VOICE_AVATAR_RIGHT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/base/bean/UserRightType;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CHAT_UNDER_SHADE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->PROFILE_CARD_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->VOICE_AVATAR_RIGHT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->VOICE_AVATAR_MEDAL:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->LIVE_NICE_NUMBER:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$1;

    .line 2
    .line 3
    const-string v1, "USER_MEDAL_MANAGE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$1;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$2;

    .line 13
    .line 14
    const-string v1, "ENTER_ROOM_EFFECT"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$2;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$3;

    .line 23
    .line 24
    const-string v1, "CHAT_UNDER_SHADE"

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$3;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CHAT_UNDER_SHADE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$4;

    .line 33
    .line 34
    const-string v1, "AVATAR_MANAGE"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$4;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$5;

    .line 43
    .line 44
    const-string v1, "PROFILE_CARD_MANAGE"

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$5;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->PROFILE_CARD_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 51
    .line 52
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$6;

    .line 53
    .line 54
    const-string v1, "VOICE_AVATAR_RIGHT"

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$6;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->VOICE_AVATAR_RIGHT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$7;

    .line 63
    .line 64
    const-string v1, "VOICE_AVATAR_MEDAL"

    .line 65
    .line 66
    const/4 v2, 0x6

    .line 67
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$7;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->VOICE_AVATAR_MEDAL:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 71
    .line 72
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$8;

    .line 73
    .line 74
    const-string v1, "LIVE_NICE_NUMBER"

    .line 75
    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$8;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->LIVE_NICE_NUMBER:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 81
    .line 82
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType$9;

    .line 83
    .line 84
    const-string v1, "CALL_EFFECT"

    .line 85
    .line 86
    const/16 v2, 0x8

    .line 87
    .line 88
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$9;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->$values()[Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sput-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->$VALUES:[Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 98
    .line 99
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/zhk0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/UserRightType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/base/bean/UserRightType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->$VALUES:[Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/base/bean/UserRightType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getBindRightsToAnchorUrlStr()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "/userRights"

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getEquipNotice(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract getLeftIcon()I
.end method

.method public abstract getManageTitle(Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract getRightBindAnchorsUrlStr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public getRightEquipUrlStr(Ll/z8d0;Ljava/lang/String;)Ll/rnl;
    .locals 1

    .line 1
    const-string p0, "/userRights/"

    .line 2
    .line 3
    invoke-static {p0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Ll/z8d0;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 16
    .line 17
    .line 18
    const-string v0, "actions"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/z8d0;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    const-string p2, "roomId"

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/z8d0;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, p2, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Ll/z8d0;->a()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_1

    .line 54
    .line 55
    const-string p2, "liveId"

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/z8d0;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p2, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public abstract getRightListUrlStr(Ll/yhk0;)Ljava/lang/String;
.end method

.method public abstract getUnEquipUrl()Ljava/lang/String;
.end method

.method public getVoiceAvatarRightsUrl()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public isVideoRoomRight()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
