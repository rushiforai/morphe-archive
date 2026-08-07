.class public Lcom/momo/mcamera/mask/SkinChooseFilter;
.super Lcom/momo/mcamera/mask/BaseSkinComposeFilter;
.source "SourceFile"


# static fields
.field public static SKIN_TYPE_SMOOTH_8_0:I = 0x1

.field public static SKIN_TYPE_SMOOTH_DEFAULT:I


# instance fields
.field private currentLevel:F

.field private faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

.field private normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

.field private skinSmoothingFilter:Ll/prf0;

.field private skinTypeSaved:I

.field private useOldFilter:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(ZFI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BaseSkinComposeFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->useOldFilter:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinTypeSaved:I

    .line 9
    .line 10
    const/4 p3, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-instance p1, Lcom/momo/mcamera/mask/NormalFilter;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 19
    .line 20
    cmpl-float p3, p2, p3

    .line 21
    .line 22
    if-nez p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    new-instance p1, Ll/prf0;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/prf0;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ll/prf0;->setSmoothLevel(F)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 49
    .line 50
    iget-object p2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    new-instance p1, Lcom/momo/mcamera/mask/NormalFilter;

    .line 72
    .line 73
    invoke-direct {p1}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 77
    .line 78
    cmpl-float p3, p2, p3

    .line 79
    .line 80
    if-nez p3, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    iget p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinTypeSaved:I

    .line 97
    .line 98
    sget p3, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_DEFAULT:I

    .line 99
    .line 100
    if-ne p1, p3, :cond_3

    .line 101
    .line 102
    new-instance p1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 103
    .line 104
    invoke-direct {p1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    sget p3, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_8_0:I

    .line 111
    .line 112
    if-ne p1, p3, :cond_4

    .line 113
    .line 114
    new-instance p1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 115
    .line 116
    sget-object p3, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->transitionalGuidedFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 117
    .line 118
    invoke-direct {p1, p3}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;-><init>(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;)V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    const-string p1, "Beauty TAG"

    .line 125
    .line 126
    const-string p3, "Wrong type parameters."

    .line 127
    .line 128
    invoke-static {p1, p3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 132
    .line 133
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->setSkinSmoothScale(F)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 137
    .line 138
    iget-object p2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 154
    .line 155
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 156
    .line 157
    .line 158
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
    iget-object v0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ogk;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :cond_2
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v0
.end method

.method public getSkinLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 2
    .line 3
    return p0
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/gfj;->releaseFrameBuffer()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/gfj;->releaseFrameBuffer()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSmoothLevel(F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->useOldFilter:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_4

    .line 10
    .line 11
    cmpl-float v1, p1, v2

    .line 12
    .line 13
    iget v3, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    cmpl-float v1, v3, v2

    .line 18
    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    :try_start_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/prf0;->setSmoothLevel(F)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 56
    .line 57
    .line 58
    iput p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto/16 :goto_4

    .line 63
    .line 64
    :cond_0
    cmpl-float v1, v3, v2

    .line 65
    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 69
    .line 70
    if-nez v1, :cond_1

    .line 71
    .line 72
    new-instance v1, Ll/prf0;

    .line 73
    .line 74
    invoke-direct {v1}, Ll/prf0;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 78
    .line 79
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 80
    .line 81
    invoke-virtual {v1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 102
    .line 103
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinSmoothingFilter:Ll/prf0;

    .line 107
    .line 108
    invoke-virtual {v1, p1}, Ll/prf0;->setSmoothLevel(F)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_0
    iput p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    .line 113
    goto/16 :goto_3

    .line 114
    .line 115
    :cond_4
    cmpl-float v1, p1, v2

    .line 116
    .line 117
    iget v3, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 118
    .line 119
    if-nez v1, :cond_5

    .line 120
    .line 121
    cmpl-float v1, v3, v2

    .line 122
    .line 123
    if-eqz v1, :cond_a

    .line 124
    .line 125
    :try_start_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->setSkinSmoothScale(F)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 131
    .line 132
    invoke-virtual {v1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 133
    .line 134
    .line 135
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 136
    .line 137
    iget-object v2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 148
    .line 149
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 153
    .line 154
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 158
    .line 159
    invoke-virtual {p0, v1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 160
    .line 161
    .line 162
    iput p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_5
    cmpl-float v1, v3, v2

    .line 166
    .line 167
    if-nez v1, :cond_9

    .line 168
    .line 169
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 170
    .line 171
    if-nez v1, :cond_8

    .line 172
    .line 173
    iget v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->skinTypeSaved:I

    .line 174
    .line 175
    sget v2, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_DEFAULT:I

    .line 176
    .line 177
    if-ne v1, v2, :cond_6

    .line 178
    .line 179
    new-instance v1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 180
    .line 181
    invoke-direct {v1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;-><init>()V

    .line 182
    .line 183
    .line 184
    iput-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_6
    sget v2, Lcom/momo/mcamera/mask/SkinChooseFilter;->SKIN_TYPE_SMOOTH_8_0:I

    .line 188
    .line 189
    if-ne v1, v2, :cond_7

    .line 190
    .line 191
    new-instance v1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 192
    .line 193
    sget-object v2, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->transitionalGuidedFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 194
    .line 195
    invoke-direct {v1, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;-><init>(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;)V

    .line 196
    .line 197
    .line 198
    iput-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_7
    const-string v1, "Beauty TAG"

    .line 202
    .line 203
    const-string v2, "Wrong type parameters."

    .line 204
    .line 205
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_8
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 209
    .line 210
    invoke-virtual {v1, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 211
    .line 212
    .line 213
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 214
    .line 215
    iget-object v2, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 216
    .line 217
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 221
    .line 222
    invoke-virtual {p0, v1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 226
    .line 227
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 228
    .line 229
    .line 230
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 231
    .line 232
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 233
    .line 234
    .line 235
    :cond_9
    iget-object v1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->faceSkinSmoothFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;

    .line 236
    .line 237
    invoke-virtual {v1, p1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->setSkinSmoothScale(F)V

    .line 238
    .line 239
    .line 240
    :cond_a
    :goto_2
    iput p1, p0, Lcom/momo/mcamera/mask/SkinChooseFilter;->currentLevel:F

    .line 241
    .line 242
    :goto_3
    monitor-exit v0

    .line 243
    return-void

    .line 244
    :goto_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 245
    throw p0
.end method
