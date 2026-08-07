.class public Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREVIEW_TYPE_CENTER:I = 0x1

.field public static final PREVIEW_TYPE_SCALE_80:I = 0x2


# instance fields
.field private absoluteFilePath:Ljava/lang/String;

.field private canUseLocalVideo:Z

.field private isPrivate:Z

.field private isUploadAllowed:Z

.field private isVideo:Z

.field private needDownloadFile:Z

.field private previewType:I

.field private previewUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    const/4 v0, 0x0

    .line 86
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewUrl:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    move v1, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v0

    .line 26
    :goto_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isUploadAllowed:Z

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    move v1, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v1, v0

    .line 37
    :goto_1
    iput-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isVideo:Z

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    move v1, v2

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v0

    .line 48
    :goto_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isPrivate:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    move v1, v2

    .line 57
    goto :goto_3

    .line 58
    :cond_3
    move v1, v0

    .line 59
    :goto_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->canUseLocalVideo:Z

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->absoluteFilePath:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    move v0, v2

    .line 80
    :cond_4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    .line 81
    .line 82
    return-void
.end method

.method public synthetic constructor <init>(Ll/avh0;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->canUseLocalVideo:Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isPrivate:Z

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isVideo:Z

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    return-void
.end method

.method public static e()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;-><init>(Ll/avh0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->absoluteFilePath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->canUseLocalVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isPrivate:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isUploadAllowed:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isVideo:Z

    .line 2
    .line 3
    return p0
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->absoluteFilePath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->canUseLocalVideo:Z

    .line 2
    .line 3
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    .line 2
    .line 3
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isUploadAllowed:Z

    .line 2
    .line 3
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isUploadAllowed:Z

    .line 7
    .line 8
    int-to-byte p2, p2

    .line 9
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 10
    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isVideo:Z

    .line 13
    .line 14
    int-to-byte p2, p2

    .line 15
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 16
    .line 17
    .line 18
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->isPrivate:Z

    .line 19
    .line 20
    int-to-byte p2, p2

    .line 21
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 22
    .line 23
    .line 24
    iget-boolean p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->canUseLocalVideo:Z

    .line 25
    .line 26
    int-to-byte p2, p2

    .line 27
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->absoluteFilePath:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->previewType:I

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 38
    .line 39
    .line 40
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->needDownloadFile:Z

    .line 41
    .line 42
    int-to-byte p0, p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
