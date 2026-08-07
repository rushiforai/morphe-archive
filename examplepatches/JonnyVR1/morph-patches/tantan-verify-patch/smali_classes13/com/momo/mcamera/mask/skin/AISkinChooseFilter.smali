.class public Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

.field private mCurrentLevel:Ljava/lang/Float;

.field private mNormalFilter:Ll/qv40;


# direct methods
.method public constructor <init>(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCurrentLevel:Ljava/lang/Float;

    .line 8
    .line 9
    new-instance v0, Ll/qv40;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/qv40;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    cmpl-float v0, v0, v1

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    new-instance v0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 42
    .line 43
    invoke-direct {v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->setSmoothLevel(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/ogk;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    :cond_1
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method

.method public getSkinLevel()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCurrentLevel:Ljava/lang/Float;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/gfj;->releaseFrameBuffer()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->setMMCVInfo(Ll/omw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSkinLevel(Ljava/lang/Float;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCurrentLevel:Ljava/lang/Float;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    cmpl-float v0, v0, v1

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->setSmoothLevel(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    cmpl-float v0, v0, v1

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/ogk;->destroy()V

    .line 66
    .line 67
    .line 68
    :cond_1
    new-instance v0, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mNormalFilter:Ll/qv40;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCXFaceSkinComposeFilter:Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;

    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/skin/AIFaceSkinComposeFilter;->setSmoothLevel(F)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinChooseFilter;->mCurrentLevel:Ljava/lang/Float;

    .line 112
    .line 113
    return-void
.end method
