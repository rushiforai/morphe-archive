.class public final Ll/tmc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm$a;


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/oij0;

.field public final c:Ll/n6f;

.field public final d:I

.field public final e:Ll/x1d0;

.field public final f:Ll/ry3;

.field public final g:I

.field public final h:I

.field public final i:I

.field public j:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/oij0;Ll/n6f;ILl/x1d0;Ll/ry3;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/azm;",
            ">;",
            "Ll/oij0;",
            "Ll/n6f;",
            "I",
            "Ll/x1d0;",
            "Ll/ry3;",
            "III)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tmc0;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tmc0;->b:Ll/oij0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tmc0;->c:Ll/n6f;

    .line 9
    .line 10
    iput p4, p0, Ll/tmc0;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/tmc0;->e:Ll/x1d0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/tmc0;->f:Ll/ry3;

    .line 15
    .line 16
    iput p7, p0, Ll/tmc0;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/tmc0;->h:I

    .line 19
    .line 20
    iput p9, p0, Ll/tmc0;->i:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Ll/x1d0;)Ll/i5d0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tmc0;->b:Ll/oij0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tmc0;->c:Ll/n6f;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/tmc0;->c(Ll/x1d0;Ll/oij0;Ll/n6f;)Ll/i5d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b()Ll/n6f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tmc0;->c:Ll/n6f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public c(Ll/x1d0;Ll/oij0;Ll/n6f;)Ll/i5d0;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/tmc0;->d:I

    .line 4
    .line 5
    iget-object v2, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ge v1, v2, :cond_8

    .line 13
    .line 14
    iget v1, v0, Ll/tmc0;->j:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    add-int/2addr v1, v2

    .line 18
    iput v1, v0, Ll/tmc0;->j:I

    .line 19
    .line 20
    iget-object v1, v0, Ll/tmc0;->c:Ll/n6f;

    .line 21
    .line 22
    const-string v4, "network interceptor "

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/n6f;->c()Ll/imc0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual/range {p1 .. p1}, Ll/x1d0;->k()Ll/rnl;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v1, v5}, Ll/imc0;->w(Ll/rnl;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v1, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 42
    .line 43
    iget v0, v0, Ll/tmc0;->d:I

    .line 44
    .line 45
    sub-int/2addr v0, v2

    .line 46
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, " must retain the same host and port"

    .line 51
    .line 52
    invoke-static {v4, v0, v1}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-object v3

    .line 56
    :cond_1
    :goto_0
    iget-object v1, v0, Ll/tmc0;->c:Ll/n6f;

    .line 57
    .line 58
    const-string v5, " must call proceed() exactly once"

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget v1, v0, Ll/tmc0;->j:I

    .line 63
    .line 64
    if-gt v1, v2, :cond_2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    iget-object v1, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 68
    .line 69
    iget v0, v0, Ll/tmc0;->d:I

    .line 70
    .line 71
    sub-int/2addr v0, v2

    .line 72
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v4, v0, v5}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    return-object v3

    .line 80
    :cond_3
    :goto_1
    new-instance v6, Ll/tmc0;

    .line 81
    .line 82
    iget-object v7, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 83
    .line 84
    iget v1, v0, Ll/tmc0;->d:I

    .line 85
    .line 86
    add-int/lit8 v10, v1, 0x1

    .line 87
    .line 88
    iget-object v12, v0, Ll/tmc0;->f:Ll/ry3;

    .line 89
    .line 90
    iget v13, v0, Ll/tmc0;->g:I

    .line 91
    .line 92
    iget v14, v0, Ll/tmc0;->h:I

    .line 93
    .line 94
    iget v15, v0, Ll/tmc0;->i:I

    .line 95
    .line 96
    move-object/from16 v11, p1

    .line 97
    .line 98
    move-object/from16 v8, p2

    .line 99
    .line 100
    move-object/from16 v9, p3

    .line 101
    .line 102
    invoke-direct/range {v6 .. v15}, Ll/tmc0;-><init>(Ljava/util/List;Ll/oij0;Ll/n6f;ILl/x1d0;Ll/ry3;III)V

    .line 103
    .line 104
    .line 105
    iget-object v1, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 106
    .line 107
    iget v7, v0, Ll/tmc0;->d:I

    .line 108
    .line 109
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Ll/azm;

    .line 114
    .line 115
    invoke-interface {v1, v6}, Ll/azm;->intercept(Ll/azm$a;)Ll/i5d0;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    if-eqz p3, :cond_5

    .line 120
    .line 121
    iget v8, v0, Ll/tmc0;->d:I

    .line 122
    .line 123
    add-int/2addr v8, v2

    .line 124
    iget-object v0, v0, Ll/tmc0;->a:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-ge v8, v0, :cond_5

    .line 131
    .line 132
    iget v0, v6, Ll/tmc0;->j:I

    .line 133
    .line 134
    if-ne v0, v2, :cond_4

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_4
    invoke-static {v4, v1, v5}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return-object v3

    .line 141
    :cond_5
    :goto_2
    const-string v0, "interceptor "

    .line 142
    .line 143
    if-eqz v7, :cond_7

    .line 144
    .line 145
    invoke-virtual {v7}, Ll/i5d0;->k()Ll/k5d0;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    if-eqz v2, :cond_6

    .line 150
    .line 151
    return-object v7

    .line 152
    :cond_6
    const-string v2, " returned a response with no body"

    .line 153
    .line 154
    invoke-static {v0, v1, v2}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    return-object v3

    .line 158
    :cond_7
    const-string v2, " returned null"

    .line 159
    .line 160
    invoke-static {v0, v1, v2}, Ll/c0l;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    return-object v3

    .line 164
    :cond_8
    invoke-static {}, Ll/aqg0;->a()V

    .line 165
    .line 166
    .line 167
    return-object v3
.end method

.method public connectTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tmc0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public connection()Ll/bx5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tmc0;->c:Ll/n6f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n6f;->c()Ll/imc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public d()Ll/oij0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tmc0;->b:Ll/oij0;

    .line 2
    .line 3
    return-object p0
.end method

.method public readTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tmc0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public request()Ll/x1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tmc0;->e:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tmc0;->i:I

    .line 2
    .line 3
    return p0
.end method
