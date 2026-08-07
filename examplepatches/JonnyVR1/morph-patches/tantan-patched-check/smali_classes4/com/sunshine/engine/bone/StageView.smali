.class public Lcom/sunshine/engine/bone/StageView;
.super Lcom/sunshine/engine/base/AnimView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sunshine/engine/base/AnimView<",
        "Ll/h1g0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/sunshine/engine/base/AnimView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/sunshine/engine/base/AnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/sunshine/engine/base/AnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a()Lcom/sunshine/engine/base/s;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/sunshine/engine/bone/StageView;->g()Ll/h1g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(II)V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 12
    .line 13
    check-cast v2, Ll/h1g0;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 16
    .line 17
    check-cast v2, Ll/g1g0;

    .line 18
    .line 19
    iget-object v2, v2, Ll/g1g0;->A:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/lit8 v2, v2, -0x1

    .line 26
    .line 27
    :goto_0
    const/4 v3, -0x1

    .line 28
    if-le v2, v3, :cond_3

    .line 29
    .line 30
    iget-object v4, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 31
    .line 32
    check-cast v4, Ll/h1g0;

    .line 33
    .line 34
    iget-object v4, v4, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 35
    .line 36
    check-cast v4, Ll/g1g0;

    .line 37
    .line 38
    iget-object v4, v4, Ll/g1g0;->A:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ll/p60;

    .line 45
    .line 46
    iget-boolean v5, v4, Ll/mrf0;->a:Z

    .line 47
    .line 48
    if-eqz v5, :cond_2

    .line 49
    .line 50
    iget-object v5, v4, Ll/p60;->g:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    add-int/lit8 v5, v5, -0x1

    .line 57
    .line 58
    :goto_1
    if-le v5, v3, :cond_2

    .line 59
    .line 60
    iget-object v6, v4, Ll/p60;->g:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    check-cast v6, Ll/c53;

    .line 67
    .line 68
    iget-boolean v7, v6, Ll/mrf0;->a:Z

    .line 69
    .line 70
    if-eqz v7, :cond_1

    .line 71
    .line 72
    iget-object v7, v4, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 73
    .line 74
    invoke-virtual {v1, v7}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 75
    .line 76
    .line 77
    iget-object v7, v6, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 78
    .line 79
    invoke-virtual {v1, v7}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 80
    .line 81
    .line 82
    iget-object v7, v6, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 83
    .line 84
    invoke-virtual {v1, v0, v7}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 85
    .line 86
    .line 87
    int-to-float v7, p1

    .line 88
    int-to-float v8, p2

    .line 89
    invoke-virtual {v0, v7, v8}, Landroid/graphics/RectF;->contains(FF)Z

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-eqz v7, :cond_1

    .line 94
    .line 95
    iget-object v3, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 96
    .line 97
    check-cast v3, Ll/h1g0;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 100
    .line 101
    check-cast v3, Ll/g1g0;

    .line 102
    .line 103
    iget-object v3, v3, Lcom/sunshine/engine/base/a;->x:Ljava/util/Map;

    .line 104
    .line 105
    iget-object v4, v6, Ll/mrf0;->d:Ljava/lang/String;

    .line 106
    .line 107
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Lcom/sunshine/engine/base/a$a;

    .line 112
    .line 113
    if-eqz v3, :cond_2

    .line 114
    .line 115
    instance-of v4, v3, Lcom/sunshine/engine/base/a$d;

    .line 116
    .line 117
    if-eqz v4, :cond_0

    .line 118
    .line 119
    check-cast v3, Lcom/sunshine/engine/base/a$d;

    .line 120
    .line 121
    iget-object v4, v6, Ll/mrf0;->d:Ljava/lang/String;

    .line 122
    .line 123
    invoke-interface {v3, v4, v0, p1, p2}, Lcom/sunshine/engine/base/a$d;->b(Ljava/lang/String;Landroid/graphics/RectF;II)V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_0
    instance-of v4, v3, Lcom/sunshine/engine/base/a$b;

    .line 128
    .line 129
    if-eqz v4, :cond_2

    .line 130
    .line 131
    check-cast v3, Lcom/sunshine/engine/base/a$b;

    .line 132
    .line 133
    iget-object v4, v6, Ll/mrf0;->d:Ljava/lang/String;

    .line 134
    .line 135
    invoke-interface {v3, v4}, Lcom/sunshine/engine/base/a$b;->onClick(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_1
    add-int/lit8 v5, v5, -0x1

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, -0x1

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_3
    return-void
.end method

.method public f(Z)Lcom/sunshine/engine/bone/StageView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/h1g0;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    check-cast v0, Ll/h1g0;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 13
    .line 14
    check-cast v0, Ll/g1g0;

    .line 15
    .line 16
    iput-boolean p1, v0, Ll/g1g0;->C:Z

    .line 17
    .line 18
    :cond_0
    return-object p0
.end method

.method public g()Ll/h1g0;
    .locals 0

    .line 1
    new-instance p0, Ll/h1g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h1g0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public h(FFI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    check-cast v0, Ll/h1g0;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/h1g0;->u(FFI)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnRepeat(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    check-cast p0, Ll/h1g0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/h1g0;->t(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setPercent(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 2
    .line 3
    check-cast v0, Ll/h1g0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, p1, v1}, Ll/h1g0;->u(FFI)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
