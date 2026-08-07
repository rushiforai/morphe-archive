.class public final Ll/nlj0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:I

.field public c:Z

.field public d:I

.field public e:Z

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:F

.field public l:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:I

.field public n:I

.field public o:Landroid/text/Layout$Alignment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Landroid/text/Layout$Alignment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public q:I

.field public r:Ll/qri0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/nlj0;->f:I

    .line 6
    .line 7
    iput v0, p0, Ll/nlj0;->g:I

    .line 8
    .line 9
    iput v0, p0, Ll/nlj0;->h:I

    .line 10
    .line 11
    iput v0, p0, Ll/nlj0;->i:I

    .line 12
    .line 13
    iput v0, p0, Ll/nlj0;->j:I

    .line 14
    .line 15
    iput v0, p0, Ll/nlj0;->m:I

    .line 16
    .line 17
    iput v0, p0, Ll/nlj0;->n:I

    .line 18
    .line 19
    iput v0, p0, Ll/nlj0;->q:I

    .line 20
    .line 21
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 22
    .line 23
    .line 24
    iput v0, p0, Ll/nlj0;->s:F

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;)Ll/nlj0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/nlj0;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Z)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Z)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public D(Landroid/text/Layout$Alignment;)Ll/nlj0;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/nlj0;->p:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(I)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public F(I)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public G(F)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->s:F

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Landroid/text/Layout$Alignment;)Ll/nlj0;
    .locals 0
    .param p1    # Landroid/text/Layout$Alignment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/nlj0;->o:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Z)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->q:I

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Ll/qri0;)Ll/nlj0;
    .locals 0
    .param p1    # Ll/qri0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/nlj0;->r:Ll/qri0;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Z)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/nlj0;)Ll/nlj0;
    .locals 1
    .param p1    # Ll/nlj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/nlj0;->r(Ll/nlj0;Z)Ll/nlj0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public b()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nlj0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/nlj0;->d:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string p0, "Background color has not been defined."

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public c()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nlj0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/nlj0;->b:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const-string p0, "Font color has not been defined."

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlj0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()F
    .locals 0

    .line 1
    iget p0, p0, Ll/nlj0;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nlj0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlj0;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Landroid/text/Layout$Alignment;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlj0;->p:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nlj0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nlj0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public k()F
    .locals 0

    .line 1
    iget p0, p0, Ll/nlj0;->s:F

    .line 2
    .line 3
    return p0
.end method

.method public l()I
    .locals 3

    .line 1
    iget v0, p0, Ll/nlj0;->h:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ll/nlj0;->i:I

    .line 7
    .line 8
    if-ne v2, v1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move v0, v1

    .line 18
    :goto_0
    iget p0, p0, Ll/nlj0;->i:I

    .line 19
    .line 20
    if-ne p0, v2, :cond_2

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    :cond_2
    or-int p0, v0, v1

    .line 24
    .line 25
    return p0
.end method

.method public m()Landroid/text/Layout$Alignment;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlj0;->o:Landroid/text/Layout$Alignment;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/nlj0;->q:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public o()Ll/qri0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nlj0;->r:Ll/qri0;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nlj0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nlj0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final r(Ll/nlj0;Z)Ll/nlj0;
    .locals 3
    .param p1    # Ll/nlj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_e

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/nlj0;->c:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p1, Ll/nlj0;->c:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, p1, Ll/nlj0;->b:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/nlj0;->w(I)Ll/nlj0;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Ll/nlj0;->h:I

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iget v0, p1, Ll/nlj0;->h:I

    .line 22
    .line 23
    iput v0, p0, Ll/nlj0;->h:I

    .line 24
    .line 25
    :cond_1
    iget v0, p0, Ll/nlj0;->i:I

    .line 26
    .line 27
    if-ne v0, v1, :cond_2

    .line 28
    .line 29
    iget v0, p1, Ll/nlj0;->i:I

    .line 30
    .line 31
    iput v0, p0, Ll/nlj0;->i:I

    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Ll/nlj0;->a:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p1, Ll/nlj0;->a:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iput-object v0, p0, Ll/nlj0;->a:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget v0, p0, Ll/nlj0;->f:I

    .line 44
    .line 45
    if-ne v0, v1, :cond_4

    .line 46
    .line 47
    iget v0, p1, Ll/nlj0;->f:I

    .line 48
    .line 49
    iput v0, p0, Ll/nlj0;->f:I

    .line 50
    .line 51
    :cond_4
    iget v0, p0, Ll/nlj0;->g:I

    .line 52
    .line 53
    if-ne v0, v1, :cond_5

    .line 54
    .line 55
    iget v0, p1, Ll/nlj0;->g:I

    .line 56
    .line 57
    iput v0, p0, Ll/nlj0;->g:I

    .line 58
    .line 59
    :cond_5
    iget v0, p0, Ll/nlj0;->n:I

    .line 60
    .line 61
    if-ne v0, v1, :cond_6

    .line 62
    .line 63
    iget v0, p1, Ll/nlj0;->n:I

    .line 64
    .line 65
    iput v0, p0, Ll/nlj0;->n:I

    .line 66
    .line 67
    :cond_6
    iget-object v0, p0, Ll/nlj0;->o:Landroid/text/Layout$Alignment;

    .line 68
    .line 69
    if-nez v0, :cond_7

    .line 70
    .line 71
    iget-object v0, p1, Ll/nlj0;->o:Landroid/text/Layout$Alignment;

    .line 72
    .line 73
    if-eqz v0, :cond_7

    .line 74
    .line 75
    iput-object v0, p0, Ll/nlj0;->o:Landroid/text/Layout$Alignment;

    .line 76
    .line 77
    :cond_7
    iget-object v0, p0, Ll/nlj0;->p:Landroid/text/Layout$Alignment;

    .line 78
    .line 79
    if-nez v0, :cond_8

    .line 80
    .line 81
    iget-object v0, p1, Ll/nlj0;->p:Landroid/text/Layout$Alignment;

    .line 82
    .line 83
    if-eqz v0, :cond_8

    .line 84
    .line 85
    iput-object v0, p0, Ll/nlj0;->p:Landroid/text/Layout$Alignment;

    .line 86
    .line 87
    :cond_8
    iget v0, p0, Ll/nlj0;->q:I

    .line 88
    .line 89
    if-ne v0, v1, :cond_9

    .line 90
    .line 91
    iget v0, p1, Ll/nlj0;->q:I

    .line 92
    .line 93
    iput v0, p0, Ll/nlj0;->q:I

    .line 94
    .line 95
    :cond_9
    iget v0, p0, Ll/nlj0;->j:I

    .line 96
    .line 97
    if-ne v0, v1, :cond_a

    .line 98
    .line 99
    iget v0, p1, Ll/nlj0;->j:I

    .line 100
    .line 101
    iput v0, p0, Ll/nlj0;->j:I

    .line 102
    .line 103
    iget v0, p1, Ll/nlj0;->k:F

    .line 104
    .line 105
    iput v0, p0, Ll/nlj0;->k:F

    .line 106
    .line 107
    :cond_a
    iget-object v0, p0, Ll/nlj0;->r:Ll/qri0;

    .line 108
    .line 109
    if-nez v0, :cond_b

    .line 110
    .line 111
    iget-object v0, p1, Ll/nlj0;->r:Ll/qri0;

    .line 112
    .line 113
    iput-object v0, p0, Ll/nlj0;->r:Ll/qri0;

    .line 114
    .line 115
    :cond_b
    iget v0, p0, Ll/nlj0;->s:F

    .line 116
    .line 117
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 118
    .line 119
    .line 120
    cmpl-float v0, v0, v2

    .line 121
    .line 122
    if-nez v0, :cond_c

    .line 123
    .line 124
    iget v0, p1, Ll/nlj0;->s:F

    .line 125
    .line 126
    iput v0, p0, Ll/nlj0;->s:F

    .line 127
    .line 128
    :cond_c
    if-eqz p2, :cond_d

    .line 129
    .line 130
    iget-boolean v0, p0, Ll/nlj0;->e:Z

    .line 131
    .line 132
    if-nez v0, :cond_d

    .line 133
    .line 134
    iget-boolean v0, p1, Ll/nlj0;->e:Z

    .line 135
    .line 136
    if-eqz v0, :cond_d

    .line 137
    .line 138
    iget v0, p1, Ll/nlj0;->d:I

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Ll/nlj0;->u(I)Ll/nlj0;

    .line 141
    .line 142
    .line 143
    :cond_d
    if-eqz p2, :cond_e

    .line 144
    .line 145
    iget p2, p0, Ll/nlj0;->m:I

    .line 146
    .line 147
    if-ne p2, v1, :cond_e

    .line 148
    .line 149
    iget p1, p1, Ll/nlj0;->m:I

    .line 150
    .line 151
    if-eq p1, v1, :cond_e

    .line 152
    .line 153
    iput p1, p0, Ll/nlj0;->m:I

    .line 154
    .line 155
    :cond_e
    return-object p0
.end method

.method public s()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/nlj0;->f:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public t()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/nlj0;->g:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public u(I)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->d:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/nlj0;->e:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public v(Z)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public w(I)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->b:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/nlj0;->c:Z

    .line 5
    .line 6
    return-object p0
.end method

.method public x(Ljava/lang/String;)Ll/nlj0;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/nlj0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(F)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->k:F

    .line 2
    .line 3
    return-object p0
.end method

.method public z(I)Ll/nlj0;
    .locals 0

    .line 1
    iput p1, p0, Ll/nlj0;->j:I

    .line 2
    .line 3
    return-object p0
.end method
