.class public Lcom/momo/sabine/sabineSdk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile mIsLibLoaded:Z


# instance fields
.field private mIsOpened:Z

.field public mNativeContextData:J

.field private object:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/sabine/sabineSdk;->object:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/momo/sabine/sabineSdk;->mNativeContextData:J

    .line 17
    .line 18
    invoke-static {}, Lcom/momo/sabine/sabineSdk;->loadLibrariesOnce()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private native closeSabineEf()V
.end method

.method private static loadLibrariesOnce()V
    .locals 4

    .line 1
    const-class v0, Lcom/momo/sabine/sabineSdk;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :try_start_1
    const-string v2, "sabine"

    .line 10
    .line 11
    const-string v3, "-----load sabineSdk"

    .line 12
    .line 13
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    const-string v2, "sabineSdk"

    .line 17
    .line 18
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "sabine"

    .line 22
    .line 23
    const-string v3, "-----load sabineSdk finish"

    .line 24
    .line 25
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    sput-boolean v2, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    :try_start_2
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v1

    .line 34
    goto :goto_1

    .line 35
    :catch_0
    sput-boolean v1, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_1
    sput-boolean v1, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 39
    .line 40
    :goto_0
    const-string v1, "sabine"

    .line 41
    .line 42
    const-string v2, "-----load sabineSdk failed"

    .line 43
    .line 44
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :cond_0
    const-string v1, "sabine"

    .line 50
    .line 51
    const-string v2, "-----load sabineSdk repeat"

    .line 52
    .line 53
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 59
    throw v1
.end method

.method private native opensabineef(III)V
.end method

.method private native sabineef(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
.end method

.method private native sabineeffect_ans(F)V
.end method

.method private native sabineeffect_peq_Shelving(IFF)V
.end method

.method private native sabineeffect_peq_fliter(IFI)V
.end method

.method private native sabineeffect_peq_peak(IFFF)V
.end method

.method private native sabineeffect_reverb(IF)V
.end method

.method private native sabineeffectreset()V
.end method

.method private native sabineeffectreset_new()V
.end method

.method private native sabineeffectset(IIF)V
.end method


# virtual methods
.method public SabineEffectReset_ex()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/momo/sabine/sabineSdk;->sabineeffectreset_new()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public SabineEffectSet_ans(F)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/momo/sabine/sabineSdk;->sabineeffect_ans(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_Shelving(IFF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineeffect_peq_Shelving(IFF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_fliter(IFI)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineeffect_peq_fliter(IFI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_peak(IFFF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/sabine/sabineSdk;->sabineeffect_peq_peak(IFFF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public SabineEffectSet_reverb(IF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/sabine/sabineSdk;->sabineeffect_reverb(IF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public getSabineLoadedStaus()Z
    .locals 1

    .line 1
    const-string p0, "sabine"

    .line 2
    .line 3
    const-string v0, "-----getSabineLoadedStaus"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-boolean p0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 9
    .line 10
    return p0
.end method

.method public sabineClose()V
    .locals 5

    .line 1
    const-string v0, "-----sabineClose:end"

    .line 2
    .line 3
    const-string v1, "-----sabineClose:"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/sabine/sabineSdk;->object:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    const-string v3, "sabine"

    .line 9
    .line 10
    new-instance v4, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-boolean v1, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 16
    .line 17
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ";"

    .line 21
    .line 22
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 26
    .line 27
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    sget-boolean v1, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 42
    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/momo/sabine/sabineSdk;->closeSabineEf()V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-boolean v1, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    const-string v1, "sabine"

    .line 55
    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v0, ";"

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-boolean p0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 72
    .line 73
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    monitor-exit v2

    .line 84
    return-void

    .line 85
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method

.method public sabineEff(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineef(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public sabineOpen(III)V
    .locals 4

    .line 1
    const-string v0, "-----sabineOpen:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/sabine/sabineSdk;->object:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "sabine"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 14
    .line 15
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ";"

    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 37
    .line 38
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->opensabineef(III)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    monitor-exit v1

    .line 52
    return-void

    .line 53
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0
.end method

.method public sabineReset()V
    .locals 4

    .line 1
    const-string v0, "-----sabineReset:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/sabine/sabineSdk;->object:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "sabine"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 14
    .line 15
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ";"

    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/momo/sabine/sabineSdk;->sabineeffectreset()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit v1

    .line 50
    return-void

    .line 51
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public sabineSet(IIF)V
    .locals 4

    .line 1
    const-string v0, "-----sabineSet:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/sabine/sabineSdk;->object:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "sabine"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 14
    .line 15
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ";"

    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 24
    .line 25
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-boolean v0, Lcom/momo/sabine/sabineSdk;->mIsLibLoaded:Z

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/momo/sabine/sabineSdk;->mIsOpened:Z

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineeffectset(IIF)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    monitor-exit v1

    .line 50
    return-void

    .line 51
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method
