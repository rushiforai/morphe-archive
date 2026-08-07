.class public Ll/cvf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:[Ll/jtl;

.field private b:Ll/dvf;

.field private c:Ll/avf;

.field private d:Z

.field private final e:Ll/ypl$b;

.field private f:Z

.field private g:Landroid/graphics/Rect;

.field private h:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Ll/ypl$b;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/cvf;->f:Z

    .line 6
    .line 7
    new-instance v1, Landroid/graphics/Rect;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/cvf;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    new-instance v1, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-direct {v1, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/cvf;->h:Landroid/graphics/Rect;

    .line 21
    .line 22
    iput-object p1, p0, Ll/cvf;->e:Ll/ypl$b;

    .line 23
    .line 24
    new-instance p1, Ll/dvf;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/dvf;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/cvf;->b:Ll/dvf;

    .line 30
    .line 31
    new-instance p1, Ll/avf;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/avf;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/cvf;->c:Ll/avf;

    .line 37
    .line 38
    new-instance p1, Ll/bvf;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/bvf;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/cvf;->b:Ll/dvf;

    .line 44
    .line 45
    iget-object v3, p0, Ll/cvf;->c:Ll/avf;

    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    new-array v4, v4, [Ll/jtl;

    .line 49
    .line 50
    aput-object v1, v4, v2

    .line 51
    .line 52
    aput-object v3, v4, v0

    .line 53
    .line 54
    const/4 v0, 0x2

    .line 55
    aput-object p1, v4, v0

    .line 56
    .line 57
    iput-object v4, p0, Ll/cvf;->a:[Ll/jtl;

    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 7

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_4

    .line 8
    .line 9
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/cvf;->a:[Ll/jtl;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    array-length v2, v0

    .line 23
    move v3, v1

    .line 24
    :goto_0
    if-ge v3, v2, :cond_2

    .line 25
    .line 26
    aget-object v4, v0, v3

    .line 27
    .line 28
    invoke-interface {v4, p1}, Ll/jtl;->a(Lcom/immomo/components/interfaces/IProcessOutput;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->a()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-lez v0, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Ll/cvf;->e:Ll/ypl$b;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    invoke-interface {p1, v1}, Lcom/immomo/components/interfaces/IProcessOutput;->b(I)Ll/ftl;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    iget-boolean v0, p0, Ll/cvf;->d:Z

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    iget-object v0, p0, Ll/cvf;->e:Ll/ypl$b;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v2, 0x1

    .line 65
    shr-int/2addr v0, v2

    .line 66
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getWidth()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    shr-int/2addr v3, v2

    .line 71
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    div-int/lit8 v4, v4, 0x4

    .line 76
    .line 77
    sub-int v5, v0, v4

    .line 78
    .line 79
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    sub-int v6, v3, v4

    .line 84
    .line 85
    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v4

    .line 90
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getHeight()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr v3, v4

    .line 99
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getWidth()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    new-instance v4, Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-direct {v4, v5, v1, v0, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/cvf;->g:Landroid/graphics/Rect;

    .line 113
    .line 114
    const/16 v1, 0x64

    .line 115
    .line 116
    invoke-static {v0, v4, v1}, Ll/bd4;->a(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    iput-object v4, p0, Ll/cvf;->g:Landroid/graphics/Rect;

    .line 123
    .line 124
    iget-object p0, p0, Ll/cvf;->e:Ll/ypl$b;

    .line 125
    .line 126
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getHeight()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->getWidth()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-interface {p0, v0, p1, v4, v2}, Ll/ypl$b;->f(IILandroid/graphics/Rect;Z)V

    .line 135
    .line 136
    .line 137
    :cond_4
    :goto_1
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cvf;->d:Z

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/cvf;->f:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/cvf;->g:Landroid/graphics/Rect;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvf;->b:Ll/dvf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dvf;->b(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
