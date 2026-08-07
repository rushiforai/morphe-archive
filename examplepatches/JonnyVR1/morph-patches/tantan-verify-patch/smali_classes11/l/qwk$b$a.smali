.class public final Ll/qwk$b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qwk$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ll/jb20$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I


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

.method public synthetic constructor <init>(Ll/qwk$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ll/qwk$b$a;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/qwk$b$a;Ll/qwk$b$a;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qwk$b$a;->c(Ll/qwk$b$a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/qwk$b$a;->b:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/qwk$b$a;->a:Z

    .line 5
    .line 6
    return-void
.end method

.method public final c(Ll/qwk$b$a;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/qwk$b$a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p1, Ll/qwk$b$a;->a:Z

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    return v2

    .line 13
    :cond_1
    iget-object v0, p0, Ll/qwk$b$a;->c:Ll/jb20$c;

    .line 14
    .line 15
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/jb20$c;

    .line 20
    .line 21
    iget-object v3, p1, Ll/qwk$b$a;->c:Ll/jb20$c;

    .line 22
    .line 23
    invoke-static {v3}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ll/jb20$c;

    .line 28
    .line 29
    iget v4, p0, Ll/qwk$b$a;->f:I

    .line 30
    .line 31
    iget v5, p1, Ll/qwk$b$a;->f:I

    .line 32
    .line 33
    if-ne v4, v5, :cond_7

    .line 34
    .line 35
    iget v4, p0, Ll/qwk$b$a;->g:I

    .line 36
    .line 37
    iget v5, p1, Ll/qwk$b$a;->g:I

    .line 38
    .line 39
    if-ne v4, v5, :cond_7

    .line 40
    .line 41
    iget-boolean v4, p0, Ll/qwk$b$a;->h:Z

    .line 42
    .line 43
    iget-boolean v5, p1, Ll/qwk$b$a;->h:Z

    .line 44
    .line 45
    if-ne v4, v5, :cond_7

    .line 46
    .line 47
    iget-boolean v4, p0, Ll/qwk$b$a;->i:Z

    .line 48
    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    iget-boolean v4, p1, Ll/qwk$b$a;->i:Z

    .line 52
    .line 53
    if-eqz v4, :cond_2

    .line 54
    .line 55
    iget-boolean v4, p0, Ll/qwk$b$a;->j:Z

    .line 56
    .line 57
    iget-boolean v5, p1, Ll/qwk$b$a;->j:Z

    .line 58
    .line 59
    if-ne v4, v5, :cond_7

    .line 60
    .line 61
    :cond_2
    iget v4, p0, Ll/qwk$b$a;->d:I

    .line 62
    .line 63
    iget v5, p1, Ll/qwk$b$a;->d:I

    .line 64
    .line 65
    if-eq v4, v5, :cond_3

    .line 66
    .line 67
    if-eqz v4, :cond_7

    .line 68
    .line 69
    if-eqz v5, :cond_7

    .line 70
    .line 71
    :cond_3
    iget v0, v0, Ll/jb20$c;->l:I

    .line 72
    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    iget v4, v3, Ll/jb20$c;->l:I

    .line 76
    .line 77
    if-nez v4, :cond_4

    .line 78
    .line 79
    iget v4, p0, Ll/qwk$b$a;->m:I

    .line 80
    .line 81
    iget v5, p1, Ll/qwk$b$a;->m:I

    .line 82
    .line 83
    if-ne v4, v5, :cond_7

    .line 84
    .line 85
    iget v4, p0, Ll/qwk$b$a;->n:I

    .line 86
    .line 87
    iget v5, p1, Ll/qwk$b$a;->n:I

    .line 88
    .line 89
    if-ne v4, v5, :cond_7

    .line 90
    .line 91
    :cond_4
    if-ne v0, v2, :cond_5

    .line 92
    .line 93
    iget v0, v3, Ll/jb20$c;->l:I

    .line 94
    .line 95
    if-ne v0, v2, :cond_5

    .line 96
    .line 97
    iget v0, p0, Ll/qwk$b$a;->o:I

    .line 98
    .line 99
    iget v3, p1, Ll/qwk$b$a;->o:I

    .line 100
    .line 101
    if-ne v0, v3, :cond_7

    .line 102
    .line 103
    iget v0, p0, Ll/qwk$b$a;->p:I

    .line 104
    .line 105
    iget v3, p1, Ll/qwk$b$a;->p:I

    .line 106
    .line 107
    if-ne v0, v3, :cond_7

    .line 108
    .line 109
    :cond_5
    iget-boolean v0, p0, Ll/qwk$b$a;->k:Z

    .line 110
    .line 111
    iget-boolean v3, p1, Ll/qwk$b$a;->k:Z

    .line 112
    .line 113
    if-ne v0, v3, :cond_7

    .line 114
    .line 115
    if-eqz v0, :cond_6

    .line 116
    .line 117
    iget p0, p0, Ll/qwk$b$a;->l:I

    .line 118
    .line 119
    iget p1, p1, Ll/qwk$b$a;->l:I

    .line 120
    .line 121
    if-eq p0, p1, :cond_6

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    return v1

    .line 125
    :cond_7
    :goto_0
    return v2
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/qwk$b$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Ll/qwk$b$a;->e:I

    .line 6
    .line 7
    const/4 v0, 0x7

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public e(Ll/jb20$c;IIIIZZZZIIIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qwk$b$a;->c:Ll/jb20$c;

    .line 2
    .line 3
    iput p2, p0, Ll/qwk$b$a;->d:I

    .line 4
    .line 5
    iput p3, p0, Ll/qwk$b$a;->e:I

    .line 6
    .line 7
    iput p4, p0, Ll/qwk$b$a;->f:I

    .line 8
    .line 9
    iput p5, p0, Ll/qwk$b$a;->g:I

    .line 10
    .line 11
    iput-boolean p6, p0, Ll/qwk$b$a;->h:Z

    .line 12
    .line 13
    iput-boolean p7, p0, Ll/qwk$b$a;->i:Z

    .line 14
    .line 15
    iput-boolean p8, p0, Ll/qwk$b$a;->j:Z

    .line 16
    .line 17
    iput-boolean p9, p0, Ll/qwk$b$a;->k:Z

    .line 18
    .line 19
    iput p10, p0, Ll/qwk$b$a;->l:I

    .line 20
    .line 21
    iput p11, p0, Ll/qwk$b$a;->m:I

    .line 22
    .line 23
    iput p12, p0, Ll/qwk$b$a;->n:I

    .line 24
    .line 25
    iput p13, p0, Ll/qwk$b$a;->o:I

    .line 26
    .line 27
    iput p14, p0, Ll/qwk$b$a;->p:I

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Ll/qwk$b$a;->a:Z

    .line 31
    .line 32
    iput-boolean p1, p0, Ll/qwk$b$a;->b:Z

    .line 33
    .line 34
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qwk$b$a;->e:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/qwk$b$a;->b:Z

    .line 5
    .line 6
    return-void
.end method
