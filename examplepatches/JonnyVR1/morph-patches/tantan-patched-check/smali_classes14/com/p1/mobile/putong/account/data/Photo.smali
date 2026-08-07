.class public Lcom/p1/mobile/putong/account/data/Photo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/account/data/Photo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public bucketId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public bucketName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public dateAdded:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public duration:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public editExtra:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public faceDetect:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public height:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public id:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isCheck:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isLong:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isOriginal:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isTakePhoto:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public longThumbPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public mimeType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public path:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public positionInAll:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public positionInSelect:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public rotate:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public shootExra:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public size:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public tempPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public thumbPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public type:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public width:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/Photo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/data/Photo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/account/data/Photo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 179
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 180
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 2

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 173
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 174
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 175
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    int-to-long v0, p1

    .line 176
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 177
    iput-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->size:J

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->dateAdded:J

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->mimeType:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketName:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->type:I

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/4 v1, 0x0

    .line 66
    const/4 v2, 0x1

    .line 67
    if-ne v0, v2, :cond_0

    .line 68
    .line 69
    move v0, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move v0, v1

    .line 72
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 75
    .line 76
    .line 77
    move-result-wide v3

    .line 78
    iput-wide v3, p0, Lcom/p1/mobile/putong/account/data/Photo;->duration:J

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->width:I

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->height:I

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->rotate:I

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-ne v0, v2, :cond_1

    .line 103
    .line 104
    move v0, v2

    .line 105
    goto :goto_1

    .line 106
    :cond_1
    move v0, v1

    .line 107
    :goto_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-ne v0, v2, :cond_2

    .line 114
    .line 115
    move v0, v2

    .line 116
    goto :goto_2

    .line 117
    :cond_2
    move v0, v1

    .line 118
    :goto_2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isLong:Z

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-ne v0, v2, :cond_3

    .line 125
    .line 126
    move v1, v2

    .line 127
    :cond_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->isTakePhoto:Z

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->longThumbPath:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->longThumbPath:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInAll:I

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    .line 170
    .line 171
    return-void
.end method

.method public static isGif(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "image/gif"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static isImage(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "image/jpg"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "image/jpeg"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "image/png"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "image/gif"

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const-string v0, "image/webp"

    .line 34
    .line 35
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "image/heif"

    .line 42
    .line 43
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    const-string v0, "image/heic"

    .line 50
    .line 51
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 61
    return p0
.end method

.method public static isMp4(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "video/mp4"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static isVideo(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "video/mp4"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public changeChecked(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/account/data/Photo;->rotate:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/account/data/Photo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/account/data/Photo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public getId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTempPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPhoto(Lcom/p1/mobile/putong/account/data/Photo;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->size:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->size:J

    .line 13
    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->dateAdded:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->dateAdded:J

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->mimeType:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->mimeType:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->bucketId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->bucketName:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketName:Ljava/lang/String;

    .line 33
    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->type:I

    .line 35
    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->type:I

    .line 37
    .line 38
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 41
    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->duration:J

    .line 43
    .line 44
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->duration:J

    .line 45
    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->width:I

    .line 47
    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->width:I

    .line 49
    .line 50
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->height:I

    .line 51
    .line 52
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->height:I

    .line 53
    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->rotate:I

    .line 55
    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->rotate:I

    .line 57
    .line 58
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 59
    .line 60
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 61
    .line 62
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->isTakePhoto:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->isTakePhoto:Z

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->longThumbPath:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->longThumbPath:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->thumbPath:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->thumbPath:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 77
    .line 78
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->positionInAll:I

    .line 79
    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInAll:I

    .line 81
    .line 82
    iget v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 83
    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    .line 93
    .line 94
    :cond_1
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Photo[ id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "  path:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "  isOriginal:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "  size:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->size:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "   tempPath:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "   isCheck:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "   mimeType:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/Photo;->mimeType:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p0, "] isLong longThumbPath"

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->id:J

    .line 2
    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->size:J

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 9
    .line 10
    .line 11
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->dateAdded:J

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->path:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->mimeType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->bucketName:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->type:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 39
    .line 40
    .line 41
    iget-boolean p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->isCheck:Z

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 44
    .line 45
    .line 46
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/Photo;->duration:J

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->width:I

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->height:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    .line 60
    .line 61
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->rotate:I

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    .line 65
    .line 66
    iget-boolean p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->isOriginal:Z

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    .line 70
    .line 71
    iget-boolean p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->isLong:Z

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    .line 75
    .line 76
    iget-boolean p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->isTakePhoto:Z

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->longThumbPath:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->thumbPath:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->tempPath:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInAll:I

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 99
    .line 100
    .line 101
    iget p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->positionInSelect:I

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/account/data/Photo;->shootExra:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/Photo;->editExtra:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
