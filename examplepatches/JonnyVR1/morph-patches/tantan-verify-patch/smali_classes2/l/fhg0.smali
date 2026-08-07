.class public final Ll/fhg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudListenerGetMGInfo;


# instance fields
.field public final synthetic a:Ll/gmg0;


# direct methods
.method public constructor <init>(Ll/gmg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(ZLjava/lang/String;Z)V
    .locals 3

    .line 1
    sget-object v0, Ll/gmg0;->g:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "isGameInstalled isInstalled="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    sget-boolean p3, Ll/nkg0;->a:Z

    .line 23
    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    sget p3, Ll/utg0;->f:I

    .line 27
    .line 28
    const/4 v0, 0x4

    .line 29
    if-ne p3, v0, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 32
    .line 33
    iget-object p1, p1, Ll/gmg0;->d:Ltech/sud/gip/core/GameInfo;

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    iput-boolean p2, p1, Ltech/sud/gip/core/GameInfo;->isInstalled:Z

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p3, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 40
    .line 41
    iget-object p3, p3, Ll/gmg0;->d:Ltech/sud/gip/core/GameInfo;

    .line 42
    .line 43
    iput-object p2, p3, Ltech/sud/gip/core/GameInfo;->gamePath:Ljava/lang/String;

    .line 44
    .line 45
    iput-boolean p1, p3, Ltech/sud/gip/core/GameInfo;->isInstalled:Z

    .line 46
    .line 47
    :goto_0
    iget-object p0, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 48
    .line 49
    iget-object p0, p0, Ll/gmg0;->a:Ll/mrg0;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-virtual {p0, p1}, Ll/mrg0;->a(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final onFailure(ILjava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getMGInfo failure retCode="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v2, " retMsg="

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v3, "SudGameLoadingStageGetMGInfo"

    .line 24
    .line 25
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ll/gmg0;->g:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 52
    .line 53
    iget-boolean v0, p0, Ll/gmg0;->e:Z

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Ll/gmg0;->a:Ll/mrg0;

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    invoke-virtual {p0, v0, p1, p2}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public final onSuccess(Ltech/sud/gip/core/GameInfo;)V
    .locals 8

    .line 1
    sget-object v0, Ll/gmg0;->g:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "getMGInfo success "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 25
    .line 26
    iput-object p1, v0, Ll/gmg0;->d:Ltech/sud/gip/core/GameInfo;

    .line 27
    .line 28
    iget-boolean v1, v0, Ll/gmg0;->e:Z

    .line 29
    .line 30
    if-nez v1, :cond_3

    .line 31
    .line 32
    iget v3, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object v0, v0, Ll/gmg0;->c:Ll/cmg0;

    .line 38
    .line 39
    iget-wide v4, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 40
    .line 41
    iget-object v6, p1, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 42
    .line 43
    new-instance v7, Ll/wgg0;

    .line 44
    .line 45
    invoke-direct {v7, p0}, Ll/wgg0;-><init>(Ll/fhg0;)V

    .line 46
    .line 47
    .line 48
    if-ne v1, v3, :cond_0

    .line 49
    .line 50
    iget-object v2, v0, Ll/cmg0;->a:Ll/nsg0;

    .line 51
    .line 52
    invoke-virtual/range {v2 .. v7}, Ll/vog0;->d(IJLjava/lang/String;Ll/uog0;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const/4 p0, 0x5

    .line 57
    if-ne p0, v3, :cond_1

    .line 58
    .line 59
    iget-object v2, v0, Ll/cmg0;->b:Ll/osg0;

    .line 60
    .line 61
    invoke-virtual/range {v2 .. v7}, Ll/vog0;->d(IJLjava/lang/String;Ll/uog0;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object v0, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 74
    .line 75
    iget-object v0, v0, Ll/gmg0;->d:Ltech/sud/gip/core/GameInfo;

    .line 76
    .line 77
    iget v0, v0, Ltech/sud/gip/core/GameInfo;->unityFrameworkType:I

    .line 78
    .line 79
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "This sdk not support engine=%d unityFrameworkType=%d of game runtime."

    .line 88
    .line 89
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Ll/fhg0;->a:Ll/gmg0;

    .line 94
    .line 95
    iget-object p0, p0, Ll/gmg0;->a:Ll/mrg0;

    .line 96
    .line 97
    const/16 v0, -0x2774

    .line 98
    .line 99
    invoke-virtual {p0, v1, v0, p1}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    return-void
.end method
