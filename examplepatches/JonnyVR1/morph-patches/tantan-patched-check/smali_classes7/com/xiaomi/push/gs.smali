.class public Lcom/xiaomi/push/gs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/hq;
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/xiaomi/push/hq<",
        "Lcom/xiaomi/push/gs;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final a:Ll/m3r0;

.field private static final a:Ll/z3r0;

.field private static final b:Ll/m3r0;

.field private static final c:Ll/m3r0;

.field private static final d:Ll/m3r0;

.field private static final e:Ll/m3r0;

.field private static final f:Ll/m3r0;

.field private static final g:Ll/m3r0;

.field private static final h:Ll/m3r0;

.field private static final i:Ll/m3r0;

.field private static final j:Ll/m3r0;

.field private static final k:Ll/m3r0;

.field private static final l:Ll/m3r0;

.field private static final m:Ll/m3r0;


# instance fields
.field public a:I

.field public a:J

.field public a:Ljava/lang/String;

.field private a:Ljava/util/BitSet;

.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public a:Z

.field public b:I

.field public b:Ljava/lang/String;

.field public b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public c:Ljava/lang/String;

.field public c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "PushMetaInfo"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/gs;->a:Ll/z3r0;

    .line 9
    .line 10
    new-instance v0, Ll/m3r0;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const-string v2, ""

    .line 14
    .line 15
    const/16 v3, 0xb

    .line 16
    .line 17
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/xiaomi/push/gs;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/16 v1, 0xa

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-direct {v0, v2, v1, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/xiaomi/push/gs;->b:Ll/m3r0;

    .line 31
    .line 32
    new-instance v0, Ll/m3r0;

    .line 33
    .line 34
    const/4 v5, 0x3

    .line 35
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/xiaomi/push/gs;->c:Ll/m3r0;

    .line 39
    .line 40
    new-instance v0, Ll/m3r0;

    .line 41
    .line 42
    const/4 v5, 0x4

    .line 43
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcom/xiaomi/push/gs;->d:Ll/m3r0;

    .line 47
    .line 48
    new-instance v0, Ll/m3r0;

    .line 49
    .line 50
    const/4 v5, 0x5

    .line 51
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/xiaomi/push/gs;->e:Ll/m3r0;

    .line 55
    .line 56
    new-instance v0, Ll/m3r0;

    .line 57
    .line 58
    const/4 v5, 0x6

    .line 59
    const/16 v6, 0x8

    .line 60
    .line 61
    invoke-direct {v0, v2, v6, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/xiaomi/push/gs;->f:Ll/m3r0;

    .line 65
    .line 66
    new-instance v0, Ll/m3r0;

    .line 67
    .line 68
    const/4 v5, 0x7

    .line 69
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 70
    .line 71
    .line 72
    sput-object v0, Lcom/xiaomi/push/gs;->g:Ll/m3r0;

    .line 73
    .line 74
    new-instance v0, Ll/m3r0;

    .line 75
    .line 76
    invoke-direct {v0, v2, v6, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/xiaomi/push/gs;->h:Ll/m3r0;

    .line 80
    .line 81
    new-instance v0, Ll/m3r0;

    .line 82
    .line 83
    const/16 v5, 0x9

    .line 84
    .line 85
    invoke-direct {v0, v2, v6, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 86
    .line 87
    .line 88
    sput-object v0, Lcom/xiaomi/push/gs;->i:Ll/m3r0;

    .line 89
    .line 90
    new-instance v0, Ll/m3r0;

    .line 91
    .line 92
    const/16 v5, 0xd

    .line 93
    .line 94
    invoke-direct {v0, v2, v5, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 95
    .line 96
    .line 97
    sput-object v0, Lcom/xiaomi/push/gs;->j:Ll/m3r0;

    .line 98
    .line 99
    new-instance v0, Ll/m3r0;

    .line 100
    .line 101
    invoke-direct {v0, v2, v5, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 102
    .line 103
    .line 104
    sput-object v0, Lcom/xiaomi/push/gs;->k:Ll/m3r0;

    .line 105
    .line 106
    new-instance v0, Ll/m3r0;

    .line 107
    .line 108
    const/16 v1, 0xc

    .line 109
    .line 110
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 111
    .line 112
    .line 113
    sput-object v0, Lcom/xiaomi/push/gs;->l:Ll/m3r0;

    .line 114
    .line 115
    new-instance v0, Ll/m3r0;

    .line 116
    .line 117
    invoke-direct {v0, v2, v5, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 118
    .line 119
    .line 120
    sput-object v0, Lcom/xiaomi/push/gs;->m:Ll/m3r0;

    .line 121
    .line 122
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    new-instance v0, Ljava/util/BitSet;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    .line 248
    iput-boolean v0, p0, Lcom/xiaomi/push/gs;->a:Z

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/gs;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/BitSet;

    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    iget-wide v0, p1, Lcom/xiaomi/push/gs;->a:J

    .line 33
    .line 34
    iput-wide v0, p0, Lcom/xiaomi/push/gs;->a:J

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p1, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->d()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p1, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->e()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object v0, p1, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 65
    .line 66
    :cond_3
    iget v0, p1, Lcom/xiaomi/push/gs;->a:I

    .line 67
    .line 68
    iput v0, p0, Lcom/xiaomi/push/gs;->a:I

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->g()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-object v0, p1, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget v0, p1, Lcom/xiaomi/push/gs;->b:I

    .line 81
    .line 82
    iput v0, p0, Lcom/xiaomi/push/gs;->b:I

    .line 83
    .line 84
    iget v0, p1, Lcom/xiaomi/push/gs;->c:I

    .line 85
    .line 86
    iput v0, p0, Lcom/xiaomi/push/gs;->c:I

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->j()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_6

    .line 93
    .line 94
    new-instance v0, Ljava/util/HashMap;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v1, p1, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_5

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Ljava/util/Map$Entry;

    .line 120
    .line 121
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Ljava/lang/String;

    .line 126
    .line 127
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    check-cast v2, Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_5
    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 138
    .line 139
    :cond_6
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->k()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_8

    .line 144
    .line 145
    new-instance v0, Ljava/util/HashMap;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 148
    .line 149
    .line 150
    iget-object v1, p1, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 151
    .line 152
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    if-eqz v2, :cond_7

    .line 165
    .line 166
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Ljava/util/Map$Entry;

    .line 171
    .line 172
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    check-cast v3, Ljava/lang/String;

    .line 177
    .line 178
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Ljava/lang/String;

    .line 183
    .line 184
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_7
    iput-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 189
    .line 190
    :cond_8
    iget-boolean v0, p1, Lcom/xiaomi/push/gs;->a:Z

    .line 191
    .line 192
    iput-boolean v0, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->n()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_a

    .line 199
    .line 200
    new-instance v0, Ljava/util/HashMap;

    .line 201
    .line 202
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 203
    .line 204
    .line 205
    iget-object p1, p1, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 206
    .line 207
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_9

    .line 220
    .line 221
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    check-cast v1, Ljava/util/Map$Entry;

    .line 226
    .line 227
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    check-cast v2, Ljava/lang/String;

    .line 232
    .line 233
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    check-cast v1, Ljava/lang/String;

    .line 238
    .line 239
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    goto :goto_2

    .line 243
    :cond_9
    iput-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 244
    .line 245
    :cond_a
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 563
    iget p0, p0, Lcom/xiaomi/push/gs;->a:I

    return p0
.end method

.method public a(Lcom/xiaomi/push/gs;)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->a()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    return v0

    .line 59
    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->b()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->b()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    return v0

    .line 99
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-wide v0, p0, Lcom/xiaomi/push/gs;->a:J

    .line 106
    .line 107
    iget-wide v2, p1, Lcom/xiaomi/push/gs;->a:J

    .line 108
    .line 109
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    return v0

    .line 116
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->c()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->c()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    return v0

    .line 139
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v1, p1, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_6

    .line 154
    .line 155
    return v0

    .line 156
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->d()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->d()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_7

    .line 177
    .line 178
    return v0

    .line 179
    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_8

    .line 194
    .line 195
    return v0

    .line 196
    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->e()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->e()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_9

    .line 217
    .line 218
    return v0

    .line 219
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p1, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-eqz v0, :cond_a

    .line 234
    .line 235
    return v0

    .line 236
    :cond_a
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->f()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->f()Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_b

    .line 257
    .line 258
    return v0

    .line 259
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget v0, p0, Lcom/xiaomi/push/gs;->a:I

    .line 266
    .line 267
    iget v1, p1, Lcom/xiaomi/push/gs;->a:I

    .line 268
    .line 269
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-eqz v0, :cond_c

    .line 274
    .line 275
    return v0

    .line 276
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->g()Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->g()Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_d

    .line 297
    .line 298
    return v0

    .line 299
    :cond_d
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->g()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_e

    .line 314
    .line 315
    return v0

    .line 316
    :cond_e
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->h()Z

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->h()Z

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-eqz v0, :cond_f

    .line 337
    .line 338
    return v0

    .line 339
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->h()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget v0, p0, Lcom/xiaomi/push/gs;->b:I

    .line 346
    .line 347
    iget v1, p1, Lcom/xiaomi/push/gs;->b:I

    .line 348
    .line 349
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_10

    .line 354
    .line 355
    return v0

    .line 356
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->i()Z

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->i()Z

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_11

    .line 377
    .line 378
    return v0

    .line 379
    :cond_11
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->i()Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_12

    .line 384
    .line 385
    iget v0, p0, Lcom/xiaomi/push/gs;->c:I

    .line 386
    .line 387
    iget v1, p1, Lcom/xiaomi/push/gs;->c:I

    .line 388
    .line 389
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-eqz v0, :cond_12

    .line 394
    .line 395
    return v0

    .line 396
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->j()Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->j()Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    if-eqz v0, :cond_13

    .line 417
    .line 418
    return v0

    .line 419
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->j()Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_14

    .line 424
    .line 425
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 426
    .line 427
    iget-object v1, p1, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 428
    .line 429
    invoke-static {v0, v1}, Ll/k3r0;->h(Ljava/util/Map;Ljava/util/Map;)I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_14

    .line 434
    .line 435
    return v0

    .line 436
    :cond_14
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->k()Z

    .line 437
    .line 438
    .line 439
    move-result v0

    .line 440
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->k()Z

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    if-eqz v0, :cond_15

    .line 457
    .line 458
    return v0

    .line 459
    :cond_15
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->k()Z

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    if-eqz v0, :cond_16

    .line 464
    .line 465
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 466
    .line 467
    iget-object v1, p1, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 468
    .line 469
    invoke-static {v0, v1}, Ll/k3r0;->h(Ljava/util/Map;Ljava/util/Map;)I

    .line 470
    .line 471
    .line 472
    move-result v0

    .line 473
    if-eqz v0, :cond_16

    .line 474
    .line 475
    return v0

    .line 476
    :cond_16
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->m()Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->m()Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 493
    .line 494
    .line 495
    move-result v0

    .line 496
    if-eqz v0, :cond_17

    .line 497
    .line 498
    return v0

    .line 499
    :cond_17
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->m()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-eqz v0, :cond_18

    .line 504
    .line 505
    iget-boolean v0, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 506
    .line 507
    iget-boolean v1, p1, Lcom/xiaomi/push/gs;->a:Z

    .line 508
    .line 509
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    if-eqz v0, :cond_18

    .line 514
    .line 515
    return v0

    .line 516
    :cond_18
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->n()Z

    .line 517
    .line 518
    .line 519
    move-result v0

    .line 520
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 521
    .line 522
    .line 523
    move-result-object v0

    .line 524
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->n()Z

    .line 525
    .line 526
    .line 527
    move-result v1

    .line 528
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 533
    .line 534
    .line 535
    move-result v0

    .line 536
    if-eqz v0, :cond_19

    .line 537
    .line 538
    return v0

    .line 539
    :cond_19
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->n()Z

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    if-eqz v0, :cond_1a

    .line 544
    .line 545
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 546
    .line 547
    iget-object p1, p1, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 548
    .line 549
    invoke-static {p0, p1}, Ll/k3r0;->h(Ljava/util/Map;Ljava/util/Map;)I

    .line 550
    .line 551
    .line 552
    move-result p0

    .line 553
    if-eqz p0, :cond_1a

    .line 554
    .line 555
    return p0

    .line 556
    :cond_1a
    const/4 p0, 0x0

    .line 557
    return p0
.end method

.method public a()J
    .locals 2

    .line 561
    iget-wide v0, p0, Lcom/xiaomi/push/gs;->a:J

    return-wide v0
.end method

.method public a()Lcom/xiaomi/push/gs;
    .locals 1

    .line 608
    new-instance v0, Lcom/xiaomi/push/gs;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/gs;-><init>(Lcom/xiaomi/push/gs;)V

    return-object v0
.end method

.method public a(I)Lcom/xiaomi/push/gs;
    .locals 0

    .line 564
    iput p1, p0, Lcom/xiaomi/push/gs;->a:I

    const/4 p1, 0x1

    .line 565
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->b(Z)V

    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/xiaomi/push/gs;
    .locals 0

    .line 559
    iput-object p1, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a(Ljava/util/Map;)Lcom/xiaomi/push/gs;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/xiaomi/push/gs;"
        }
    .end annotation

    .line 570
    iput-object p1, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 558
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    return-object p0
.end method

.method public a()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 569
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 668
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-void

    .line 669
    :cond_0
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'id\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 566
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 567
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 568
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(Ll/w3r0;)V
    .locals 8

    .line 609
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 610
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 611
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_1

    .line 612
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 613
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->b()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 614
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()V

    return-void

    .line 615
    :cond_0
    new-instance p1, Lcom/xiaomi/push/ib;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Required field \'messageTs\' was not found in serialized data! Struct: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw p1

    .line 616
    :cond_1
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/16 v4, 0xd

    const/4 v5, 0x2

    const/16 v6, 0xb

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_0

    .line 617
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_0
    if-ne v1, v4, :cond_3

    .line 618
    invoke-virtual {p1}, Ll/w3r0;->i()Ll/o3r0;

    move-result-object v0

    .line 619
    new-instance v1, Ljava/util/HashMap;

    iget v2, v0, Ll/o3r0;->c:I

    mul-int/2addr v2, v5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 620
    :goto_1
    iget v1, v0, Ll/o3r0;->c:I

    if-ge v3, v1, :cond_2

    .line 621
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v1

    .line 622
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 623
    iget-object v4, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 624
    :cond_2
    invoke-virtual {p1}, Ll/w3r0;->F()V

    goto/16 :goto_4

    .line 625
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_1
    if-ne v1, v5, :cond_4

    .line 626
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 627
    invoke-virtual {p0, v7}, Lcom/xiaomi/push/gs;->e(Z)V

    goto/16 :goto_4

    .line 628
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_2
    if-ne v1, v4, :cond_6

    .line 629
    invoke-virtual {p1}, Ll/w3r0;->i()Ll/o3r0;

    move-result-object v0

    .line 630
    new-instance v1, Ljava/util/HashMap;

    iget v2, v0, Ll/o3r0;->c:I

    mul-int/2addr v2, v5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 631
    :goto_2
    iget v1, v0, Ll/o3r0;->c:I

    if-ge v3, v1, :cond_5

    .line 632
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v1

    .line 633
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 634
    iget-object v4, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 635
    :cond_5
    invoke-virtual {p1}, Ll/w3r0;->F()V

    goto/16 :goto_4

    .line 636
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_3
    if-ne v1, v4, :cond_8

    .line 637
    invoke-virtual {p1}, Ll/w3r0;->i()Ll/o3r0;

    move-result-object v0

    .line 638
    new-instance v1, Ljava/util/HashMap;

    iget v2, v0, Ll/o3r0;->c:I

    mul-int/2addr v2, v5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 639
    :goto_3
    iget v1, v0, Ll/o3r0;->c:I

    if-ge v3, v1, :cond_7

    .line 640
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v1

    .line 641
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 642
    iget-object v4, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 643
    :cond_7
    invoke-virtual {p1}, Ll/w3r0;->F()V

    goto/16 :goto_4

    .line 644
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_4
    if-ne v1, v2, :cond_9

    .line 645
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gs;->c:I

    .line 646
    invoke-virtual {p0, v7}, Lcom/xiaomi/push/gs;->d(Z)V

    goto/16 :goto_4

    .line 647
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_5
    if-ne v1, v2, :cond_a

    .line 648
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gs;->b:I

    .line 649
    invoke-virtual {p0, v7}, Lcom/xiaomi/push/gs;->c(Z)V

    goto/16 :goto_4

    .line 650
    :cond_a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_4

    :pswitch_6
    if-ne v1, v6, :cond_b

    .line 651
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    goto :goto_4

    .line 652
    :cond_b
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_7
    if-ne v1, v2, :cond_c

    .line 653
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/gs;->a:I

    .line 654
    invoke-virtual {p0, v7}, Lcom/xiaomi/push/gs;->b(Z)V

    goto :goto_4

    .line 655
    :cond_c
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_8
    if-ne v1, v6, :cond_d

    .line 656
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    goto :goto_4

    .line 657
    :cond_d
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_9
    if-ne v1, v6, :cond_e

    .line 658
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    goto :goto_4

    .line 659
    :cond_e
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_a
    if-ne v1, v6, :cond_f

    .line 660
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    goto :goto_4

    .line 661
    :cond_f
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_b
    const/16 v0, 0xa

    if-ne v1, v0, :cond_10

    .line 662
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/gs;->a:J

    .line 663
    invoke-virtual {p0, v7}, Lcom/xiaomi/push/gs;->a(Z)V

    goto :goto_4

    .line 664
    :cond_10
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_4

    :pswitch_c
    if-ne v1, v6, :cond_11

    .line 665
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    goto :goto_4

    .line 666
    :cond_11
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 667
    :goto_4
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Z)V
    .locals 1

    .line 562
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 560
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/xiaomi/push/gs;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 571
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()Z

    move-result v1

    .line 572
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_26

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 573
    :cond_2
    iget-object v1, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 574
    :cond_3
    iget-wide v1, p0, Lcom/xiaomi/push/gs;->a:J

    iget-wide v3, p1, Lcom/xiaomi/push/gs;->a:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4

    return v0

    .line 575
    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->c()Z

    move-result v1

    .line 576
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->c()Z

    move-result v2

    if-nez v1, :cond_5

    if-eqz v2, :cond_7

    :cond_5
    if-eqz v1, :cond_26

    if-nez v2, :cond_6

    goto/16 :goto_0

    .line 577
    :cond_6
    iget-object v1, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v0

    .line 578
    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->d()Z

    move-result v1

    .line 579
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->d()Z

    move-result v2

    if-nez v1, :cond_8

    if-eqz v2, :cond_a

    :cond_8
    if-eqz v1, :cond_26

    if-nez v2, :cond_9

    goto/16 :goto_0

    .line 580
    :cond_9
    iget-object v1, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v0

    .line 581
    :cond_a
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->e()Z

    move-result v1

    .line 582
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->e()Z

    move-result v2

    if-nez v1, :cond_b

    if-eqz v2, :cond_d

    :cond_b
    if-eqz v1, :cond_26

    if-nez v2, :cond_c

    goto/16 :goto_0

    .line 583
    :cond_c
    iget-object v1, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v0

    .line 584
    :cond_d
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->f()Z

    move-result v1

    .line 585
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->f()Z

    move-result v2

    if-nez v1, :cond_e

    if-eqz v2, :cond_10

    :cond_e
    if-eqz v1, :cond_26

    if-nez v2, :cond_f

    goto/16 :goto_0

    .line 586
    :cond_f
    iget v1, p0, Lcom/xiaomi/push/gs;->a:I

    iget v2, p1, Lcom/xiaomi/push/gs;->a:I

    if-eq v1, v2, :cond_10

    return v0

    .line 587
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->g()Z

    move-result v1

    .line 588
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->g()Z

    move-result v2

    if-nez v1, :cond_11

    if-eqz v2, :cond_13

    :cond_11
    if-eqz v1, :cond_26

    if-nez v2, :cond_12

    goto/16 :goto_0

    .line 589
    :cond_12
    iget-object v1, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    return v0

    .line 590
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->h()Z

    move-result v1

    .line 591
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->h()Z

    move-result v2

    if-nez v1, :cond_14

    if-eqz v2, :cond_16

    :cond_14
    if-eqz v1, :cond_26

    if-nez v2, :cond_15

    goto/16 :goto_0

    .line 592
    :cond_15
    iget v1, p0, Lcom/xiaomi/push/gs;->b:I

    iget v2, p1, Lcom/xiaomi/push/gs;->b:I

    if-eq v1, v2, :cond_16

    return v0

    .line 593
    :cond_16
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->i()Z

    move-result v1

    .line 594
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->i()Z

    move-result v2

    if-nez v1, :cond_17

    if-eqz v2, :cond_19

    :cond_17
    if-eqz v1, :cond_26

    if-nez v2, :cond_18

    goto/16 :goto_0

    .line 595
    :cond_18
    iget v1, p0, Lcom/xiaomi/push/gs;->c:I

    iget v2, p1, Lcom/xiaomi/push/gs;->c:I

    if-eq v1, v2, :cond_19

    return v0

    .line 596
    :cond_19
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->j()Z

    move-result v1

    .line 597
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->j()Z

    move-result v2

    if-nez v1, :cond_1a

    if-eqz v2, :cond_1c

    :cond_1a
    if-eqz v1, :cond_26

    if-nez v2, :cond_1b

    goto :goto_0

    .line 598
    :cond_1b
    iget-object v1, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    return v0

    .line 599
    :cond_1c
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->k()Z

    move-result v1

    .line 600
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->k()Z

    move-result v2

    if-nez v1, :cond_1d

    if-eqz v2, :cond_1f

    :cond_1d
    if-eqz v1, :cond_26

    if-nez v2, :cond_1e

    goto :goto_0

    .line 601
    :cond_1e
    iget-object v1, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    iget-object v2, p1, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    return v0

    .line 602
    :cond_1f
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->m()Z

    move-result v1

    .line 603
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->m()Z

    move-result v2

    if-nez v1, :cond_20

    if-eqz v2, :cond_22

    :cond_20
    if-eqz v1, :cond_26

    if-nez v2, :cond_21

    goto :goto_0

    .line 604
    :cond_21
    iget-boolean v1, p0, Lcom/xiaomi/push/gs;->a:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/gs;->a:Z

    if-eq v1, v2, :cond_22

    return v0

    .line 605
    :cond_22
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->n()Z

    move-result v1

    .line 606
    invoke-virtual {p1}, Lcom/xiaomi/push/gs;->n()Z

    move-result v2

    if-nez v1, :cond_23

    if-eqz v2, :cond_25

    :cond_23
    if-eqz v1, :cond_26

    if-nez v2, :cond_24

    goto :goto_0

    .line 607
    :cond_24
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    iget-object p1, p1, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    return v0

    :cond_25
    const/4 p0, 0x1

    return p0

    :cond_26
    :goto_0
    return v0
.end method

.method public b()I
    .locals 0

    .line 447
    iget p0, p0, Lcom/xiaomi/push/gs;->b:I

    return p0
.end method

.method public b(I)Lcom/xiaomi/push/gs;
    .locals 0

    .line 448
    iput p1, p0, Lcom/xiaomi/push/gs;->b:I

    const/4 p1, 0x1

    .line 449
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->c(Z)V

    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/xiaomi/push/gs;
    .locals 0

    .line 445
    iput-object p1, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 444
    iget-object p0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    return-object p0
.end method

.method public b()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 453
    iget-object p0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 450
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 451
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 452
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public b(Ll/w3r0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/gs;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/xiaomi/push/gs;->a:Ll/m3r0;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 24
    .line 25
    .line 26
    :cond_0
    sget-object v0, Lcom/xiaomi/push/gs;->b:Ll/m3r0;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 29
    .line 30
    .line 31
    iget-wide v0, p0, Lcom/xiaomi/push/gs;->a:J

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->c()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Lcom/xiaomi/push/gs;->c:Ll/m3r0;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->d()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    sget-object v0, Lcom/xiaomi/push/gs;->d:Ll/m3r0;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->e()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    sget-object v0, Lcom/xiaomi/push/gs;->e:Ll/m3r0;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 106
    .line 107
    .line 108
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->f()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    sget-object v0, Lcom/xiaomi/push/gs;->f:Ll/m3r0;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 117
    .line 118
    .line 119
    iget v0, p0, Lcom/xiaomi/push/gs;->a:I

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 125
    .line 126
    .line 127
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->g()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_5

    .line 136
    .line 137
    sget-object v0, Lcom/xiaomi/push/gs;->g:Ll/m3r0;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 148
    .line 149
    .line 150
    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->h()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    sget-object v0, Lcom/xiaomi/push/gs;->h:Ll/m3r0;

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 159
    .line 160
    .line 161
    iget v0, p0, Lcom/xiaomi/push/gs;->b:I

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 167
    .line 168
    .line 169
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->i()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_7

    .line 174
    .line 175
    sget-object v0, Lcom/xiaomi/push/gs;->i:Ll/m3r0;

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 178
    .line 179
    .line 180
    iget v0, p0, Lcom/xiaomi/push/gs;->c:I

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 186
    .line 187
    .line 188
    :cond_7
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 189
    .line 190
    const/16 v1, 0xb

    .line 191
    .line 192
    if-eqz v0, :cond_9

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->j()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_9

    .line 199
    .line 200
    sget-object v0, Lcom/xiaomi/push/gs;->j:Ll/m3r0;

    .line 201
    .line 202
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 203
    .line 204
    .line 205
    new-instance v0, Ll/o3r0;

    .line 206
    .line 207
    iget-object v2, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 208
    .line 209
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    invoke-direct {v0, v1, v1, v2}, Ll/o3r0;-><init>(BBI)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1, v0}, Ll/w3r0;->u(Ll/o3r0;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 220
    .line 221
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    if-eqz v2, :cond_8

    .line 234
    .line 235
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Ljava/util/Map$Entry;

    .line 240
    .line 241
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    check-cast v3, Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {p1, v3}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    check-cast v2, Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {p1, v2}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_8
    invoke-virtual {p1}, Ll/w3r0;->B()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 264
    .line 265
    .line 266
    :cond_9
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 267
    .line 268
    if-eqz v0, :cond_b

    .line 269
    .line 270
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->k()Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-eqz v0, :cond_b

    .line 275
    .line 276
    sget-object v0, Lcom/xiaomi/push/gs;->k:Ll/m3r0;

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 279
    .line 280
    .line 281
    new-instance v0, Ll/o3r0;

    .line 282
    .line 283
    iget-object v2, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 284
    .line 285
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    invoke-direct {v0, v1, v1, v2}, Ll/o3r0;-><init>(BBI)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1, v0}, Ll/w3r0;->u(Ll/o3r0;)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 296
    .line 297
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    if-eqz v2, :cond_a

    .line 310
    .line 311
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    check-cast v2, Ljava/util/Map$Entry;

    .line 316
    .line 317
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    check-cast v3, Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {p1, v3}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    check-cast v2, Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {p1, v2}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    goto :goto_1

    .line 336
    :cond_a
    invoke-virtual {p1}, Ll/w3r0;->B()V

    .line 337
    .line 338
    .line 339
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 340
    .line 341
    .line 342
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->m()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_c

    .line 347
    .line 348
    sget-object v0, Lcom/xiaomi/push/gs;->l:Ll/m3r0;

    .line 349
    .line 350
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 351
    .line 352
    .line 353
    iget-boolean v0, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 354
    .line 355
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 359
    .line 360
    .line 361
    :cond_c
    iget-object v0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 362
    .line 363
    if-eqz v0, :cond_e

    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->n()Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-eqz v0, :cond_e

    .line 370
    .line 371
    sget-object v0, Lcom/xiaomi/push/gs;->m:Ll/m3r0;

    .line 372
    .line 373
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 374
    .line 375
    .line 376
    new-instance v0, Ll/o3r0;

    .line 377
    .line 378
    iget-object v2, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 379
    .line 380
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 381
    .line 382
    .line 383
    move-result v2

    .line 384
    invoke-direct {v0, v1, v1, v2}, Ll/o3r0;-><init>(BBI)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {p1, v0}, Ll/w3r0;->u(Ll/o3r0;)V

    .line 388
    .line 389
    .line 390
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 391
    .line 392
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-eqz v0, :cond_d

    .line 405
    .line 406
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Ljava/util/Map$Entry;

    .line 411
    .line 412
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    check-cast v1, Ljava/lang/String;

    .line 417
    .line 418
    invoke-virtual {p1, v1}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    check-cast v0, Ljava/lang/String;

    .line 426
    .line 427
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    goto :goto_2

    .line 431
    :cond_d
    invoke-virtual {p1}, Ll/w3r0;->B()V

    .line 432
    .line 433
    .line 434
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 435
    .line 436
    .line 437
    :cond_e
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 441
    .line 442
    .line 443
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 446
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 1

    .line 454
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    return p0
.end method

.method public c()I
    .locals 0

    .line 12
    iget p0, p0, Lcom/xiaomi/push/gs;->c:I

    return p0
.end method

.method public c(I)Lcom/xiaomi/push/gs;
    .locals 0

    .line 13
    iput p1, p0, Lcom/xiaomi/push/gs;->c:I

    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->d(Z)V

    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/xiaomi/push/gs;
    .locals 0

    .line 10
    iput-object p1, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    return-object p0
.end method

.method public c(Z)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/xiaomi/push/gs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->a(Lcom/xiaomi/push/gs;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ljava/lang/String;)Lcom/xiaomi/push/gs;
    .locals 0

    .line 10
    iput-object p1, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    return-object p0
.end method

.method public d(Z)V
    .locals 1

    .line 11
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public e(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/xiaomi/push/gs;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/gs;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gs;->a(Lcom/xiaomi/push/gs;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    return v0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PushMetaInfo(id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/xiaomi/push/gs;->a:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "null"

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {v1}, Lcom/xiaomi/push/service/aj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string v1, ", "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, "messageTs:"

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-wide v3, p0, Lcom/xiaomi/push/gs;->a:J

    .line 36
    .line 37
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->c()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v3, "topic:"

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/xiaomi/push/gs;->b:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v3, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->d()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_4

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v3, "title:"

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Lcom/xiaomi/push/gs;->c:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v3, :cond_3

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->e()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_6

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v3, "description:"

    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v3, p0, Lcom/xiaomi/push/gs;->d:Ljava/lang/String;

    .line 105
    .line 106
    if-nez v3, :cond_5

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    :cond_6
    :goto_3
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->f()Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_7

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v3, "notifyType:"

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget v3, p0, Lcom/xiaomi/push/gs;->a:I

    .line 130
    .line 131
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->g()Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_9

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v3, "url:"

    .line 144
    .line 145
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Lcom/xiaomi/push/gs;->e:Ljava/lang/String;

    .line 149
    .line 150
    if-nez v3, :cond_8

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    :cond_9
    :goto_4
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->h()Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-eqz v3, :cond_a

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v3, "passThrough:"

    .line 169
    .line 170
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget v3, p0, Lcom/xiaomi/push/gs;->b:I

    .line 174
    .line 175
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    :cond_a
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->i()Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-eqz v3, :cond_b

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v3, "notifyId:"

    .line 188
    .line 189
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget v3, p0, Lcom/xiaomi/push/gs;->c:I

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->j()Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-eqz v3, :cond_d

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    const-string v3, "extra:"

    .line 207
    .line 208
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    iget-object v3, p0, Lcom/xiaomi/push/gs;->a:Ljava/util/Map;

    .line 212
    .line 213
    if-nez v3, :cond_c

    .line 214
    .line 215
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_c
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    :cond_d
    :goto_5
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->k()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_f

    .line 227
    .line 228
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v3, "internal:"

    .line 232
    .line 233
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget-object v3, p0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    .line 237
    .line 238
    if-nez v3, :cond_e

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    goto :goto_6

    .line 244
    :cond_e
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    :cond_f
    :goto_6
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->m()Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-eqz v3, :cond_10

    .line 252
    .line 253
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    const-string v3, "ignoreRegInfo:"

    .line 257
    .line 258
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget-boolean v3, p0, Lcom/xiaomi/push/gs;->a:Z

    .line 262
    .line 263
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/gs;->n()Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_12

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    const-string v1, "apsProperFields:"

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    iget-object p0, p0, Lcom/xiaomi/push/gs;->c:Ljava/util/Map;

    .line 281
    .line 282
    if-nez p0, :cond_11

    .line 283
    .line 284
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    goto :goto_7

    .line 288
    :cond_11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    :cond_12
    :goto_7
    const-string p0, ")"

    .line 292
    .line 293
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    return-object p0
.end method
