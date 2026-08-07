.class public Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public interval:I

.field public report_vad:I

.field public smooth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xc8

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->report_vad:I

    .line 13
    .line 14
    return-void
.end method
