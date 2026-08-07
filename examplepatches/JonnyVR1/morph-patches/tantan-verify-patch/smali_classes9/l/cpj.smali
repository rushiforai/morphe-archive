.class public Ll/cpj;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Ll/ooj;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ooj;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->w(Ljava/util/List;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static B(Ll/hzj;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hzj;",
            ")",
            "Ljava/util/List<",
            "Ll/dtj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    iget-object v1, p0, Ll/hzj;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    iget-object v1, p0, Ll/hzj;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v1}, Ll/cpj;->I(Ljava/util/List;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    mul-float/2addr v2, v3

    .line 31
    const/high16 v3, 0x41000000    # 8.0f

    .line 32
    .line 33
    div-float/2addr v2, v3

    .line 34
    float-to-double v2, v2

    .line 35
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    double-to-int v2, v2

    .line 40
    const/4 v3, 0x0

    .line 41
    :goto_0
    if-ge v3, v2, :cond_2

    .line 42
    .line 43
    mul-int/lit8 v4, v3, 0x8

    .line 44
    .line 45
    add-int/lit8 v5, v4, 0x8

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    new-instance v6, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-interface {v1, v4, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v6, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Ll/jjs;

    .line 79
    .line 80
    invoke-virtual {v5, v3}, Ll/jjs;->z(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    new-instance v4, Ll/dtj;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/hzj;->c()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-direct {v4, v6, v5}, Ll/dtj;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    :goto_2
    return-object v0
.end method

.method public static C(Ll/coj;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/coj;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->jj:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 10
    .line 11
    iget-object p0, p0, Ll/h64;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/cpj;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/coj;->f()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v1, " "

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->lj:I

    .line 31
    .line 32
    iget-object v2, p0, Ll/coj;->f:Ll/p54;

    .line 33
    .line 34
    iget v2, v2, Ll/p54;->d:I

    .line 35
    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 46
    .line 47
    iget-object p0, p0, Ll/h64;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v0, p0}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    invoke-virtual {p0}, Ll/coj;->e()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kj:I

    .line 72
    .line 73
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 74
    .line 75
    iget-object p0, p0, Ll/h64;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    iget-boolean v0, p0, Ll/coj;->c:Z

    .line 83
    .line 84
    iget-object v2, p0, Ll/coj;->f:Ll/p54;

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    iget v0, v2, Ll/p54;->d:I

    .line 89
    .line 90
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    iget v0, v2, Ll/p54;->d:I

    .line 94
    .line 95
    :goto_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->lj:I

    .line 96
    .line 97
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 107
    .line 108
    iget-object p0, p0, Ll/h64;->b:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {v2, p0}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0
.end method

.method public static D(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/cpj;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "zh"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string v1, "zh-Hant"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LangModel;->zh_tw:Ljava/lang/String;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    const-string p0, ""

    .line 36
    .line 37
    return-object p0
.end method

.method public static E(Ll/jjs;Ljava/util/List;)Ll/xbe;
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)",
            "Ll/xbe;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xbe;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xbe;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Ll/xbe;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    iput-object p0, v0, Ll/xbe;->b:Ll/jjs;

    .line 22
    .line 23
    new-instance v2, Ll/bce;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/bce;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, 0x4

    .line 37
    if-eqz v3, :cond_5

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Ll/hzj;

    .line 44
    .line 45
    iget-object v5, v3, Ll/hzj;->a:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object v3, v3, Ll/hzj;->a:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Ll/jjs;

    .line 71
    .line 72
    invoke-virtual {v5}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {v6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isSupportDraw()Z

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    if-eqz v7, :cond_3

    .line 81
    .line 82
    new-instance v7, Ll/qbe;

    .line 83
    .line 84
    invoke-direct {v7, v6}, Ll/qbe;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    iput v6, v7, Ll/qbe;->c:I

    .line 92
    .line 93
    if-ne v5, p0, :cond_4

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    iput v5, v0, Ll/xbe;->c:I

    .line 100
    .line 101
    invoke-virtual {v2}, Ll/bce;->f()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    iput v5, v0, Ll/xbe;->d:I

    .line 106
    .line 107
    const/4 v5, 0x1

    .line 108
    iput-boolean v5, v7, Ll/qbe;->b:Z

    .line 109
    .line 110
    :cond_4
    invoke-virtual {v2, v7}, Ll/bce;->e(Ll/qbe;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ll/bce;->f()I

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-ne v5, v4, :cond_3

    .line 118
    .line 119
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    iput v5, v2, Ll/bce;->a:I

    .line 124
    .line 125
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    new-instance v2, Ll/bce;

    .line 129
    .line 130
    invoke-direct {v2}, Ll/bce;-><init>()V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_5
    invoke-virtual {v2}, Ll/bce;->f()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-lez p0, :cond_6

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/bce;->f()I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eq p0, v4, :cond_6

    .line 145
    .line 146
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_6
    :goto_2
    return-object v0
.end method

.method public static F(Ljava/util/List;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;Z)",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qoj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/qoj;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public static G(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "JumpToScheme"

    .line 10
    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->action:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->jumpUrl:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->scheme:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 18
    .line 19
    return-object v0
.end method

.method public static H(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-static {p0, p1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1}, Ll/jjs;->k()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static I(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;)",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cpj;->w()Ljava/util/Date;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/soj;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/soj;-><init>(Ljava/util/Date;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static J(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->giftItemsCDNUrl:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static L(Ljava/util/List;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/apj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/apj;-><init>(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static M(Ll/rwn0;Z)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rwn0;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/hrk0;->q()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-ge v3, v4, :cond_6

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 31
    .line 32
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v4, v5}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const-string v5, "anchor"

    .line 39
    .line 40
    const-string v6, ""

    .line 41
    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 49
    .line 50
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 51
    .line 52
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_5

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget-object v8, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v7, v8}, Ll/hrk0;->n(Ljava/lang/String;)Ll/h64;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    if-nez v7, :cond_1

    .line 88
    .line 89
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    iget-object v7, v7, Ll/h64;->c:Ljava/lang/String;

    .line 103
    .line 104
    :goto_1
    new-instance v8, Ll/h64;

    .line 105
    .line 106
    iget-object v9, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 109
    .line 110
    invoke-direct {v8, v9, v4, v7}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v6, v6, v2}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    goto :goto_2

    .line 118
    :cond_2
    new-instance v8, Ll/h64;

    .line 119
    .line 120
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v9, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v10, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 125
    .line 126
    invoke-direct {v8, v7, v9, v10}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 130
    .line 131
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 132
    .line 133
    invoke-static {v7, v6, v4}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    :goto_2
    invoke-static {v8, v4}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    check-cast v8, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 150
    .line 151
    iget-object v8, v8, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->id:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v7, v8}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    if-eqz v7, :cond_3

    .line 158
    .line 159
    invoke-static {v7}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    new-instance v8, Ll/joj;

    .line 164
    .line 165
    invoke-direct {v8, v6}, Ll/joj;-><init>(Ll/coj;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v7, v8}, Ll/l6o0;->a(Ll/y20;)V

    .line 169
    .line 170
    .line 171
    :cond_3
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 176
    .line 177
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->role:Lcom/p1/mobile/putong/live/base/data/BLiveRole;

    .line 178
    .line 179
    invoke-static {v7, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_4

    .line 184
    .line 185
    const-string v5, "voiceLiveMain"

    .line 186
    .line 187
    iput-object v5, v6, Ll/coj;->g:Ljava/lang/String;

    .line 188
    .line 189
    const-string v5, "gift-audience-none-voiceLiveMain"

    .line 190
    .line 191
    iput-object v5, v4, Ll/p54;->b:Ljava/lang/String;

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_4
    const-string v5, "voiceLiveVice"

    .line 195
    .line 196
    iput-object v5, v6, Ll/coj;->g:Ljava/lang/String;

    .line 197
    .line 198
    const-string v5, "gift-audience-none-voiceLiveVice"

    .line 199
    .line 200
    iput-object v5, v4, Ll/p54;->b:Ljava/lang/String;

    .line 201
    .line 202
    :goto_3
    iput-object v4, v6, Ll/coj;->f:Ll/p54;

    .line 203
    .line 204
    const/4 v4, 0x1

    .line 205
    iput-boolean v4, v6, Ll/coj;->c:Z

    .line 206
    .line 207
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :cond_6
    return-object v1
.end method

.method public static N(Ll/rwn0;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rwn0;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rwn0;->i3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->f3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p0, v0}, Ll/cpj;->M(Ll/rwn0;Z)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/hrk0;->s()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    const/4 v2, 0x0

    .line 37
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ge v2, v3, :cond_3

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 48
    .line 49
    new-instance v4, Ll/h64;

    .line 50
    .line 51
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v6, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v4, v5, v6, v7}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 61
    .line 62
    const-string v6, ""

    .line 63
    .line 64
    iget v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 65
    .line 66
    invoke-static {v5, v6, v7}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-static {v4, v5}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    iget-object v7, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v6, v7}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    invoke-static {v6}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    new-instance v7, Ll/yoj;

    .line 89
    .line 90
    invoke-direct {v7, v4}, Ll/yoj;-><init>(Ll/coj;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v7}, Ll/l6o0;->a(Ll/y20;)V

    .line 94
    .line 95
    .line 96
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_2

    .line 109
    .line 110
    const-string v3, "voiceLiveMain"

    .line 111
    .line 112
    iput-object v3, v4, Ll/coj;->g:Ljava/lang/String;

    .line 113
    .line 114
    const-string v3, "gift-audience-none-voiceLiveMain"

    .line 115
    .line 116
    iput-object v3, v5, Ll/p54;->b:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    const-string v3, "voiceLiveVice"

    .line 120
    .line 121
    iput-object v3, v4, Ll/coj;->g:Ljava/lang/String;

    .line 122
    .line 123
    const-string v3, "gift-audience-none-voiceLiveVice"

    .line 124
    .line 125
    iput-object v3, v5, Ll/p54;->b:Ljava/lang/String;

    .line 126
    .line 127
    :goto_1
    iput-object v5, v4, Ll/coj;->f:Ll/p54;

    .line 128
    .line 129
    const/4 v3, 0x1

    .line 130
    iput-boolean v3, v4, Ll/coj;->c:Z

    .line 131
    .line 132
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    add-int/lit8 v2, v2, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    :goto_2
    return-object v0
.end method

.method public static O(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cpj;->A(Ljava/util/List;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/moj;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/moj;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static P(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_9

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 5
    .line 6
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 9
    .line 10
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 13
    .line 14
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 17
    .line 18
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 19
    .line 20
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 21
    .line 22
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 25
    .line 26
    iput-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 27
    .line 28
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 29
    .line 30
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 37
    .line 38
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 45
    .line 46
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 49
    .line 50
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 53
    .line 54
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 57
    .line 58
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 61
    .line 62
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 65
    .line 66
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_0

    .line 75
    .line 76
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lcom/p1/mobile/putong/data/LangModel;

    .line 85
    .line 86
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    :catch_0
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_1

    .line 95
    .line 96
    :try_start_1
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 97
    .line 98
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Lcom/p1/mobile/putong/data/LangModel;

    .line 105
    .line 106
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    .line 108
    :catch_1
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_2

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 119
    .line 120
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_3

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 131
    .line 132
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_4

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 141
    .line 142
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 143
    .line 144
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_5

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 153
    .line 154
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 155
    .line 156
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-nez v1, :cond_6

    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 165
    .line 166
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 167
    .line 168
    :cond_6
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 169
    .line 170
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    check-cast p0, Ll/jfv;

    .line 175
    .line 176
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 177
    .line 178
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {p0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    if-nez p0, :cond_7

    .line 187
    .line 188
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 189
    .line 190
    invoke-virtual {p0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isValidGiftType()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_8

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 201
    .line 202
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 203
    .line 204
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 205
    .line 206
    int-to-long v3, p0

    .line 207
    cmp-long p0, v1, v3

    .line 208
    .line 209
    if-ltz p0, :cond_8

    .line 210
    .line 211
    move-object v0, p1

    .line 212
    :cond_8
    if-eqz p2, :cond_9

    .line 213
    .line 214
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-nez p0, :cond_9

    .line 221
    .line 222
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {p0, p2}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    if-nez p0, :cond_9

    .line 233
    .line 234
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {p0, p1}, Ll/ere;->w(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_9
    return-object v0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->followStarResourceId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->chargeStarResourceId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p3, p0, v0, p1}, Ll/cpj;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/jjs;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Ll/dtj;Ll/jjs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/dtj;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic c(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/l6o0;->c:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/coj;->a:Z

    .line 4
    .line 5
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    iput-object p1, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic d(Ll/hzj;)Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hzj;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hzj;->a:Ljava/util/List;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public static synthetic e(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/l6o0;->c:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/coj;->a:Z

    .line 4
    .line 5
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    iput-object p1, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(ILl/hzj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/hzj;->b:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 10
    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 22
    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/data/LangModel;

    .line 46
    .line 47
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localSubtitle:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic h(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {p3, v0, v1}, Ll/cpj;->P(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    new-instance p3, Ll/jjs;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->followStarResourceId:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->chargeStarResourceId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p3, v0, p1, v1, p2}, Ll/jjs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic i(Ll/dtj;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dtj;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/hoj;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/hoj;-><init>(Ll/dtj;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/jjs;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic j(Ll/jjs;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->needToPlayAnim:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(ZLl/hzj;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Ll/hzj;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic l(Ljava/util/Date;Ll/jjs;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isNotPacketGift()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isValidPacketGift(Ljava/util/Date;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic m(Ll/jjs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 v1, 0x1

    .line 20
    invoke-static {p0, v0, v1}, Ll/cpj;->P(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;)Ll/xxj;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/cpj;->p(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p0, p1, v1}, Ll/cpj;->p(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v1, Ll/xxj;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/uxj;->d()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v1, v0, p0, p1}, Ll/xxj;-><init>(Ll/zxj;Ll/zxj;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v1
.end method

.method public static p(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;
    .locals 13

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->getGiftTabs(Z)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->getDefaultTabId(Z)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    new-instance v3, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    move v9, v4

    .line 20
    :goto_0
    if-ge v4, v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    .line 27
    .line 28
    new-instance v6, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v7, v5, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->entrances:Ljava/util/List;

    .line 34
    .line 35
    new-instance v8, Ll/foj;

    .line 36
    .line 37
    invoke-direct {v8, v5, p0, v6}, Ll/foj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v7, v8}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget-object v7, v5, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabGiftItems:Ljava/util/List;

    .line 44
    .line 45
    new-instance v8, Ll/koj;

    .line 46
    .line 47
    invoke-direct {v8, v6, v5, p0}, Ll/koj;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v7, v8}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    move-object v7, v5

    .line 54
    new-instance v5, Ll/hzj;

    .line 55
    .line 56
    move-object v8, v7

    .line 57
    iget v7, v8, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabId:I

    .line 58
    .line 59
    move-object v10, v8

    .line 60
    iget-object v8, v10, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 61
    .line 62
    move-object v11, v10

    .line 63
    invoke-virtual {p1}, Ll/uxj;->b()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v10

    .line 67
    iget-object v11, v11, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 68
    .line 69
    move v12, p2

    .line 70
    invoke-direct/range {v5 .. v12}, Ll/hzj;-><init>(Ljava/util/List;ILjava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;Z)V

    .line 71
    .line 72
    .line 73
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    add-int/lit8 v9, v9, 0x1

    .line 77
    .line 78
    add-int/lit8 v4, v4, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    move v12, p2

    .line 82
    new-instance p0, Ll/zxj;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/uxj;->d()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-direct {p0, v3, p1, v1, v12}, Ll/zxj;-><init>(Ljava/util/List;Ljava/lang/String;IZ)V

    .line 89
    .line 90
    .line 91
    return-object p0
.end method

.method public static q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;Lcom/p1/mobile/putong/live/base/data/BLiveGiftsFromCdnWarpData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->region:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftsFromCdnWarpData;->serverRegion:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->version:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftsFromCdnWarpData;->version:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static r(Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;Lcom/p1/mobile/putong/live/base/data/BLiveModelsFromCdnWarpData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->version:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveModelsFromCdnWarpData;->version:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/jjs;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x4

    .line 6
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->icon:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->title:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->subTitle:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Ll/cpj;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localSubtitle:Lcom/p1/mobile/putong/data/LangModel;

    .line 27
    .line 28
    invoke-static {p0}, Ll/cpj;->G(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 33
    .line 34
    new-instance p0, Ll/jjs;

    .line 35
    .line 36
    invoke-direct {p0, v0, p1, p2, p3}, Ll/jjs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public static t(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/cpj;->A(Ljava/util/List;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ioj;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ioj;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/jjs;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static u(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "voiceLiveAudience"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "voiceLiveVice"

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public static v(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x6

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "..."

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_0
    return-object p0
.end method

.method public static w()Ljava/util/Date;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static x(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dtj;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/woj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/woj;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, -0x1

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return p0
.end method

.method public static y(Ljava/util/List;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;I)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uoj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/uoj;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 p1, -0x1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return p0
.end method

.method public static z(Ll/zxj;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/zxj;->g()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zxj;->d()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_4

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_3

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ll/hzj;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    iget v6, v4, Ll/hzj;->b:I

    .line 58
    .line 59
    if-ne v5, v6, :cond_2

    .line 60
    .line 61
    move-object v1, v4

    .line 62
    :cond_3
    if-eqz v1, :cond_1

    .line 63
    .line 64
    :cond_4
    if-nez v1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/zxj;->d()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_5
    iget p0, v1, Ll/hzj;->b:I

    .line 72
    .line 73
    return p0
.end method
