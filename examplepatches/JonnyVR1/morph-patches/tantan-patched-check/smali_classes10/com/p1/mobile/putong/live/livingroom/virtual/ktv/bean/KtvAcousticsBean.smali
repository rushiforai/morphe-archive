.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static KTV:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

.field public static PHONOGRAPH:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

.field public static ROOM_ACOUSTICS_KTV:I

.field public static ROOM_ACOUSTICS_PHONOGRAPH:I

.field public static ROOM_ACOUSTICS_STUDIO:I

.field public static ROOM_ACOUSTICS_VIRTUAL_STEREO:I

.field public static ROOM_ACOUSTICS_VOCAL_CONCERT:I

.field public static STUDIO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

.field public static VIRTUAL_STEREO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

.field public static VOCAL_CONCERT:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;


# instance fields
.field public isSelected:Z

.field public name:Ljava/lang/String;

.field public pic:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public preset:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousticsKTV:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_KTV:I

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousVocalConcer:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_VOCAL_CONCERT:I

    .line 16
    .line 17
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousStudio:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_STUDIO:I

    .line 24
    .line 25
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousPhonograph:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_PHONOGRAPH:I

    .line 32
    .line 33
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousVirtualStereo:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    sput v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_VIRTUAL_STEREO:I

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 42
    .line 43
    sget v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_KTV:I

    .line 44
    .line 45
    const-string v2, "KTV"

    .line 46
    .line 47
    sget v3, Ll/obc0;->b:I

    .line 48
    .line 49
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;-><init>(ILjava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->KTV:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 55
    .line 56
    sget v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_VOCAL_CONCERT:I

    .line 57
    .line 58
    const-string v2, "\u6f14\u5531\u4f1a"

    .line 59
    .line 60
    sget v3, Ll/obc0;->f:I

    .line 61
    .line 62
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;-><init>(ILjava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->VOCAL_CONCERT:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 66
    .line 67
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 68
    .line 69
    sget v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_STUDIO:I

    .line 70
    .line 71
    const-string v2, "\u5f55\u97f3\u68da"

    .line 72
    .line 73
    sget v3, Ll/obc0;->d:I

    .line 74
    .line 75
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;-><init>(ILjava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->STUDIO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 79
    .line 80
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 81
    .line 82
    sget v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_PHONOGRAPH:I

    .line 83
    .line 84
    const-string v2, "\u7559\u58f0\u673a"

    .line 85
    .line 86
    sget v3, Ll/obc0;->c:I

    .line 87
    .line 88
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;-><init>(ILjava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->PHONOGRAPH:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 92
    .line 93
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 94
    .line 95
    sget v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->ROOM_ACOUSTICS_VIRTUAL_STEREO:I

    .line 96
    .line 97
    const-string v2, "\u865a\u62df\u7acb\u4f53\u58f0"

    .line 98
    .line 99
    sget v3, Ll/obc0;->e:I

    .line 100
    .line 101
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;-><init>(ILjava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->VIRTUAL_STEREO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 105
    .line 106
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p3    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->preset:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->pic:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->isSelected:Z

    .line 12
    .line 13
    return-void
.end method

.method public static getKtvAcoustics()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->KTV:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->VOCAL_CONCERT:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->PHONOGRAPH:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->STUDIO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;->VIRTUAL_STEREO:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method
