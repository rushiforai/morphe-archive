.class public Ll/rg60$c;
.super Ll/pud;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rg60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
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
.field public final c:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/by3;

.field public final e:Ll/fj80;

.field public final f:Ll/wq3;

.field public final g:Ll/n0f;

.field public final h:Z


# direct methods
.method public constructor <init>(Ll/z06;Ll/a7h0;Ll/by3;Ll/fj80;Ll/wq3;Ll/n0f;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;",
            "Ll/by3;",
            "Ll/fj80;",
            "Ll/wq3;",
            "Ll/n0f;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/pud;-><init>(Ll/z06;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/rg60$c;->c:Ll/a7h0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/rg60$c;->d:Ll/by3;

    .line 7
    .line 8
    iput-object p4, p0, Ll/rg60$c;->e:Ll/fj80;

    .line 9
    .line 10
    iput-object p5, p0, Ll/rg60$c;->f:Ll/wq3;

    .line 11
    .line 12
    iput-object p6, p0, Ll/rg60$c;->g:Ll/n0f;

    .line 13
    .line 14
    iput-boolean p7, p0, Ll/rg60$c;->h:Z

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Ll/z06;Ll/a7h0;Ll/by3;Ll/fj80;Ll/wq3;Ll/n0f;ZLl/sg60;)V
    .locals 0

    .line 17
    invoke-direct/range {p0 .. p7}, Ll/rg60$c;-><init>(Ll/z06;Ll/a7h0;Ll/by3;Ll/fj80;Ll/wq3;Ll/n0f;Z)V

    return-void
.end method


# virtual methods
.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/n0f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rg60$c;->r(Ll/n0f;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p(Ljava/io/InputStream;Ljava/io/OutputStream;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rg60$c;->f:Ll/wq3;

    .line 2
    .line 3
    const/16 v1, 0x4000

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, [B

    .line 10
    .line 11
    move v2, p3

    .line 12
    :cond_0
    :goto_0
    if-lez v2, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {p1, v0, v4, v3}, Ljava/io/InputStream;->read([BII)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-ltz v3, :cond_1

    .line 24
    .line 25
    if-lez v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    sub-int/2addr v2, v3

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    iget-object p0, p0, Ll/rg60$c;->f:Ll/wq3;

    .line 34
    .line 35
    invoke-interface {p0, v0}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    throw p1

    .line 39
    :cond_1
    iget-object p0, p0, Ll/rg60$c;->f:Ll/wq3;

    .line 40
    .line 41
    invoke-interface {p0, v0}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    if-gtz v2, :cond_2

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/4 p1, 0x0

    .line 60
    const-string p2, "Failed to read %d bytes - finished %d short"

    .line 61
    .line 62
    invoke-static {p1, p2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final q(Ll/n0f;Ll/n0f;)Ll/hj80;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/n0f;->u()Ll/vr3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/vr3;

    .line 10
    .line 11
    iget v0, v0, Ll/vr3;->a:I

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/n0f;->M()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v1, v0

    .line 18
    iget-object v2, p0, Ll/rg60$c;->e:Ll/fj80;

    .line 19
    .line 20
    invoke-interface {v2, v1}, Ll/fj80;->d(I)Ll/hj80;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p1}, Ll/n0f;->I()Ljava/io/InputStream;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1, v1, v0}, Ll/rg60$c;->p(Ljava/io/InputStream;Ljava/io/OutputStream;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Ll/n0f;->I()Ljava/io/InputStream;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2}, Ll/n0f;->M()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p0, p1, v1, p2}, Ll/rg60$c;->p(Ljava/io/InputStream;Ljava/io/OutputStream;I)V

    .line 40
    .line 41
    .line 42
    return-object v1
.end method

.method public r(Ll/n0f;I)V
    .locals 2

    .line 1
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/rg60$c;->g:Ll/n0f;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/n0f;->u()Ll/vr3;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :try_start_0
    iget-object p2, p0, Ll/rg60$c;->g:Ll/n0f;

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Ll/rg60$c;->q(Ll/n0f;Ll/n0f;)Ll/hj80;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p2}, Ll/rg60$c;->s(Ll/hj80;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-virtual {p1}, Ll/n0f;->close()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/rg60$c;->g:Ll/n0f;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/n0f;->close()V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception p2

    .line 39
    goto :goto_2

    .line 40
    :catch_0
    move-exception p2

    .line 41
    :try_start_1
    const-string v0, "PartialDiskCacheProducer"

    .line 42
    .line 43
    const-string v1, "Error while merging image data"

    .line 44
    .line 45
    invoke-static {v0, v1, p2}, Ll/huf;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, p2}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :goto_1
    iget-object p1, p0, Ll/rg60$c;->c:Ll/a7h0;

    .line 57
    .line 58
    invoke-interface {p1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ll/g4e;

    .line 63
    .line 64
    invoke-interface {p1}, Ll/g4e;->c()Ll/mh3;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p0, p0, Ll/rg60$c;->d:Ll/by3;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ll/mh3;->k(Ll/by3;)Ll/ini0;

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :goto_2
    invoke-virtual {p1}, Ll/n0f;->close()V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/rg60$c;->g:Ll/n0f;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/n0f;->close()V

    .line 80
    .line 81
    .line 82
    throw p2

    .line 83
    :cond_1
    iget-boolean v0, p0, Ll/rg60$c;->h:Z

    .line 84
    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    const/16 v0, 0x8

    .line 88
    .line 89
    invoke-static {p2, v0}, Ll/ji2;->m(II)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-static {p2}, Ll/ji2;->d(I)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget-object v1, Ll/him;->c:Ll/him;

    .line 108
    .line 109
    if-eq v0, v1, :cond_2

    .line 110
    .line 111
    iget-object v0, p0, Ll/rg60$c;->c:Ll/a7h0;

    .line 112
    .line 113
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ll/g4e;

    .line 118
    .line 119
    invoke-interface {v0}, Ll/g4e;->c()Ll/mh3;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Ll/rg60$c;->d:Ll/by3;

    .line 124
    .line 125
    invoke-virtual {v0, v1, p1}, Ll/mh3;->i(Ll/by3;Ll/n0f;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_2
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final s(Ll/hj80;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/hj80;->k()Lcom/facebook/common/memory/PooledByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    :try_start_0
    new-instance v1, Ll/n0f;

    .line 11
    .line 12
    invoke-direct {v1, p1}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    .line 15
    :try_start_1
    invoke-virtual {v1}, Ll/n0f;->e0()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-interface {p0, v1, v0}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/n0f;->n(Ll/n0f;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    move-object v0, v1

    .line 35
    goto :goto_0

    .line 36
    :catchall_1
    move-exception p0

    .line 37
    :goto_0
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method
