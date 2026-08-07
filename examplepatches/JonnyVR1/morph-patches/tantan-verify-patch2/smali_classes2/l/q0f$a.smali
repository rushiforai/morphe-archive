.class public Ll/q0f$a;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q0f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/n0f;",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/by3;

.field public final e:Z

.field public final f:Z


# direct methods
.method public constructor <init>(Ll/z06;Ll/mpy;Ll/by3;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;",
            "Ll/by3;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/q0f$a;->c:Ll/mpy;

    .line 5
    .line 6
    iput-object p3, p0, Ll/q0f$a;->d:Ll/by3;

    .line 7
    .line 8
    iput-boolean p4, p0, Ll/q0f$a;->e:Z

    .line 9
    .line 10
    iput-boolean p5, p0, Ll/q0f$a;->f:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/q0f$a;->p(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/n0f;I)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "EncodedMemoryCacheProducer#onNewResultImpl"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    if-eqz p1, :cond_4

    .line 19
    .line 20
    const/16 v0, 0xa

    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/ji2;->l(II)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_4

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Ll/him;->c:Ll/him;

    .line 33
    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    invoke-virtual {p1}, Ll/n0f;->t()Ll/fb5;

    .line 38
    .line 39
    .line 40
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    :try_start_1
    iget-boolean v1, p0, Ll/q0f$a;->f:Z

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-boolean v1, p0, Ll/q0f$a;->e:Z

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Ll/q0f$a;->c:Ll/mpy;

    .line 52
    .line 53
    iget-object v2, p0, Ll/q0f$a;->d:Ll/by3;

    .line 54
    .line 55
    invoke-interface {v1, v2, v0}, Ll/mpy;->b(Ljava/lang/Object;Ll/fb5;)Ll/fb5;

    .line 56
    .line 57
    .line 58
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    const/4 v1, 0x0

    .line 63
    :goto_0
    :try_start_2
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 64
    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    :try_start_3
    new-instance v0, Ll/n0f;

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ll/n0f;-><init>(Ll/fb5;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, p1}, Ll/n0f;->q(Ll/n0f;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 74
    .line 75
    .line 76
    :try_start_4
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 77
    .line 78
    .line 79
    :try_start_5
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const/high16 v1, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-interface {p1, v1}, Ll/z06;->c(F)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0, v0, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 93
    .line 94
    .line 95
    :try_start_6
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/i9j;->d()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_5

    .line 103
    .line 104
    invoke-static {}, Ll/i9j;->b()V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :catchall_1
    move-exception p0

    .line 109
    :try_start_7
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V

    .line 110
    .line 111
    .line 112
    throw p0

    .line 113
    :catchall_2
    move-exception p0

    .line 114
    invoke-static {v1}, Ll/fb5;->v(Ll/fb5;)V

    .line 115
    .line 116
    .line 117
    throw p0

    .line 118
    :goto_1
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 119
    .line 120
    .line 121
    throw p0

    .line 122
    :cond_3
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/i9j;->d()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_5

    .line 134
    .line 135
    invoke-static {}, Ll/i9j;->b()V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_4
    :goto_2
    :try_start_8
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ll/i9j;->d()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-eqz p0, :cond_5

    .line 151
    .line 152
    invoke-static {}, Ll/i9j;->b()V

    .line 153
    .line 154
    .line 155
    :cond_5
    return-void

    .line 156
    :catchall_3
    move-exception p0

    .line 157
    invoke-static {}, Ll/i9j;->d()Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_6

    .line 162
    .line 163
    invoke-static {}, Ll/i9j;->b()V

    .line 164
    .line 165
    .line 166
    :cond_6
    throw p0
.end method
