.class public Lcom/sunshine/engine/particle/SceneView;
.super Lcom/sunshine/engine/base/AnimView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sunshine/engine/base/AnimView<",
        "Ll/x1e0;",
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
    invoke-virtual {p0}, Lcom/sunshine/engine/particle/SceneView;->f()Ll/x1e0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(II)V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 7
    .line 8
    check-cast v1, Ll/x1e0;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 11
    .line 12
    check-cast v1, Ll/v1e0;

    .line 13
    .line 14
    iget-object v1, v1, Ll/v1e0;->C:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    :goto_0
    const/4 v2, -0x1

    .line 23
    if-le v1, v2, :cond_3

    .line 24
    .line 25
    iget-object v2, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 26
    .line 27
    check-cast v2, Ll/x1e0;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 30
    .line 31
    check-cast v2, Ll/v1e0;

    .line 32
    .line 33
    iget-object v2, v2, Ll/v1e0;->C:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ll/wg60;

    .line 40
    .line 41
    iget-boolean v3, v2, Ll/mrf0;->a:Z

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    iget-object v3, v2, Ll/mrf0;->b:Landroid/graphics/Matrix;

    .line 46
    .line 47
    iget-object v4, v2, Ll/mrf0;->c:Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-virtual {v3, v0, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 50
    .line 51
    .line 52
    int-to-float v3, p1

    .line 53
    int-to-float v4, p2

    .line 54
    invoke-virtual {v0, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Lcom/sunshine/engine/base/AnimView;->a:Lcom/sunshine/engine/base/s;

    .line 61
    .line 62
    check-cast p0, Ll/x1e0;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/sunshine/engine/base/s;->e:Lcom/sunshine/engine/base/a;

    .line 65
    .line 66
    check-cast p0, Ll/v1e0;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->x:Ljava/util/Map;

    .line 69
    .line 70
    iget-object v1, v2, Ll/mrf0;->d:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/sunshine/engine/base/a$a;

    .line 77
    .line 78
    if-eqz p0, :cond_3

    .line 79
    .line 80
    instance-of v1, p0, Lcom/sunshine/engine/base/a$c;

    .line 81
    .line 82
    if-eqz v1, :cond_0

    .line 83
    .line 84
    check-cast p0, Lcom/sunshine/engine/base/a$c;

    .line 85
    .line 86
    iget-object p1, v2, Ll/mrf0;->d:Ljava/lang/String;

    .line 87
    .line 88
    invoke-interface {p0, p1, v2}, Lcom/sunshine/engine/base/a$c;->a(Ljava/lang/String;Ll/wg60;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    instance-of v1, p0, Lcom/sunshine/engine/base/a$b;

    .line 93
    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    check-cast p0, Lcom/sunshine/engine/base/a$b;

    .line 97
    .line 98
    iget-object p1, v2, Ll/mrf0;->d:Ljava/lang/String;

    .line 99
    .line 100
    invoke-interface {p0, p1}, Lcom/sunshine/engine/base/a$b;->onClick(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    instance-of v1, p0, Lcom/sunshine/engine/base/a$d;

    .line 105
    .line 106
    if-eqz v1, :cond_3

    .line 107
    .line 108
    check-cast p0, Lcom/sunshine/engine/base/a$d;

    .line 109
    .line 110
    iget-object v1, v2, Ll/mrf0;->d:Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {p0, v1, v0, p1, p2}, Lcom/sunshine/engine/base/a$d;->b(Ljava/lang/String;Landroid/graphics/RectF;II)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    return-void
.end method

.method public f()Ll/x1e0;
    .locals 0

    .line 1
    new-instance p0, Ll/x1e0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/x1e0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
