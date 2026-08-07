.class public Lcom/p1/mobile/putong/camera/TTCameraConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/camera/TTCameraConfig$b;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/camera/TTCameraConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_AGREEMENT:Ljava/lang/String; = "agreement"

.field public static final TYPE_ID_CARD_AVATAR:Ljava/lang/String; = "avatar"

.field public static final TYPE_ID_CARD_EMBLEM:Ljava/lang/String; = "emblem"

.field public static final TYPE_ID_CARD_HAND:Ljava/lang/String; = "hand_idCard"


# instance fields
.field private autoPreview:Z

.field private description:Ljava/lang/String;

.field private isPrivate:Z

.field private isVideo:Z

.field private maxFps:I

.field private maxTakingPictureCount:I

.field private recordTime:J

.field private subDescription:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private usingBackCamera:Z

.field private usingCamera2:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/TTCameraConfig$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 113
    iput-wide v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    const/4 v0, 0x1

    .line 114
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 115
    iput v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    const/4 v0, 0x0

    .line 116
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    const/16 v0, 0x18

    .line 117
    iput v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-boolean v1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    .line 15
    .line 16
    const/16 v2, 0x18

    .line 17
    .line 18
    iput v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    move v2, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v2, v1

    .line 29
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingBackCamera:Z

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->description:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->subDescription:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    move v2, v0

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move v2, v1

    .line 58
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isVideo:Z

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    iput-wide v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    move v2, v0

    .line 73
    goto :goto_2

    .line 74
    :cond_2
    move v2, v1

    .line 75
    :goto_2
    iput-boolean v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    move v2, v0

    .line 90
    goto :goto_3

    .line 91
    :cond_3
    move v2, v1

    .line 92
    :goto_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    iput v2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_4
    move v0, v1

    .line 108
    :goto_4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isPrivate:Z

    .line 109
    .line 110
    return-void
.end method

.method public synthetic constructor <init>(Ll/nth0;)V
    .locals 0

    .line 111
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/camera/TTCameraConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isPrivate:Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/camera/TTCameraConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isVideo:Z

    return-void
.end method

.method public static n(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "avatar"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "hand_idCard"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "emblem"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "agreement"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static p()Lcom/p1/mobile/putong/camera/TTCameraConfig$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/TTCameraConfig$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig$b;-><init>(Ll/nth0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingBackCamera:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    .line 2
    .line 3
    return p0
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isPrivate:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingBackCamera:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public s(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    .line 2
    .line 3
    return-void
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    .line 2
    .line 3
    return-void
.end method

.method public u(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    .line 2
    .line 3
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->subDescription:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingBackCamera:Z

    .line 2
    .line 3
    int-to-byte p2, p2

    .line 4
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->type:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->description:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->subDescription:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isVideo:Z

    .line 23
    .line 24
    int-to-byte p2, p2

    .line 25
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 26
    .line 27
    .line 28
    iget-wide v0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->recordTime:J

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 31
    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 34
    .line 35
    int-to-byte p2, p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 37
    .line 38
    .line 39
    iget p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxTakingPictureCount:I

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 42
    .line 43
    .line 44
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->autoPreview:Z

    .line 45
    .line 46
    int-to-byte p2, p2

    .line 47
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 48
    .line 49
    .line 50
    iget p2, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->maxFps:I

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 53
    .line 54
    .line 55
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->isPrivate:Z

    .line 56
    .line 57
    int-to-byte p0, p0

    .line 58
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public x(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingBackCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/TTCameraConfig;->usingCamera2:Z

    .line 2
    .line 3
    return-void
.end method
