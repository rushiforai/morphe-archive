.class public Lcom/xiaomi/push/hf;
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
        "Lcom/xiaomi/push/hf;",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final A:Ll/m3r0;

.field private static final B:Ll/m3r0;

.field private static final C:Ll/m3r0;

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

.field private static final n:Ll/m3r0;

.field private static final o:Ll/m3r0;

.field private static final p:Ll/m3r0;

.field private static final q:Ll/m3r0;

.field private static final r:Ll/m3r0;

.field private static final s:Ll/m3r0;

.field private static final t:Ll/m3r0;

.field private static final u:Ll/m3r0;

.field private static final v:Ll/m3r0;

.field private static final w:Ll/m3r0;

.field private static final x:Ll/m3r0;

.field private static final y:Ll/m3r0;

.field private static final z:Ll/m3r0;


# instance fields
.field public a:I

.field public a:J

.field public a:Lcom/xiaomi/push/gt;

.field public a:Lcom/xiaomi/push/gu;

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

.field public b:J

.field public b:Ljava/lang/String;

.field public b:Z

.field public c:I

.field public c:Ljava/lang/String;

.field public c:Z

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "XmPushActionRegistration"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/hf;->a:Ll/z3r0;

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
    sput-object v0, Lcom/xiaomi/push/hf;->a:Ll/m3r0;

    .line 21
    .line 22
    new-instance v0, Ll/m3r0;

    .line 23
    .line 24
    const/16 v1, 0xc

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    invoke-direct {v0, v2, v1, v4}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/xiaomi/push/hf;->b:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hf;->c:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hf;->d:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hf;->e:Ll/m3r0;

    .line 55
    .line 56
    new-instance v0, Ll/m3r0;

    .line 57
    .line 58
    const/4 v5, 0x6

    .line 59
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/xiaomi/push/hf;->f:Ll/m3r0;

    .line 63
    .line 64
    new-instance v0, Ll/m3r0;

    .line 65
    .line 66
    const/4 v5, 0x7

    .line 67
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/xiaomi/push/hf;->g:Ll/m3r0;

    .line 71
    .line 72
    new-instance v0, Ll/m3r0;

    .line 73
    .line 74
    const/16 v5, 0x8

    .line 75
    .line 76
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/xiaomi/push/hf;->h:Ll/m3r0;

    .line 80
    .line 81
    new-instance v0, Ll/m3r0;

    .line 82
    .line 83
    const/16 v6, 0x9

    .line 84
    .line 85
    invoke-direct {v0, v2, v3, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 86
    .line 87
    .line 88
    sput-object v0, Lcom/xiaomi/push/hf;->i:Ll/m3r0;

    .line 89
    .line 90
    new-instance v0, Ll/m3r0;

    .line 91
    .line 92
    const/16 v6, 0xa

    .line 93
    .line 94
    invoke-direct {v0, v2, v3, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 95
    .line 96
    .line 97
    sput-object v0, Lcom/xiaomi/push/hf;->j:Ll/m3r0;

    .line 98
    .line 99
    new-instance v0, Ll/m3r0;

    .line 100
    .line 101
    invoke-direct {v0, v2, v3, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 102
    .line 103
    .line 104
    sput-object v0, Lcom/xiaomi/push/hf;->k:Ll/m3r0;

    .line 105
    .line 106
    new-instance v0, Ll/m3r0;

    .line 107
    .line 108
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 109
    .line 110
    .line 111
    sput-object v0, Lcom/xiaomi/push/hf;->l:Ll/m3r0;

    .line 112
    .line 113
    new-instance v0, Ll/m3r0;

    .line 114
    .line 115
    const/16 v1, 0xd

    .line 116
    .line 117
    invoke-direct {v0, v2, v5, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 118
    .line 119
    .line 120
    sput-object v0, Lcom/xiaomi/push/hf;->m:Ll/m3r0;

    .line 121
    .line 122
    new-instance v0, Ll/m3r0;

    .line 123
    .line 124
    const/16 v7, 0xe

    .line 125
    .line 126
    invoke-direct {v0, v2, v5, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 127
    .line 128
    .line 129
    sput-object v0, Lcom/xiaomi/push/hf;->n:Ll/m3r0;

    .line 130
    .line 131
    new-instance v0, Ll/m3r0;

    .line 132
    .line 133
    const/16 v7, 0xf

    .line 134
    .line 135
    invoke-direct {v0, v2, v3, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 136
    .line 137
    .line 138
    sput-object v0, Lcom/xiaomi/push/hf;->o:Ll/m3r0;

    .line 139
    .line 140
    new-instance v0, Ll/m3r0;

    .line 141
    .line 142
    const/16 v7, 0x10

    .line 143
    .line 144
    invoke-direct {v0, v2, v3, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lcom/xiaomi/push/hf;->p:Ll/m3r0;

    .line 148
    .line 149
    new-instance v0, Ll/m3r0;

    .line 150
    .line 151
    const/16 v7, 0x11

    .line 152
    .line 153
    invoke-direct {v0, v2, v3, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 154
    .line 155
    .line 156
    sput-object v0, Lcom/xiaomi/push/hf;->q:Ll/m3r0;

    .line 157
    .line 158
    new-instance v0, Ll/m3r0;

    .line 159
    .line 160
    const/16 v7, 0x12

    .line 161
    .line 162
    invoke-direct {v0, v2, v3, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 163
    .line 164
    .line 165
    sput-object v0, Lcom/xiaomi/push/hf;->r:Ll/m3r0;

    .line 166
    .line 167
    new-instance v0, Ll/m3r0;

    .line 168
    .line 169
    const/16 v7, 0x13

    .line 170
    .line 171
    invoke-direct {v0, v2, v5, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 172
    .line 173
    .line 174
    sput-object v0, Lcom/xiaomi/push/hf;->s:Ll/m3r0;

    .line 175
    .line 176
    new-instance v0, Ll/m3r0;

    .line 177
    .line 178
    const/16 v7, 0x14

    .line 179
    .line 180
    invoke-direct {v0, v2, v5, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 181
    .line 182
    .line 183
    sput-object v0, Lcom/xiaomi/push/hf;->t:Ll/m3r0;

    .line 184
    .line 185
    new-instance v0, Ll/m3r0;

    .line 186
    .line 187
    const/16 v5, 0x15

    .line 188
    .line 189
    invoke-direct {v0, v2, v4, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 190
    .line 191
    .line 192
    sput-object v0, Lcom/xiaomi/push/hf;->u:Ll/m3r0;

    .line 193
    .line 194
    new-instance v0, Ll/m3r0;

    .line 195
    .line 196
    const/16 v5, 0x16

    .line 197
    .line 198
    invoke-direct {v0, v2, v6, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 199
    .line 200
    .line 201
    sput-object v0, Lcom/xiaomi/push/hf;->v:Ll/m3r0;

    .line 202
    .line 203
    new-instance v0, Ll/m3r0;

    .line 204
    .line 205
    const/16 v5, 0x17

    .line 206
    .line 207
    invoke-direct {v0, v2, v6, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 208
    .line 209
    .line 210
    sput-object v0, Lcom/xiaomi/push/hf;->w:Ll/m3r0;

    .line 211
    .line 212
    new-instance v0, Ll/m3r0;

    .line 213
    .line 214
    const/16 v5, 0x18

    .line 215
    .line 216
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 217
    .line 218
    .line 219
    sput-object v0, Lcom/xiaomi/push/hf;->x:Ll/m3r0;

    .line 220
    .line 221
    new-instance v0, Ll/m3r0;

    .line 222
    .line 223
    const/16 v5, 0x19

    .line 224
    .line 225
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/xiaomi/push/hf;->y:Ll/m3r0;

    .line 229
    .line 230
    new-instance v0, Ll/m3r0;

    .line 231
    .line 232
    const/16 v5, 0x1a

    .line 233
    .line 234
    invoke-direct {v0, v2, v4, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 235
    .line 236
    .line 237
    sput-object v0, Lcom/xiaomi/push/hf;->z:Ll/m3r0;

    .line 238
    .line 239
    new-instance v0, Ll/m3r0;

    .line 240
    .line 241
    const/16 v5, 0x64

    .line 242
    .line 243
    invoke-direct {v0, v2, v1, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 244
    .line 245
    .line 246
    sput-object v0, Lcom/xiaomi/push/hf;->A:Ll/m3r0;

    .line 247
    .line 248
    new-instance v0, Ll/m3r0;

    .line 249
    .line 250
    const/16 v1, 0x65

    .line 251
    .line 252
    invoke-direct {v0, v2, v4, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 253
    .line 254
    .line 255
    sput-object v0, Lcom/xiaomi/push/hf;->B:Ll/m3r0;

    .line 256
    .line 257
    new-instance v0, Ll/m3r0;

    .line 258
    .line 259
    const/16 v1, 0x66

    .line 260
    .line 261
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 262
    .line 263
    .line 264
    sput-object v0, Lcom/xiaomi/push/hf;->C:Ll/m3r0;

    .line 265
    .line 266
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/BitSet;

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->a:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->c:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->b:Z

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

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

.method public B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

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

.method public a(Lcom/xiaomi/push/hf;)I
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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->a()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->b()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->b()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 106
    .line 107
    iget-object v1, p1, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->c()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->c()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object v0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v1, p1, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->d()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->d()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->e()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->e()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-object v0, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p1, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->f()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->f()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget-object v0, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v1, p1, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->g()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->g()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->g()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->h()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->h()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->h()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object v0, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    .line 346
    .line 347
    iget-object v1, p1, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    .line 348
    .line 349
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->i()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->i()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->i()Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_12

    .line 384
    .line 385
    iget-object v0, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    .line 386
    .line 387
    iget-object v1, p1, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    .line 388
    .line 389
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->j()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->j()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->j()Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_14

    .line 424
    .line 425
    iget-object v0, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    .line 426
    .line 427
    iget-object v1, p1, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    .line 428
    .line 429
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->k()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->k()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->k()Z

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    if-eqz v0, :cond_16

    .line 464
    .line 465
    iget-object v0, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    .line 466
    .line 467
    iget-object v1, p1, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    .line 468
    .line 469
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->l()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->l()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->l()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-eqz v0, :cond_18

    .line 504
    .line 505
    iget-object v0, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    .line 506
    .line 507
    iget-object v1, p1, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    .line 508
    .line 509
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->m()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->m()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->m()Z

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    if-eqz v0, :cond_1a

    .line 544
    .line 545
    iget v0, p0, Lcom/xiaomi/push/hf;->a:I

    .line 546
    .line 547
    iget v1, p1, Lcom/xiaomi/push/hf;->a:I

    .line 548
    .line 549
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 550
    .line 551
    .line 552
    move-result v0

    .line 553
    if-eqz v0, :cond_1a

    .line 554
    .line 555
    return v0

    .line 556
    :cond_1a
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->n()Z

    .line 557
    .line 558
    .line 559
    move-result v0

    .line 560
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->n()Z

    .line 565
    .line 566
    .line 567
    move-result v1

    .line 568
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 569
    .line 570
    .line 571
    move-result-object v1

    .line 572
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 573
    .line 574
    .line 575
    move-result v0

    .line 576
    if-eqz v0, :cond_1b

    .line 577
    .line 578
    return v0

    .line 579
    :cond_1b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->n()Z

    .line 580
    .line 581
    .line 582
    move-result v0

    .line 583
    if-eqz v0, :cond_1c

    .line 584
    .line 585
    iget v0, p0, Lcom/xiaomi/push/hf;->b:I

    .line 586
    .line 587
    iget v1, p1, Lcom/xiaomi/push/hf;->b:I

    .line 588
    .line 589
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 590
    .line 591
    .line 592
    move-result v0

    .line 593
    if-eqz v0, :cond_1c

    .line 594
    .line 595
    return v0

    .line 596
    :cond_1c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->o()Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->o()Z

    .line 605
    .line 606
    .line 607
    move-result v1

    .line 608
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 609
    .line 610
    .line 611
    move-result-object v1

    .line 612
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 613
    .line 614
    .line 615
    move-result v0

    .line 616
    if-eqz v0, :cond_1d

    .line 617
    .line 618
    return v0

    .line 619
    :cond_1d
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->o()Z

    .line 620
    .line 621
    .line 622
    move-result v0

    .line 623
    if-eqz v0, :cond_1e

    .line 624
    .line 625
    iget-object v0, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    .line 626
    .line 627
    iget-object v1, p1, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    .line 628
    .line 629
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    .line 631
    .line 632
    move-result v0

    .line 633
    if-eqz v0, :cond_1e

    .line 634
    .line 635
    return v0

    .line 636
    :cond_1e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->p()Z

    .line 637
    .line 638
    .line 639
    move-result v0

    .line 640
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 641
    .line 642
    .line 643
    move-result-object v0

    .line 644
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->p()Z

    .line 645
    .line 646
    .line 647
    move-result v1

    .line 648
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 649
    .line 650
    .line 651
    move-result-object v1

    .line 652
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 653
    .line 654
    .line 655
    move-result v0

    .line 656
    if-eqz v0, :cond_1f

    .line 657
    .line 658
    return v0

    .line 659
    :cond_1f
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->p()Z

    .line 660
    .line 661
    .line 662
    move-result v0

    .line 663
    if-eqz v0, :cond_20

    .line 664
    .line 665
    iget-object v0, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    .line 666
    .line 667
    iget-object v1, p1, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    .line 668
    .line 669
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    .line 671
    .line 672
    move-result v0

    .line 673
    if-eqz v0, :cond_20

    .line 674
    .line 675
    return v0

    .line 676
    :cond_20
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->q()Z

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 681
    .line 682
    .line 683
    move-result-object v0

    .line 684
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->q()Z

    .line 685
    .line 686
    .line 687
    move-result v1

    .line 688
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 689
    .line 690
    .line 691
    move-result-object v1

    .line 692
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 693
    .line 694
    .line 695
    move-result v0

    .line 696
    if-eqz v0, :cond_21

    .line 697
    .line 698
    return v0

    .line 699
    :cond_21
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->q()Z

    .line 700
    .line 701
    .line 702
    move-result v0

    .line 703
    if-eqz v0, :cond_22

    .line 704
    .line 705
    iget-object v0, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    .line 706
    .line 707
    iget-object v1, p1, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    .line 708
    .line 709
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    .line 711
    .line 712
    move-result v0

    .line 713
    if-eqz v0, :cond_22

    .line 714
    .line 715
    return v0

    .line 716
    :cond_22
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->r()Z

    .line 717
    .line 718
    .line 719
    move-result v0

    .line 720
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 721
    .line 722
    .line 723
    move-result-object v0

    .line 724
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->r()Z

    .line 725
    .line 726
    .line 727
    move-result v1

    .line 728
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 729
    .line 730
    .line 731
    move-result-object v1

    .line 732
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 733
    .line 734
    .line 735
    move-result v0

    .line 736
    if-eqz v0, :cond_23

    .line 737
    .line 738
    return v0

    .line 739
    :cond_23
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->r()Z

    .line 740
    .line 741
    .line 742
    move-result v0

    .line 743
    if-eqz v0, :cond_24

    .line 744
    .line 745
    iget-object v0, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    .line 746
    .line 747
    iget-object v1, p1, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    .line 748
    .line 749
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 750
    .line 751
    .line 752
    move-result v0

    .line 753
    if-eqz v0, :cond_24

    .line 754
    .line 755
    return v0

    .line 756
    :cond_24
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->s()Z

    .line 757
    .line 758
    .line 759
    move-result v0

    .line 760
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 761
    .line 762
    .line 763
    move-result-object v0

    .line 764
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->s()Z

    .line 765
    .line 766
    .line 767
    move-result v1

    .line 768
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 769
    .line 770
    .line 771
    move-result-object v1

    .line 772
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 773
    .line 774
    .line 775
    move-result v0

    .line 776
    if-eqz v0, :cond_25

    .line 777
    .line 778
    return v0

    .line 779
    :cond_25
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->s()Z

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    if-eqz v0, :cond_26

    .line 784
    .line 785
    iget v0, p0, Lcom/xiaomi/push/hf;->c:I

    .line 786
    .line 787
    iget v1, p1, Lcom/xiaomi/push/hf;->c:I

    .line 788
    .line 789
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    if-eqz v0, :cond_26

    .line 794
    .line 795
    return v0

    .line 796
    :cond_26
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->t()Z

    .line 797
    .line 798
    .line 799
    move-result v0

    .line 800
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 801
    .line 802
    .line 803
    move-result-object v0

    .line 804
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->t()Z

    .line 805
    .line 806
    .line 807
    move-result v1

    .line 808
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 809
    .line 810
    .line 811
    move-result-object v1

    .line 812
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 813
    .line 814
    .line 815
    move-result v0

    .line 816
    if-eqz v0, :cond_27

    .line 817
    .line 818
    return v0

    .line 819
    :cond_27
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->t()Z

    .line 820
    .line 821
    .line 822
    move-result v0

    .line 823
    if-eqz v0, :cond_28

    .line 824
    .line 825
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    .line 826
    .line 827
    iget-object v1, p1, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    .line 828
    .line 829
    invoke-static {v0, v1}, Ll/k3r0;->d(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    .line 830
    .line 831
    .line 832
    move-result v0

    .line 833
    if-eqz v0, :cond_28

    .line 834
    .line 835
    return v0

    .line 836
    :cond_28
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->u()Z

    .line 837
    .line 838
    .line 839
    move-result v0

    .line 840
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 841
    .line 842
    .line 843
    move-result-object v0

    .line 844
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->u()Z

    .line 845
    .line 846
    .line 847
    move-result v1

    .line 848
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 849
    .line 850
    .line 851
    move-result-object v1

    .line 852
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 853
    .line 854
    .line 855
    move-result v0

    .line 856
    if-eqz v0, :cond_29

    .line 857
    .line 858
    return v0

    .line 859
    :cond_29
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->u()Z

    .line 860
    .line 861
    .line 862
    move-result v0

    .line 863
    if-eqz v0, :cond_2a

    .line 864
    .line 865
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->a:Z

    .line 866
    .line 867
    iget-boolean v1, p1, Lcom/xiaomi/push/hf;->a:Z

    .line 868
    .line 869
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

    .line 870
    .line 871
    .line 872
    move-result v0

    .line 873
    if-eqz v0, :cond_2a

    .line 874
    .line 875
    return v0

    .line 876
    :cond_2a
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->v()Z

    .line 877
    .line 878
    .line 879
    move-result v0

    .line 880
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 881
    .line 882
    .line 883
    move-result-object v0

    .line 884
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->v()Z

    .line 885
    .line 886
    .line 887
    move-result v1

    .line 888
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 889
    .line 890
    .line 891
    move-result-object v1

    .line 892
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 893
    .line 894
    .line 895
    move-result v0

    .line 896
    if-eqz v0, :cond_2b

    .line 897
    .line 898
    return v0

    .line 899
    :cond_2b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->v()Z

    .line 900
    .line 901
    .line 902
    move-result v0

    .line 903
    if-eqz v0, :cond_2c

    .line 904
    .line 905
    iget-wide v0, p0, Lcom/xiaomi/push/hf;->a:J

    .line 906
    .line 907
    iget-wide v2, p1, Lcom/xiaomi/push/hf;->a:J

    .line 908
    .line 909
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

    .line 910
    .line 911
    .line 912
    move-result v0

    .line 913
    if-eqz v0, :cond_2c

    .line 914
    .line 915
    return v0

    .line 916
    :cond_2c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->w()Z

    .line 917
    .line 918
    .line 919
    move-result v0

    .line 920
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 921
    .line 922
    .line 923
    move-result-object v0

    .line 924
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->w()Z

    .line 925
    .line 926
    .line 927
    move-result v1

    .line 928
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 929
    .line 930
    .line 931
    move-result-object v1

    .line 932
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 933
    .line 934
    .line 935
    move-result v0

    .line 936
    if-eqz v0, :cond_2d

    .line 937
    .line 938
    return v0

    .line 939
    :cond_2d
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->w()Z

    .line 940
    .line 941
    .line 942
    move-result v0

    .line 943
    if-eqz v0, :cond_2e

    .line 944
    .line 945
    iget-wide v0, p0, Lcom/xiaomi/push/hf;->b:J

    .line 946
    .line 947
    iget-wide v2, p1, Lcom/xiaomi/push/hf;->b:J

    .line 948
    .line 949
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

    .line 950
    .line 951
    .line 952
    move-result v0

    .line 953
    if-eqz v0, :cond_2e

    .line 954
    .line 955
    return v0

    .line 956
    :cond_2e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->x()Z

    .line 957
    .line 958
    .line 959
    move-result v0

    .line 960
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 961
    .line 962
    .line 963
    move-result-object v0

    .line 964
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->x()Z

    .line 965
    .line 966
    .line 967
    move-result v1

    .line 968
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 969
    .line 970
    .line 971
    move-result-object v1

    .line 972
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 973
    .line 974
    .line 975
    move-result v0

    .line 976
    if-eqz v0, :cond_2f

    .line 977
    .line 978
    return v0

    .line 979
    :cond_2f
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->x()Z

    .line 980
    .line 981
    .line 982
    move-result v0

    .line 983
    if-eqz v0, :cond_30

    .line 984
    .line 985
    iget-object v0, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    .line 986
    .line 987
    iget-object v1, p1, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    .line 988
    .line 989
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 990
    .line 991
    .line 992
    move-result v0

    .line 993
    if-eqz v0, :cond_30

    .line 994
    .line 995
    return v0

    .line 996
    :cond_30
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->y()Z

    .line 997
    .line 998
    .line 999
    move-result v0

    .line 1000
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v0

    .line 1004
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->y()Z

    .line 1005
    .line 1006
    .line 1007
    move-result v1

    .line 1008
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v1

    .line 1012
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 1013
    .line 1014
    .line 1015
    move-result v0

    .line 1016
    if-eqz v0, :cond_31

    .line 1017
    .line 1018
    return v0

    .line 1019
    :cond_31
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->y()Z

    .line 1020
    .line 1021
    .line 1022
    move-result v0

    .line 1023
    if-eqz v0, :cond_32

    .line 1024
    .line 1025
    iget-object v0, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    .line 1026
    .line 1027
    iget-object v1, p1, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    .line 1028
    .line 1029
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1030
    .line 1031
    .line 1032
    move-result v0

    .line 1033
    if-eqz v0, :cond_32

    .line 1034
    .line 1035
    return v0

    .line 1036
    :cond_32
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->z()Z

    .line 1037
    .line 1038
    .line 1039
    move-result v0

    .line 1040
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v0

    .line 1044
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->z()Z

    .line 1045
    .line 1046
    .line 1047
    move-result v1

    .line 1048
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v1

    .line 1052
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 1053
    .line 1054
    .line 1055
    move-result v0

    .line 1056
    if-eqz v0, :cond_33

    .line 1057
    .line 1058
    return v0

    .line 1059
    :cond_33
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->z()Z

    .line 1060
    .line 1061
    .line 1062
    move-result v0

    .line 1063
    if-eqz v0, :cond_34

    .line 1064
    .line 1065
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->b:Z

    .line 1066
    .line 1067
    iget-boolean v1, p1, Lcom/xiaomi/push/hf;->b:Z

    .line 1068
    .line 1069
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

    .line 1070
    .line 1071
    .line 1072
    move-result v0

    .line 1073
    if-eqz v0, :cond_34

    .line 1074
    .line 1075
    return v0

    .line 1076
    :cond_34
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->A()Z

    .line 1077
    .line 1078
    .line 1079
    move-result v0

    .line 1080
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v0

    .line 1084
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->A()Z

    .line 1085
    .line 1086
    .line 1087
    move-result v1

    .line 1088
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v1

    .line 1092
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 1093
    .line 1094
    .line 1095
    move-result v0

    .line 1096
    if-eqz v0, :cond_35

    .line 1097
    .line 1098
    return v0

    .line 1099
    :cond_35
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->A()Z

    .line 1100
    .line 1101
    .line 1102
    move-result v0

    .line 1103
    if-eqz v0, :cond_36

    .line 1104
    .line 1105
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 1106
    .line 1107
    iget-object v1, p1, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 1108
    .line 1109
    invoke-static {v0, v1}, Ll/k3r0;->h(Ljava/util/Map;Ljava/util/Map;)I

    .line 1110
    .line 1111
    .line 1112
    move-result v0

    .line 1113
    if-eqz v0, :cond_36

    .line 1114
    .line 1115
    return v0

    .line 1116
    :cond_36
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->B()Z

    .line 1117
    .line 1118
    .line 1119
    move-result v0

    .line 1120
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v0

    .line 1124
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->B()Z

    .line 1125
    .line 1126
    .line 1127
    move-result v1

    .line 1128
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1129
    .line 1130
    .line 1131
    move-result-object v1

    .line 1132
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 1133
    .line 1134
    .line 1135
    move-result v0

    .line 1136
    if-eqz v0, :cond_37

    .line 1137
    .line 1138
    return v0

    .line 1139
    :cond_37
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->B()Z

    .line 1140
    .line 1141
    .line 1142
    move-result v0

    .line 1143
    if-eqz v0, :cond_38

    .line 1144
    .line 1145
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->c:Z

    .line 1146
    .line 1147
    iget-boolean v1, p1, Lcom/xiaomi/push/hf;->c:Z

    .line 1148
    .line 1149
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

    .line 1150
    .line 1151
    .line 1152
    move-result v0

    .line 1153
    if-eqz v0, :cond_38

    .line 1154
    .line 1155
    return v0

    .line 1156
    :cond_38
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->C()Z

    .line 1157
    .line 1158
    .line 1159
    move-result v0

    .line 1160
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v0

    .line 1164
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->C()Z

    .line 1165
    .line 1166
    .line 1167
    move-result v1

    .line 1168
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1169
    .line 1170
    .line 1171
    move-result-object v1

    .line 1172
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->compareTo(Ljava/lang/Boolean;)I

    .line 1173
    .line 1174
    .line 1175
    move-result v0

    .line 1176
    if-eqz v0, :cond_39

    .line 1177
    .line 1178
    return v0

    .line 1179
    :cond_39
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->C()Z

    .line 1180
    .line 1181
    .line 1182
    move-result v0

    .line 1183
    if-eqz v0, :cond_3a

    .line 1184
    .line 1185
    iget-object p0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    .line 1186
    .line 1187
    iget-object p1, p1, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    .line 1188
    .line 1189
    invoke-static {p0, p1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1190
    .line 1191
    .line 1192
    move-result p0

    .line 1193
    if-eqz p0, :cond_3a

    .line 1194
    .line 1195
    return p0

    .line 1196
    :cond_3a
    const/4 p0, 0x0

    .line 1197
    return p0
.end method

.method public a(I)Lcom/xiaomi/push/hf;
    .locals 0

    .line 1200
    iput p1, p0, Lcom/xiaomi/push/hf;->a:I

    const/4 p1, 0x1

    .line 1201
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hf;->a(Z)V

    return-object p0
.end method

.method public a(Lcom/xiaomi/push/gt;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 1203
    iput-object p1, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 1199
    iput-object p1, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    return-object p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 1198
    iget-object p0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 1373
    iget-object v0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1374
    iget-object v0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1375
    iget-object v0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-void

    .line 1376
    :cond_0
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'token\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1377
    :cond_1
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'appId\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1378
    :cond_2
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'id\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ll/w3r0;)V
    .locals 7

    .line 1292
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 1293
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 1294
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_0

    .line 1295
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 1296
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()V

    return-void

    .line 1297
    :cond_0
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0xa

    const/16 v3, 0x8

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/16 v6, 0xb

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    .line 1298
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_0
    if-ne v1, v6, :cond_1

    .line 1299
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    goto/16 :goto_2

    .line 1300
    :cond_1
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_1
    if-ne v1, v4, :cond_2

    .line 1301
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->c:Z

    .line 1302
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->h(Z)V

    goto/16 :goto_2

    .line 1303
    :cond_2
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_2
    const/16 v0, 0xd

    if-ne v1, v0, :cond_4

    .line 1304
    invoke-virtual {p1}, Ll/w3r0;->i()Ll/o3r0;

    move-result-object v0

    .line 1305
    new-instance v1, Ljava/util/HashMap;

    iget v2, v0, Ll/o3r0;->c:I

    mul-int/2addr v2, v4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    const/4 v1, 0x0

    .line 1306
    :goto_1
    iget v2, v0, Ll/o3r0;->c:I

    if-ge v1, v2, :cond_3

    .line 1307
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 1308
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v3

    .line 1309
    iget-object v4, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1310
    :cond_3
    invoke-virtual {p1}, Ll/w3r0;->F()V

    goto/16 :goto_2

    .line 1311
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_3
    if-ne v1, v4, :cond_5

    .line 1312
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->b:Z

    .line 1313
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->g(Z)V

    goto/16 :goto_2

    .line 1314
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_4
    if-ne v1, v6, :cond_6

    .line 1315
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    goto/16 :goto_2

    .line 1316
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_5
    if-ne v1, v6, :cond_7

    .line 1317
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    goto/16 :goto_2

    .line 1318
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_6
    if-ne v1, v2, :cond_8

    .line 1319
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/hf;->b:J

    .line 1320
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->f(Z)V

    goto/16 :goto_2

    .line 1321
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_7
    if-ne v1, v2, :cond_9

    .line 1322
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/hf;->a:J

    .line 1323
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->e(Z)V

    goto/16 :goto_2

    .line 1324
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_8
    if-ne v1, v4, :cond_a

    .line 1325
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hf;->a:Z

    .line 1326
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->d(Z)V

    goto/16 :goto_2

    .line 1327
    :cond_a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_9
    if-ne v1, v3, :cond_b

    .line 1328
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    invoke-static {v0}, Lcom/xiaomi/push/gt;->a(I)Lcom/xiaomi/push/gt;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    goto/16 :goto_2

    .line 1329
    :cond_b
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_a
    if-ne v1, v3, :cond_c

    .line 1330
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/hf;->c:I

    .line 1331
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->c(Z)V

    goto/16 :goto_2

    .line 1332
    :cond_c
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_b
    if-ne v1, v6, :cond_d

    .line 1333
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    goto/16 :goto_2

    .line 1334
    :cond_d
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_c
    if-ne v1, v6, :cond_e

    .line 1335
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    goto/16 :goto_2

    .line 1336
    :cond_e
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_d
    if-ne v1, v6, :cond_f

    .line 1337
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    goto/16 :goto_2

    .line 1338
    :cond_f
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_e
    if-ne v1, v6, :cond_10

    .line 1339
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    goto/16 :goto_2

    .line 1340
    :cond_10
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_f
    if-ne v1, v3, :cond_11

    .line 1341
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/hf;->b:I

    .line 1342
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->b(Z)V

    goto/16 :goto_2

    .line 1343
    :cond_11
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_10
    if-ne v1, v3, :cond_12

    .line 1344
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/hf;->a:I

    .line 1345
    invoke-virtual {p0, v5}, Lcom/xiaomi/push/hf;->a(Z)V

    goto/16 :goto_2

    .line 1346
    :cond_12
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_11
    if-ne v1, v6, :cond_13

    .line 1347
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    goto/16 :goto_2

    .line 1348
    :cond_13
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_12
    if-ne v1, v6, :cond_14

    .line 1349
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    goto/16 :goto_2

    .line 1350
    :cond_14
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_13
    if-ne v1, v6, :cond_15

    .line 1351
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    goto/16 :goto_2

    .line 1352
    :cond_15
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_14
    if-ne v1, v6, :cond_16

    .line 1353
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    goto/16 :goto_2

    .line 1354
    :cond_16
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_15
    if-ne v1, v6, :cond_17

    .line 1355
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    goto/16 :goto_2

    .line 1356
    :cond_17
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_16
    if-ne v1, v6, :cond_18

    .line 1357
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    goto :goto_2

    .line 1358
    :cond_18
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_17
    if-ne v1, v6, :cond_19

    .line 1359
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    goto :goto_2

    .line 1360
    :cond_19
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_18
    if-ne v1, v6, :cond_1a

    .line 1361
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    goto :goto_2

    .line 1362
    :cond_1a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_19
    if-ne v1, v6, :cond_1b

    .line 1363
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    goto :goto_2

    .line 1364
    :cond_1b
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_1a
    if-ne v1, v6, :cond_1c

    .line 1365
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    goto :goto_2

    .line 1366
    :cond_1c
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_1b
    const/16 v0, 0xc

    if-ne v1, v0, :cond_1d

    .line 1367
    new-instance v0, Lcom/xiaomi/push/gu;

    invoke-direct {v0}, Lcom/xiaomi/push/gu;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 1368
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->a(Ll/w3r0;)V

    goto :goto_2

    .line 1369
    :cond_1d
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_1c
    if-ne v1, v6, :cond_1e

    .line 1370
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    goto :goto_2

    .line 1371
    :cond_1e
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 1372
    :goto_2
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
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
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x64
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Z)V
    .locals 1

    .line 1202
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 1291
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/xiaomi/push/hf;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1204
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()Z

    move-result v1

    .line 1205
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_58

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 1206
    :cond_2
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 1207
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->b()Z

    move-result v1

    .line 1208
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->b()Z

    move-result v2

    if-nez v1, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    if-eqz v1, :cond_58

    if-nez v2, :cond_5

    goto/16 :goto_0

    .line 1209
    :cond_5
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gu;->a(Lcom/xiaomi/push/gu;)Z

    move-result v1

    if-nez v1, :cond_6

    return v0

    .line 1210
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->c()Z

    move-result v1

    .line 1211
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->c()Z

    move-result v2

    if-nez v1, :cond_7

    if-eqz v2, :cond_9

    :cond_7
    if-eqz v1, :cond_58

    if-nez v2, :cond_8

    goto/16 :goto_0

    .line 1212
    :cond_8
    iget-object v1, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v0

    .line 1213
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->d()Z

    move-result v1

    .line 1214
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->d()Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_c

    :cond_a
    if-eqz v1, :cond_58

    if-nez v2, :cond_b

    goto/16 :goto_0

    .line 1215
    :cond_b
    iget-object v1, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v0

    .line 1216
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->e()Z

    move-result v1

    .line 1217
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->e()Z

    move-result v2

    if-nez v1, :cond_d

    if-eqz v2, :cond_f

    :cond_d
    if-eqz v1, :cond_58

    if-nez v2, :cond_e

    goto/16 :goto_0

    .line 1218
    :cond_e
    iget-object v1, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    return v0

    .line 1219
    :cond_f
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->f()Z

    move-result v1

    .line 1220
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->f()Z

    move-result v2

    if-nez v1, :cond_10

    if-eqz v2, :cond_12

    :cond_10
    if-eqz v1, :cond_58

    if-nez v2, :cond_11

    goto/16 :goto_0

    .line 1221
    :cond_11
    iget-object v1, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    return v0

    .line 1222
    :cond_12
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->g()Z

    move-result v1

    .line 1223
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->g()Z

    move-result v2

    if-nez v1, :cond_13

    if-eqz v2, :cond_15

    :cond_13
    if-eqz v1, :cond_58

    if-nez v2, :cond_14

    goto/16 :goto_0

    .line 1224
    :cond_14
    iget-object v1, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    return v0

    .line 1225
    :cond_15
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->h()Z

    move-result v1

    .line 1226
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->h()Z

    move-result v2

    if-nez v1, :cond_16

    if-eqz v2, :cond_18

    :cond_16
    if-eqz v1, :cond_58

    if-nez v2, :cond_17

    goto/16 :goto_0

    .line 1227
    :cond_17
    iget-object v1, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    return v0

    .line 1228
    :cond_18
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->i()Z

    move-result v1

    .line 1229
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->i()Z

    move-result v2

    if-nez v1, :cond_19

    if-eqz v2, :cond_1b

    :cond_19
    if-eqz v1, :cond_58

    if-nez v2, :cond_1a

    goto/16 :goto_0

    .line 1230
    :cond_1a
    iget-object v1, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    return v0

    .line 1231
    :cond_1b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->j()Z

    move-result v1

    .line 1232
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->j()Z

    move-result v2

    if-nez v1, :cond_1c

    if-eqz v2, :cond_1e

    :cond_1c
    if-eqz v1, :cond_58

    if-nez v2, :cond_1d

    goto/16 :goto_0

    .line 1233
    :cond_1d
    iget-object v1, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v0

    .line 1234
    :cond_1e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->k()Z

    move-result v1

    .line 1235
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->k()Z

    move-result v2

    if-nez v1, :cond_1f

    if-eqz v2, :cond_21

    :cond_1f
    if-eqz v1, :cond_58

    if-nez v2, :cond_20

    goto/16 :goto_0

    .line 1236
    :cond_20
    iget-object v1, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    return v0

    .line 1237
    :cond_21
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->l()Z

    move-result v1

    .line 1238
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->l()Z

    move-result v2

    if-nez v1, :cond_22

    if-eqz v2, :cond_24

    :cond_22
    if-eqz v1, :cond_58

    if-nez v2, :cond_23

    goto/16 :goto_0

    .line 1239
    :cond_23
    iget-object v1, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_24

    return v0

    .line 1240
    :cond_24
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->m()Z

    move-result v1

    .line 1241
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->m()Z

    move-result v2

    if-nez v1, :cond_25

    if-eqz v2, :cond_27

    :cond_25
    if-eqz v1, :cond_58

    if-nez v2, :cond_26

    goto/16 :goto_0

    .line 1242
    :cond_26
    iget v1, p0, Lcom/xiaomi/push/hf;->a:I

    iget v2, p1, Lcom/xiaomi/push/hf;->a:I

    if-eq v1, v2, :cond_27

    return v0

    .line 1243
    :cond_27
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->n()Z

    move-result v1

    .line 1244
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->n()Z

    move-result v2

    if-nez v1, :cond_28

    if-eqz v2, :cond_2a

    :cond_28
    if-eqz v1, :cond_58

    if-nez v2, :cond_29

    goto/16 :goto_0

    .line 1245
    :cond_29
    iget v1, p0, Lcom/xiaomi/push/hf;->b:I

    iget v2, p1, Lcom/xiaomi/push/hf;->b:I

    if-eq v1, v2, :cond_2a

    return v0

    .line 1246
    :cond_2a
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->o()Z

    move-result v1

    .line 1247
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->o()Z

    move-result v2

    if-nez v1, :cond_2b

    if-eqz v2, :cond_2d

    :cond_2b
    if-eqz v1, :cond_58

    if-nez v2, :cond_2c

    goto/16 :goto_0

    .line 1248
    :cond_2c
    iget-object v1, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v0

    .line 1249
    :cond_2d
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->p()Z

    move-result v1

    .line 1250
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->p()Z

    move-result v2

    if-nez v1, :cond_2e

    if-eqz v2, :cond_30

    :cond_2e
    if-eqz v1, :cond_58

    if-nez v2, :cond_2f

    goto/16 :goto_0

    .line 1251
    :cond_2f
    iget-object v1, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    return v0

    .line 1252
    :cond_30
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->q()Z

    move-result v1

    .line 1253
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->q()Z

    move-result v2

    if-nez v1, :cond_31

    if-eqz v2, :cond_33

    :cond_31
    if-eqz v1, :cond_58

    if-nez v2, :cond_32

    goto/16 :goto_0

    .line 1254
    :cond_32
    iget-object v1, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_33

    return v0

    .line 1255
    :cond_33
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->r()Z

    move-result v1

    .line 1256
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->r()Z

    move-result v2

    if-nez v1, :cond_34

    if-eqz v2, :cond_36

    :cond_34
    if-eqz v1, :cond_58

    if-nez v2, :cond_35

    goto/16 :goto_0

    .line 1257
    :cond_35
    iget-object v1, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_36

    return v0

    .line 1258
    :cond_36
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->s()Z

    move-result v1

    .line 1259
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->s()Z

    move-result v2

    if-nez v1, :cond_37

    if-eqz v2, :cond_39

    :cond_37
    if-eqz v1, :cond_58

    if-nez v2, :cond_38

    goto/16 :goto_0

    .line 1260
    :cond_38
    iget v1, p0, Lcom/xiaomi/push/hf;->c:I

    iget v2, p1, Lcom/xiaomi/push/hf;->c:I

    if-eq v1, v2, :cond_39

    return v0

    .line 1261
    :cond_39
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->t()Z

    move-result v1

    .line 1262
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->t()Z

    move-result v2

    if-nez v1, :cond_3a

    if-eqz v2, :cond_3c

    :cond_3a
    if-eqz v1, :cond_58

    if-nez v2, :cond_3b

    goto/16 :goto_0

    .line 1263
    :cond_3b
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3c

    return v0

    .line 1264
    :cond_3c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->u()Z

    move-result v1

    .line 1265
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->u()Z

    move-result v2

    if-nez v1, :cond_3d

    if-eqz v2, :cond_3f

    :cond_3d
    if-eqz v1, :cond_58

    if-nez v2, :cond_3e

    goto/16 :goto_0

    .line 1266
    :cond_3e
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->a:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hf;->a:Z

    if-eq v1, v2, :cond_3f

    return v0

    .line 1267
    :cond_3f
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->v()Z

    move-result v1

    .line 1268
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->v()Z

    move-result v2

    if-nez v1, :cond_40

    if-eqz v2, :cond_42

    :cond_40
    if-eqz v1, :cond_58

    if-nez v2, :cond_41

    goto/16 :goto_0

    .line 1269
    :cond_41
    iget-wide v1, p0, Lcom/xiaomi/push/hf;->a:J

    iget-wide v3, p1, Lcom/xiaomi/push/hf;->a:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_42

    return v0

    .line 1270
    :cond_42
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->w()Z

    move-result v1

    .line 1271
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->w()Z

    move-result v2

    if-nez v1, :cond_43

    if-eqz v2, :cond_45

    :cond_43
    if-eqz v1, :cond_58

    if-nez v2, :cond_44

    goto/16 :goto_0

    .line 1272
    :cond_44
    iget-wide v1, p0, Lcom/xiaomi/push/hf;->b:J

    iget-wide v3, p1, Lcom/xiaomi/push/hf;->b:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_45

    return v0

    .line 1273
    :cond_45
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->x()Z

    move-result v1

    .line 1274
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->x()Z

    move-result v2

    if-nez v1, :cond_46

    if-eqz v2, :cond_48

    :cond_46
    if-eqz v1, :cond_58

    if-nez v2, :cond_47

    goto/16 :goto_0

    .line 1275
    :cond_47
    iget-object v1, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    return v0

    .line 1276
    :cond_48
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->y()Z

    move-result v1

    .line 1277
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->y()Z

    move-result v2

    if-nez v1, :cond_49

    if-eqz v2, :cond_4b

    :cond_49
    if-eqz v1, :cond_58

    if-nez v2, :cond_4a

    goto/16 :goto_0

    .line 1278
    :cond_4a
    iget-object v1, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4b

    return v0

    .line 1279
    :cond_4b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->z()Z

    move-result v1

    .line 1280
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->z()Z

    move-result v2

    if-nez v1, :cond_4c

    if-eqz v2, :cond_4e

    :cond_4c
    if-eqz v1, :cond_58

    if-nez v2, :cond_4d

    goto :goto_0

    .line 1281
    :cond_4d
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->b:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hf;->b:Z

    if-eq v1, v2, :cond_4e

    return v0

    .line 1282
    :cond_4e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->A()Z

    move-result v1

    .line 1283
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->A()Z

    move-result v2

    if-nez v1, :cond_4f

    if-eqz v2, :cond_51

    :cond_4f
    if-eqz v1, :cond_58

    if-nez v2, :cond_50

    goto :goto_0

    .line 1284
    :cond_50
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    iget-object v2, p1, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    return v0

    .line 1285
    :cond_51
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->B()Z

    move-result v1

    .line 1286
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->B()Z

    move-result v2

    if-nez v1, :cond_52

    if-eqz v2, :cond_54

    :cond_52
    if-eqz v1, :cond_58

    if-nez v2, :cond_53

    goto :goto_0

    .line 1287
    :cond_53
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->c:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hf;->c:Z

    if-eq v1, v2, :cond_54

    return v0

    .line 1288
    :cond_54
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->C()Z

    move-result v1

    .line 1289
    invoke-virtual {p1}, Lcom/xiaomi/push/hf;->C()Z

    move-result v2

    if-nez v1, :cond_55

    if-eqz v2, :cond_57

    :cond_55
    if-eqz v1, :cond_58

    if-nez v2, :cond_56

    goto :goto_0

    .line 1290
    :cond_56
    iget-object p0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    iget-object p1, p1, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_57

    return v0

    :cond_57
    const/4 p0, 0x1

    return p0

    :cond_58
    :goto_0
    return v0
.end method

.method public b(I)Lcom/xiaomi/push/hf;
    .locals 0

    .line 694
    iput p1, p0, Lcom/xiaomi/push/hf;->b:I

    const/4 p1, 0x1

    .line 695
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hf;->b(Z)V

    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 693
    iput-object p1, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 692
    iget-object p0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/hf;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/xiaomi/push/hf;->a:Ll/m3r0;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget-object v0, Lcom/xiaomi/push/hf;->b:Ll/m3r0;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->b(Ll/w3r0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Lcom/xiaomi/push/hf;->c:Ll/m3r0;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget-object v0, Lcom/xiaomi/push/hf;->d:Ll/m3r0;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object v0, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->e()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    sget-object v0, Lcom/xiaomi/push/hf;->e:Ll/m3r0;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 110
    .line 111
    .line 112
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v0, :cond_5

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->f()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    sget-object v0, Lcom/xiaomi/push/hf;->f:Ll/m3r0;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 133
    .line 134
    .line 135
    :cond_5
    iget-object v0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    sget-object v0, Lcom/xiaomi/push/hf;->g:Ll/m3r0;

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 150
    .line 151
    .line 152
    :cond_6
    iget-object v0, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz v0, :cond_7

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->h()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_7

    .line 161
    .line 162
    sget-object v0, Lcom/xiaomi/push/hf;->h:Ll/m3r0;

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 173
    .line 174
    .line 175
    :cond_7
    iget-object v0, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    .line 176
    .line 177
    if-eqz v0, :cond_8

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->i()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    sget-object v0, Lcom/xiaomi/push/hf;->i:Ll/m3r0;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 196
    .line 197
    .line 198
    :cond_8
    iget-object v0, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    .line 199
    .line 200
    if-eqz v0, :cond_9

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->j()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_9

    .line 207
    .line 208
    sget-object v0, Lcom/xiaomi/push/hf;->j:Ll/m3r0;

    .line 209
    .line 210
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 219
    .line 220
    .line 221
    :cond_9
    iget-object v0, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    .line 222
    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->k()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_a

    .line 230
    .line 231
    sget-object v0, Lcom/xiaomi/push/hf;->k:Ll/m3r0;

    .line 232
    .line 233
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 242
    .line 243
    .line 244
    :cond_a
    iget-object v0, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    .line 245
    .line 246
    if-eqz v0, :cond_b

    .line 247
    .line 248
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->l()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_b

    .line 253
    .line 254
    sget-object v0, Lcom/xiaomi/push/hf;->l:Ll/m3r0;

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 265
    .line 266
    .line 267
    :cond_b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->m()Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_c

    .line 272
    .line 273
    sget-object v0, Lcom/xiaomi/push/hf;->m:Ll/m3r0;

    .line 274
    .line 275
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 276
    .line 277
    .line 278
    iget v0, p0, Lcom/xiaomi/push/hf;->a:I

    .line 279
    .line 280
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 284
    .line 285
    .line 286
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->n()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-eqz v0, :cond_d

    .line 291
    .line 292
    sget-object v0, Lcom/xiaomi/push/hf;->n:Ll/m3r0;

    .line 293
    .line 294
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 295
    .line 296
    .line 297
    iget v0, p0, Lcom/xiaomi/push/hf;->b:I

    .line 298
    .line 299
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 303
    .line 304
    .line 305
    :cond_d
    iget-object v0, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    .line 306
    .line 307
    if-eqz v0, :cond_e

    .line 308
    .line 309
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->o()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_e

    .line 314
    .line 315
    sget-object v0, Lcom/xiaomi/push/hf;->o:Ll/m3r0;

    .line 316
    .line 317
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 326
    .line 327
    .line 328
    :cond_e
    iget-object v0, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    .line 329
    .line 330
    if-eqz v0, :cond_f

    .line 331
    .line 332
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->p()Z

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-eqz v0, :cond_f

    .line 337
    .line 338
    sget-object v0, Lcom/xiaomi/push/hf;->p:Ll/m3r0;

    .line 339
    .line 340
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 341
    .line 342
    .line 343
    iget-object v0, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 349
    .line 350
    .line 351
    :cond_f
    iget-object v0, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    .line 352
    .line 353
    if-eqz v0, :cond_10

    .line 354
    .line 355
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->q()Z

    .line 356
    .line 357
    .line 358
    move-result v0

    .line 359
    if-eqz v0, :cond_10

    .line 360
    .line 361
    sget-object v0, Lcom/xiaomi/push/hf;->q:Ll/m3r0;

    .line 362
    .line 363
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    .line 367
    .line 368
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 372
    .line 373
    .line 374
    :cond_10
    iget-object v0, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    .line 375
    .line 376
    if-eqz v0, :cond_11

    .line 377
    .line 378
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->r()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_11

    .line 383
    .line 384
    sget-object v0, Lcom/xiaomi/push/hf;->r:Ll/m3r0;

    .line 385
    .line 386
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 387
    .line 388
    .line 389
    iget-object v0, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 395
    .line 396
    .line 397
    :cond_11
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->s()Z

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    if-eqz v0, :cond_12

    .line 402
    .line 403
    sget-object v0, Lcom/xiaomi/push/hf;->s:Ll/m3r0;

    .line 404
    .line 405
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 406
    .line 407
    .line 408
    iget v0, p0, Lcom/xiaomi/push/hf;->c:I

    .line 409
    .line 410
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 414
    .line 415
    .line 416
    :cond_12
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    .line 417
    .line 418
    if-eqz v0, :cond_13

    .line 419
    .line 420
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->t()Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    if-eqz v0, :cond_13

    .line 425
    .line 426
    sget-object v0, Lcom/xiaomi/push/hf;->t:Ll/m3r0;

    .line 427
    .line 428
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 429
    .line 430
    .line 431
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    .line 432
    .line 433
    invoke-virtual {v0}, Lcom/xiaomi/push/gt;->a()I

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 438
    .line 439
    .line 440
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 441
    .line 442
    .line 443
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->u()Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-eqz v0, :cond_14

    .line 448
    .line 449
    sget-object v0, Lcom/xiaomi/push/hf;->u:Ll/m3r0;

    .line 450
    .line 451
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 452
    .line 453
    .line 454
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->a:Z

    .line 455
    .line 456
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 460
    .line 461
    .line 462
    :cond_14
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->v()Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_15

    .line 467
    .line 468
    sget-object v0, Lcom/xiaomi/push/hf;->v:Ll/m3r0;

    .line 469
    .line 470
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 471
    .line 472
    .line 473
    iget-wide v0, p0, Lcom/xiaomi/push/hf;->a:J

    .line 474
    .line 475
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 479
    .line 480
    .line 481
    :cond_15
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->w()Z

    .line 482
    .line 483
    .line 484
    move-result v0

    .line 485
    if-eqz v0, :cond_16

    .line 486
    .line 487
    sget-object v0, Lcom/xiaomi/push/hf;->w:Ll/m3r0;

    .line 488
    .line 489
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 490
    .line 491
    .line 492
    iget-wide v0, p0, Lcom/xiaomi/push/hf;->b:J

    .line 493
    .line 494
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 495
    .line 496
    .line 497
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 498
    .line 499
    .line 500
    :cond_16
    iget-object v0, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    .line 501
    .line 502
    if-eqz v0, :cond_17

    .line 503
    .line 504
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->x()Z

    .line 505
    .line 506
    .line 507
    move-result v0

    .line 508
    if-eqz v0, :cond_17

    .line 509
    .line 510
    sget-object v0, Lcom/xiaomi/push/hf;->x:Ll/m3r0;

    .line 511
    .line 512
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 513
    .line 514
    .line 515
    iget-object v0, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    .line 516
    .line 517
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 521
    .line 522
    .line 523
    :cond_17
    iget-object v0, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    .line 524
    .line 525
    if-eqz v0, :cond_18

    .line 526
    .line 527
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->y()Z

    .line 528
    .line 529
    .line 530
    move-result v0

    .line 531
    if-eqz v0, :cond_18

    .line 532
    .line 533
    sget-object v0, Lcom/xiaomi/push/hf;->y:Ll/m3r0;

    .line 534
    .line 535
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 536
    .line 537
    .line 538
    iget-object v0, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    .line 539
    .line 540
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 541
    .line 542
    .line 543
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 544
    .line 545
    .line 546
    :cond_18
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->z()Z

    .line 547
    .line 548
    .line 549
    move-result v0

    .line 550
    if-eqz v0, :cond_19

    .line 551
    .line 552
    sget-object v0, Lcom/xiaomi/push/hf;->z:Ll/m3r0;

    .line 553
    .line 554
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 555
    .line 556
    .line 557
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->b:Z

    .line 558
    .line 559
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 563
    .line 564
    .line 565
    :cond_19
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 566
    .line 567
    if-eqz v0, :cond_1b

    .line 568
    .line 569
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->A()Z

    .line 570
    .line 571
    .line 572
    move-result v0

    .line 573
    if-eqz v0, :cond_1b

    .line 574
    .line 575
    sget-object v0, Lcom/xiaomi/push/hf;->A:Ll/m3r0;

    .line 576
    .line 577
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 578
    .line 579
    .line 580
    new-instance v0, Ll/o3r0;

    .line 581
    .line 582
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 583
    .line 584
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 585
    .line 586
    .line 587
    move-result v1

    .line 588
    const/16 v2, 0xb

    .line 589
    .line 590
    invoke-direct {v0, v2, v2, v1}, Ll/o3r0;-><init>(BBI)V

    .line 591
    .line 592
    .line 593
    invoke-virtual {p1, v0}, Ll/w3r0;->u(Ll/o3r0;)V

    .line 594
    .line 595
    .line 596
    iget-object v0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 597
    .line 598
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 607
    .line 608
    .line 609
    move-result v1

    .line 610
    if-eqz v1, :cond_1a

    .line 611
    .line 612
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 613
    .line 614
    .line 615
    move-result-object v1

    .line 616
    check-cast v1, Ljava/util/Map$Entry;

    .line 617
    .line 618
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v2

    .line 622
    check-cast v2, Ljava/lang/String;

    .line 623
    .line 624
    invoke-virtual {p1, v2}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 625
    .line 626
    .line 627
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 628
    .line 629
    .line 630
    move-result-object v1

    .line 631
    check-cast v1, Ljava/lang/String;

    .line 632
    .line 633
    invoke-virtual {p1, v1}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    goto :goto_0

    .line 637
    :cond_1a
    invoke-virtual {p1}, Ll/w3r0;->B()V

    .line 638
    .line 639
    .line 640
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 641
    .line 642
    .line 643
    :cond_1b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->B()Z

    .line 644
    .line 645
    .line 646
    move-result v0

    .line 647
    if-eqz v0, :cond_1c

    .line 648
    .line 649
    sget-object v0, Lcom/xiaomi/push/hf;->B:Ll/m3r0;

    .line 650
    .line 651
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 652
    .line 653
    .line 654
    iget-boolean v0, p0, Lcom/xiaomi/push/hf;->c:Z

    .line 655
    .line 656
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 657
    .line 658
    .line 659
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 660
    .line 661
    .line 662
    :cond_1c
    iget-object v0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    .line 663
    .line 664
    if-eqz v0, :cond_1d

    .line 665
    .line 666
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->C()Z

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    if-eqz v0, :cond_1d

    .line 671
    .line 672
    sget-object v0, Lcom/xiaomi/push/hf;->C:Ll/m3r0;

    .line 673
    .line 674
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 675
    .line 676
    .line 677
    iget-object p0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    .line 678
    .line 679
    invoke-virtual {p1, p0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 680
    .line 681
    .line 682
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 683
    .line 684
    .line 685
    :cond_1d
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 686
    .line 687
    .line 688
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 689
    .line 690
    .line 691
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 696
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 0

    .line 697
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public c(I)Lcom/xiaomi/push/hf;
    .locals 0

    .line 11
    iput p1, p0, Lcom/xiaomi/push/hf;->c:I

    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hf;->c(Z)V

    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    return-object p0
.end method

.method public c(Z)V
    .locals 1

    .line 13
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

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
    check-cast p1, Lcom/xiaomi/push/hf;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hf;->a(Lcom/xiaomi/push/hf;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    return-object p0
.end method

.method public d(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

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

.method public e(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    return-object p0
.end method

.method public e(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

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
    instance-of v1, p1, Lcom/xiaomi/push/hf;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/hf;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hf;->a(Lcom/xiaomi/push/hf;)Z

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

.method public f(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    return-object p0
.end method

.method public f(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

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

.method public g(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    return-object p0
.end method

.method public g(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x6

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

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

.method public h(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    return-object p0
.end method

.method public h(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    const/4 v0, 0x7

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

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

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public i(Ljava/lang/String;)Lcom/xiaomi/push/hf;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

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

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

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

.method public m()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x0

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

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

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

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

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

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

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

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

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

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

.method public s()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

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

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

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
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "XmPushActionRegistration("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const-string v3, "null"

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    const-string v1, "debug:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :goto_0
    move v1, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 v1, 0x1

    .line 36
    :goto_1
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const-string v5, ", "

    .line 41
    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    :cond_2
    const-string v1, "target:"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gu;

    .line 55
    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_4
    move v2, v1

    .line 67
    :goto_2
    if-nez v2, :cond_5

    .line 68
    .line 69
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    :cond_5
    const-string v1, "id:"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/xiaomi/push/hf;->b:Ljava/lang/String;

    .line 78
    .line 79
    if-nez v1, :cond_6

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_6
    invoke-static {v1}, Lcom/xiaomi/push/service/aj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    :goto_3
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v1, "appId:"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/xiaomi/push/hf;->c:Ljava/lang/String;

    .line 101
    .line 102
    if-nez v1, :cond_7

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    :goto_4
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->e()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_9

    .line 116
    .line 117
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v1, "appVersion:"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/xiaomi/push/hf;->d:Ljava/lang/String;

    .line 126
    .line 127
    if-nez v1, :cond_8

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    goto :goto_5

    .line 133
    :cond_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    :cond_9
    :goto_5
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->f()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_b

    .line 141
    .line 142
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v1, "packageName:"

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lcom/xiaomi/push/hf;->e:Ljava/lang/String;

    .line 151
    .line 152
    if-nez v1, :cond_a

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    :cond_b
    :goto_6
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v1, "token:"

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/xiaomi/push/hf;->f:Ljava/lang/String;

    .line 170
    .line 171
    if-nez v1, :cond_c

    .line 172
    .line 173
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    goto :goto_7

    .line 177
    :cond_c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    :goto_7
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->h()Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_e

    .line 185
    .line 186
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v1, "deviceId:"

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Lcom/xiaomi/push/hf;->g:Ljava/lang/String;

    .line 195
    .line 196
    if-nez v1, :cond_d

    .line 197
    .line 198
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    goto :goto_8

    .line 202
    :cond_d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    :cond_e
    :goto_8
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->i()Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_10

    .line 210
    .line 211
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v1, "aliasName:"

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Lcom/xiaomi/push/hf;->h:Ljava/lang/String;

    .line 220
    .line 221
    if-nez v1, :cond_f

    .line 222
    .line 223
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    goto :goto_9

    .line 227
    :cond_f
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    :cond_10
    :goto_9
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->j()Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-eqz v1, :cond_12

    .line 235
    .line 236
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v1, "sdkVersion:"

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    iget-object v1, p0, Lcom/xiaomi/push/hf;->i:Ljava/lang/String;

    .line 245
    .line 246
    if-nez v1, :cond_11

    .line 247
    .line 248
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    goto :goto_a

    .line 252
    :cond_11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    :cond_12
    :goto_a
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->k()Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_14

    .line 260
    .line 261
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v1, "regId:"

    .line 265
    .line 266
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    iget-object v1, p0, Lcom/xiaomi/push/hf;->j:Ljava/lang/String;

    .line 270
    .line 271
    if-nez v1, :cond_13

    .line 272
    .line 273
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    goto :goto_b

    .line 277
    :cond_13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    :cond_14
    :goto_b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->l()Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-eqz v1, :cond_16

    .line 285
    .line 286
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    const-string v1, "pushSdkVersionName:"

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    iget-object v1, p0, Lcom/xiaomi/push/hf;->k:Ljava/lang/String;

    .line 295
    .line 296
    if-nez v1, :cond_15

    .line 297
    .line 298
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    goto :goto_c

    .line 302
    :cond_15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    :cond_16
    :goto_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->m()Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-eqz v1, :cond_17

    .line 310
    .line 311
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v1, "pushSdkVersionCode:"

    .line 315
    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    iget v1, p0, Lcom/xiaomi/push/hf;->a:I

    .line 320
    .line 321
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    :cond_17
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->n()Z

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    if-eqz v1, :cond_18

    .line 329
    .line 330
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    const-string v1, "appVersionCode:"

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    iget v1, p0, Lcom/xiaomi/push/hf;->b:I

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    :cond_18
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->o()Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v1, :cond_1a

    .line 348
    .line 349
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    const-string v1, "androidId:"

    .line 353
    .line 354
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    iget-object v1, p0, Lcom/xiaomi/push/hf;->l:Ljava/lang/String;

    .line 358
    .line 359
    if-nez v1, :cond_19

    .line 360
    .line 361
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    goto :goto_d

    .line 365
    :cond_19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    :cond_1a
    :goto_d
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->p()Z

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    if-eqz v1, :cond_1c

    .line 373
    .line 374
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string v1, "imei:"

    .line 378
    .line 379
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    iget-object v1, p0, Lcom/xiaomi/push/hf;->m:Ljava/lang/String;

    .line 383
    .line 384
    if-nez v1, :cond_1b

    .line 385
    .line 386
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    goto :goto_e

    .line 390
    :cond_1b
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    :cond_1c
    :goto_e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->q()Z

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    if-eqz v1, :cond_1e

    .line 398
    .line 399
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    const-string v1, "serial:"

    .line 403
    .line 404
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    iget-object v1, p0, Lcom/xiaomi/push/hf;->n:Ljava/lang/String;

    .line 408
    .line 409
    if-nez v1, :cond_1d

    .line 410
    .line 411
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    goto :goto_f

    .line 415
    :cond_1d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    :cond_1e
    :goto_f
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->r()Z

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    if-eqz v1, :cond_20

    .line 423
    .line 424
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v1, "imeiMd5:"

    .line 428
    .line 429
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    iget-object v1, p0, Lcom/xiaomi/push/hf;->o:Ljava/lang/String;

    .line 433
    .line 434
    if-nez v1, :cond_1f

    .line 435
    .line 436
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    goto :goto_10

    .line 440
    :cond_1f
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    :cond_20
    :goto_10
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->s()Z

    .line 444
    .line 445
    .line 446
    move-result v1

    .line 447
    if-eqz v1, :cond_21

    .line 448
    .line 449
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    const-string v1, "spaceId:"

    .line 453
    .line 454
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    iget v1, p0, Lcom/xiaomi/push/hf;->c:I

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    :cond_21
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->t()Z

    .line 463
    .line 464
    .line 465
    move-result v1

    .line 466
    if-eqz v1, :cond_23

    .line 467
    .line 468
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    const-string v1, "reason:"

    .line 472
    .line 473
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Lcom/xiaomi/push/gt;

    .line 477
    .line 478
    if-nez v1, :cond_22

    .line 479
    .line 480
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    goto :goto_11

    .line 484
    :cond_22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    :cond_23
    :goto_11
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->u()Z

    .line 488
    .line 489
    .line 490
    move-result v1

    .line 491
    if-eqz v1, :cond_24

    .line 492
    .line 493
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    const-string v1, "validateToken:"

    .line 497
    .line 498
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->a:Z

    .line 502
    .line 503
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    :cond_24
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->v()Z

    .line 507
    .line 508
    .line 509
    move-result v1

    .line 510
    if-eqz v1, :cond_25

    .line 511
    .line 512
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    const-string v1, "miid:"

    .line 516
    .line 517
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 518
    .line 519
    .line 520
    iget-wide v1, p0, Lcom/xiaomi/push/hf;->a:J

    .line 521
    .line 522
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    :cond_25
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->w()Z

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    if-eqz v1, :cond_26

    .line 530
    .line 531
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    const-string v1, "createdTs:"

    .line 535
    .line 536
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    iget-wide v1, p0, Lcom/xiaomi/push/hf;->b:J

    .line 540
    .line 541
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    :cond_26
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->x()Z

    .line 545
    .line 546
    .line 547
    move-result v1

    .line 548
    if-eqz v1, :cond_28

    .line 549
    .line 550
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    const-string v1, "subImei:"

    .line 554
    .line 555
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    .line 557
    .line 558
    iget-object v1, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

    .line 559
    .line 560
    if-nez v1, :cond_27

    .line 561
    .line 562
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    goto :goto_12

    .line 566
    :cond_27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    :cond_28
    :goto_12
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->y()Z

    .line 570
    .line 571
    .line 572
    move-result v1

    .line 573
    if-eqz v1, :cond_2a

    .line 574
    .line 575
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    const-string v1, "subImeiMd5:"

    .line 579
    .line 580
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 581
    .line 582
    .line 583
    iget-object v1, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

    .line 584
    .line 585
    if-nez v1, :cond_29

    .line 586
    .line 587
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    goto :goto_13

    .line 591
    :cond_29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    :cond_2a
    :goto_13
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->z()Z

    .line 595
    .line 596
    .line 597
    move-result v1

    .line 598
    if-eqz v1, :cond_2b

    .line 599
    .line 600
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    const-string v1, "isHybridFrame:"

    .line 604
    .line 605
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->b:Z

    .line 609
    .line 610
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 611
    .line 612
    .line 613
    :cond_2b
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->A()Z

    .line 614
    .line 615
    .line 616
    move-result v1

    .line 617
    if-eqz v1, :cond_2d

    .line 618
    .line 619
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    .line 621
    .line 622
    const-string v1, "connectionAttrs:"

    .line 623
    .line 624
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    .line 626
    .line 627
    iget-object v1, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/Map;

    .line 628
    .line 629
    if-nez v1, :cond_2c

    .line 630
    .line 631
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 632
    .line 633
    .line 634
    goto :goto_14

    .line 635
    :cond_2c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 636
    .line 637
    .line 638
    :cond_2d
    :goto_14
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->B()Z

    .line 639
    .line 640
    .line 641
    move-result v1

    .line 642
    if-eqz v1, :cond_2e

    .line 643
    .line 644
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 645
    .line 646
    .line 647
    const-string v1, "cleanOldRegInfo:"

    .line 648
    .line 649
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    iget-boolean v1, p0, Lcom/xiaomi/push/hf;->c:Z

    .line 653
    .line 654
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    :cond_2e
    invoke-virtual {p0}, Lcom/xiaomi/push/hf;->C()Z

    .line 658
    .line 659
    .line 660
    move-result v1

    .line 661
    if-eqz v1, :cond_30

    .line 662
    .line 663
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    .line 665
    .line 666
    const-string v1, "oldRegId:"

    .line 667
    .line 668
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    iget-object p0, p0, Lcom/xiaomi/push/hf;->r:Ljava/lang/String;

    .line 672
    .line 673
    if-nez p0, :cond_2f

    .line 674
    .line 675
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    goto :goto_15

    .line 679
    :cond_2f
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 680
    .line 681
    .line 682
    :cond_30
    :goto_15
    const-string p0, ")"

    .line 683
    .line 684
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    move-result-object p0

    .line 691
    return-object p0
.end method

.method public u()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

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

.method public v()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

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

.method public w()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->p:Ljava/lang/String;

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

.method public y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->q:Ljava/lang/String;

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

.method public z()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hf;->a:Ljava/util/BitSet;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/BitSet;->get(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
