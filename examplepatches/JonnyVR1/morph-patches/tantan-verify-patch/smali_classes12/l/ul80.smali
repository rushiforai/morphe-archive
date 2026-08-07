.class public Ll/ul80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private d:[Ll/n1j;


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


# virtual methods
.method public a()Ll/x1d0;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ul80;->d:[Ll/n1j;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    new-instance v0, Ll/ku10$a;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/ku10$a;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Ll/ku10;->j:Ll/e7y;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Ljava/lang/String;

    .line 52
    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v5, "form-data; name=\""

    .line 56
    .line 57
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v5, "\""

    .line 64
    .line 65
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const-string v5, "Content-Disposition"

    .line 73
    .line 74
    filled-new-array {v5, v4}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-static {v4}, Ll/e0l;->j([Ljava/lang/String;)Ll/e0l;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v5, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 83
    .line 84
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v2, v3}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v0, v4, v3}, Ll/ku10$a;->c(Ll/e0l;Ll/z1d0;)Ll/ku10$a;

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iget-object v1, p0, Ll/ul80;->d:[Ll/n1j;

    .line 99
    .line 100
    array-length v3, v1

    .line 101
    if-gtz v3, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/ku10$a;->e()Ll/ku10;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    goto :goto_3

    .line 108
    :cond_2
    const/4 p0, 0x0

    .line 109
    aget-object p0, v1, p0

    .line 110
    .line 111
    throw v2

    .line 112
    :cond_3
    :goto_1
    new-instance v0, Ll/l1j$a;

    .line 113
    .line 114
    invoke-direct {v0}, Ll/l1j$a;-><init>()V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 118
    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    iget-object v1, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_4

    .line 142
    .line 143
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Ljava/lang/String;

    .line 148
    .line 149
    iget-object v3, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 150
    .line 151
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v2, v3}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_4
    invoke-virtual {v0}, Ll/l1j$a;->b()Ll/l1j;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    :goto_3
    new-instance v1, Ll/e0l$a;

    .line 166
    .line 167
    invoke-direct {v1}, Ll/e0l$a;-><init>()V

    .line 168
    .line 169
    .line 170
    iget-object v2, p0, Ll/ul80;->b:Ljava/util/Map;

    .line 171
    .line 172
    if-eqz v2, :cond_5

    .line 173
    .line 174
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-nez v2, :cond_5

    .line 179
    .line 180
    iget-object v2, p0, Ll/ul80;->b:Ljava/util/Map;

    .line 181
    .line 182
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-eqz v3, :cond_5

    .line 195
    .line 196
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Ljava/lang/String;

    .line 201
    .line 202
    iget-object v4, p0, Ll/ul80;->b:Ljava/util/Map;

    .line 203
    .line 204
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    check-cast v4, Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v1, v3, v4}, Ll/e0l$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/e0l$a;

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_5
    new-instance v2, Ll/x1d0$a;

    .line 215
    .line 216
    invoke-direct {v2}, Ll/x1d0$a;-><init>()V

    .line 217
    .line 218
    .line 219
    iget-object p0, p0, Ll/ul80;->a:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v2, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {v1}, Ll/e0l$a;->e()Ll/e0l;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {p0, v1}, Ll/x1d0$a;->i(Ll/e0l;)Ll/x1d0$a;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    return-object p0
.end method

.method public varargs b([Ll/n1j;)Ll/ul80;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ul80;->d:[Ll/n1j;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/util/Map;)Ll/ul80;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/ul80;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ul80;->b:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/util/Map;)Ll/ul80;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/ul80;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ul80;->c:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/ul80;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ul80;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
