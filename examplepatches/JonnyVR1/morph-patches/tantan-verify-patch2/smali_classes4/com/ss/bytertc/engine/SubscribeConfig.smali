.class public Lcom/ss/bytertc/engine/SubscribeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;
    }
.end annotation


# instance fields
.field public framerate:I

.field public isScreen:Z

.field public subAudio:Z

.field public subHeight:I

.field public subVideo:Z

.field public subVideoIndex:I

.field public subWidth:I

.field public svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

.field public videoIndex:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 54
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 55
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    const/4 v1, -0x1

    .line 56
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 57
    sget-object v1, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->DEFAULT:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    iput-object v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 58
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->framerate:I

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/SubscribeConfig;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 11
    .line 12
    sget-object v1, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->DEFAULT:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 15
    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->framerate:I

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 31
    .line 32
    iget v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 33
    .line 34
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 35
    .line 36
    iget-object v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 39
    .line 40
    iget v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 41
    .line 42
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 43
    .line 44
    iget v0, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 45
    .line 46
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 47
    .line 48
    iget p1, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 49
    .line 50
    iput p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public constructor <init>(ZZZI)V
    .locals 3

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 60
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 61
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    const/4 v1, -0x1

    .line 62
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 63
    sget-object v2, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->DEFAULT:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 64
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->framerate:I

    .line 65
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 66
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 67
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 68
    iput p4, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 69
    iput-object v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 70
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 71
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 72
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    return-void
.end method

.method public constructor <init>(ZZZII)V
    .locals 3

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 75
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    const/4 v1, -0x1

    .line 76
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 77
    sget-object v2, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->DEFAULT:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    iput-object v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 78
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->framerate:I

    .line 79
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 80
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 81
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 82
    iput p4, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 83
    invoke-static {p5}, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->convertFromInt(I)Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 84
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 85
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 86
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    return-void
.end method

.method public constructor <init>(ZZZIIIII)V
    .locals 2

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 88
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 89
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    const/4 v1, -0x1

    .line 90
    iput v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 91
    sget-object v1, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->DEFAULT:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    iput-object v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 92
    iput v0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->framerate:I

    .line 93
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 94
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 95
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 96
    iput p4, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 97
    invoke-static {p5}, Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;->convertFromInt(I)Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 98
    iput p6, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 99
    iput p7, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 100
    iput p8, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    return-void
.end method

.method private static create(ZZZIIIII)Lcom/ss/bytertc/engine/SubscribeConfig;
    .locals 9
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/SubscribeConfig;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    move/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Lcom/ss/bytertc/engine/SubscribeConfig;-><init>(ZZZIIIII)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/ss/bytertc/engine/SubscribeConfig;

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 22
    .line 23
    iget-boolean v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 24
    .line 25
    if-ne v2, v3, :cond_2

    .line 26
    .line 27
    iget-boolean v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 28
    .line 29
    iget-boolean v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 30
    .line 31
    if-ne v2, v3, :cond_2

    .line 32
    .line 33
    iget-boolean v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 36
    .line 37
    if-ne v2, v3, :cond_2

    .line 38
    .line 39
    iget v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 40
    .line 41
    iget v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 42
    .line 43
    if-ne v2, v3, :cond_2

    .line 44
    .line 45
    iget-object v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 48
    .line 49
    if-ne v2, v3, :cond_2

    .line 50
    .line 51
    iget v2, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 52
    .line 53
    iget v3, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 54
    .line 55
    if-ne v2, v3, :cond_2

    .line 56
    .line 57
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 58
    .line 59
    iget p1, p1, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 60
    .line 61
    if-ne p0, p1, :cond_2

    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    :goto_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SubscribeConfig{isScreen="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->isScreen:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", subVideo="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideo:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", subAudio="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subAudio:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", videoIndex="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->videoIndex:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", svcLayer="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->svcLayer:Lcom/ss/bytertc/engine/SubscribeConfig$SVCLayer;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", sub_width="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subWidth:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", sub_height="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subHeight:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", sub_video_index="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeConfig;->subVideoIndex:I

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p0, "}"

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
