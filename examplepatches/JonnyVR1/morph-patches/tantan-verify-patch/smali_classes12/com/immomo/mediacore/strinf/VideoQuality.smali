.class public Lcom/immomo/mediacore/strinf/VideoQuality;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;


# instance fields
.field public bitrate:I

.field public framerate:I

.field public orientation:I

.field public resX:I

.field public resY:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    const v2, 0x7a120

    .line 6
    .line 7
    .line 8
    const/16 v3, 0x1e0

    .line 9
    .line 10
    const/16 v4, 0x356

    .line 11
    .line 12
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/immomo/mediacore/strinf/VideoQuality;-><init>(IIII)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/immomo/mediacore/strinf/VideoQuality;->DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 12
    .line 13
    const/16 v0, 0x5a

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x5a

    .line 25
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 26
    iput p3, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 27
    iput p4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 28
    iput p1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 29
    iput p2, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p3, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 20
    iput p4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 21
    iput p1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 22
    iput p2, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    iput p5, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    return-void
.end method

.method public static merge(Lcom/immomo/mediacore/strinf/VideoQuality;Lcom/immomo/mediacore/strinf/VideoQuality;)Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    if-eqz p0, :cond_4

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 20
    .line 21
    :cond_1
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 26
    .line 27
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 28
    .line 29
    :cond_2
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 34
    .line 35
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 36
    .line 37
    :cond_3
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 38
    .line 39
    const/16 v1, 0x5a

    .line 40
    .line 41
    if-ne v0, v1, :cond_4

    .line 42
    .line 43
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 44
    .line 45
    iput p1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 46
    .line 47
    :cond_4
    return-object p0
.end method

.method public static parseQuality(Ljava/lang/String;)Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1, v1, v1}, Lcom/immomo/mediacore/strinf/VideoQuality;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string v2, "-"

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :try_start_0
    aget-object v1, p0, v1

    .line 16
    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    mul-int/lit16 v1, v1, 0x3e8

    .line 22
    .line 23
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    aget-object v1, p0, v1

    .line 27
    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    aget-object v1, p0, v1

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    aget-object p0, p0, v1

    .line 45
    .line 46
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iput p0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    :catch_0
    :cond_0
    return-object v0
.end method


# virtual methods
.method public clone()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 6

    .line 1
    new-instance v0, Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iget v1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 4
    .line 5
    iget v2, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 6
    .line 7
    iget v3, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 8
    .line 9
    iget v4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 10
    .line 11
    iget v5, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/immomo/mediacore/strinf/VideoQuality;-><init>(IIIII)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    move-result-object p0

    return-object p0
.end method

.method public equals(Lcom/immomo/mediacore/strinf/VideoQuality;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 6
    .line 7
    iget v2, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v1, v2, :cond_1

    .line 11
    .line 12
    move v1, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    move v1, v0

    .line 15
    :goto_0
    iget v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 16
    .line 17
    iget v4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 18
    .line 19
    if-ne v2, v4, :cond_2

    .line 20
    .line 21
    move v2, v3

    .line 22
    goto :goto_1

    .line 23
    :cond_2
    move v2, v0

    .line 24
    :goto_1
    and-int/2addr v1, v2

    .line 25
    iget v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 26
    .line 27
    iget v4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 28
    .line 29
    if-ne v2, v4, :cond_3

    .line 30
    .line 31
    move v2, v3

    .line 32
    goto :goto_2

    .line 33
    :cond_3
    move v2, v0

    .line 34
    :goto_2
    and-int/2addr v1, v2

    .line 35
    iget v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 36
    .line 37
    iget v4, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 38
    .line 39
    if-ne v2, v4, :cond_4

    .line 40
    .line 41
    move v2, v3

    .line 42
    goto :goto_3

    .line 43
    :cond_4
    move v2, v0

    .line 44
    :goto_3
    and-int/2addr v1, v2

    .line 45
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 46
    .line 47
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->orientation:I

    .line 48
    .line 49
    if-ne p1, p0, :cond_5

    .line 50
    .line 51
    move v0, v3

    .line 52
    :cond_5
    and-int p0, v1, v0

    .line 53
    .line 54
    return p0
.end method
