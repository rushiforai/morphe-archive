.class public Ll/nq2;
.super Ll/hs10;
.source "SourceFile"

# interfaces
.implements Ll/rsl;


# instance fields
.field protected a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ore;",
            ">;"
        }
    .end annotation
.end field

.field protected b:J

.field protected c:Z

.field protected d:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/hs10;-><init>(I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/nq2;->a:Ljava/util/List;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/nq2;->b:J

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/nq2;->c:Z

    .line 17
    .line 18
    iput-boolean p1, p0, Ll/nq2;->d:Z

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public addEffectTimeInfo(Ll/ore;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearEffectTimeInfos()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onDrawFrame()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/nq2;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_4

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    move v2, v0

    .line 22
    move v3, v2

    .line 23
    :goto_0
    iget-object v4, p0, Ll/nq2;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-ge v2, v4, :cond_2

    .line 30
    .line 31
    iget-wide v4, p0, Ll/nq2;->b:J

    .line 32
    .line 33
    iget-object v6, p0, Ll/nq2;->a:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    check-cast v6, Ll/ore;

    .line 40
    .line 41
    iget-wide v6, v6, Ll/ore;->a:J

    .line 42
    .line 43
    cmp-long v4, v4, v6

    .line 44
    .line 45
    if-ltz v4, :cond_1

    .line 46
    .line 47
    iget-wide v4, p0, Ll/nq2;->b:J

    .line 48
    .line 49
    iget-object v6, p0, Ll/nq2;->a:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    check-cast v6, Ll/ore;

    .line 56
    .line 57
    iget-wide v6, v6, Ll/ore;->b:J

    .line 58
    .line 59
    cmp-long v4, v4, v6

    .line 60
    .line 61
    if-gtz v4, :cond_1

    .line 62
    .line 63
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 64
    .line 65
    .line 66
    iput-boolean v0, p0, Ll/nq2;->d:Z

    .line 67
    .line 68
    move v3, v1

    .line 69
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    if-nez v3, :cond_6

    .line 73
    .line 74
    iput-boolean v1, p0, Ll/nq2;->d:Z

    .line 75
    .line 76
    iget-object v0, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_6

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Ll/dfj;

    .line 93
    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    iget v3, p0, Ll/wej;->texture_in:I

    .line 97
    .line 98
    invoke-interface {v2, v3, p0, v1}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    iget-object v0, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_6

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Ll/dfj;

    .line 119
    .line 120
    if-eqz v2, :cond_5

    .line 121
    .line 122
    iget v3, p0, Ll/wej;->texture_in:I

    .line 123
    .line 124
    invoke-interface {v2, v3, p0, v1}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_6
    return-void
.end method

.method public removeLast(Ll/ore;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nq2;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setGlobalEffect(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nq2;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/nq2;->b:J

    .line 2
    .line 3
    return-void
.end method
