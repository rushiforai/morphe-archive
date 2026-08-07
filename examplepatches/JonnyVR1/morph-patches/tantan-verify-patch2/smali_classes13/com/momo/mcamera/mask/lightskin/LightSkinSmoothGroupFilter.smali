.class public Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;
.super Lcom/momo/mcamera/mask/BaseSkinComposeFilter;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

.field box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

.field highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

.field normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

.field smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BaseSkinComposeFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/NormalFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/mcamera/mask/lightskin/BoxFilter;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 17
    .line 18
    new-instance v0, Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/momo/mcamera/mask/lightskin/BoxFilter;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 24
    .line 25
    new-instance v0, Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 31
    .line 32
    new-instance v0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 122
    .line 123
    iget-object v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->normalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 151
    .line 152
    .line 153
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
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public getSmoothLevel()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->getSmoothLevel()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    const/16 v1, 0x168

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    div-int/lit8 v1, v1, 0x2

    .line 28
    .line 29
    const/16 v2, 0x1e0

    .line 30
    .line 31
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box1Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 36
    .line 37
    invoke-virtual {v2, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->box3Filter:Lcom/momo/mcamera/mask/lightskin/BoxFilter;

    .line 41
    .line 42
    invoke-virtual {v2, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->highContrastFilter:Lcom/momo/mcamera/mask/lightskin/HighContrastFilter;

    .line 46
    .line 47
    invoke-virtual {v2, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 51
    .line 52
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSmoothLevel(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothGroupFilter;->smoothExtFilter:Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->setSmoothLevel(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
