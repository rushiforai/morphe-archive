.class public Lcom/xiaomi/push/hg;
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
        "Lcom/xiaomi/push/hg;",
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

.field private static final n:Ll/m3r0;

.field private static final o:Ll/m3r0;

.field private static final p:Ll/m3r0;

.field private static final q:Ll/m3r0;

.field private static final r:Ll/m3r0;

.field private static final s:Ll/m3r0;

.field private static final t:Ll/m3r0;


# instance fields
.field public a:I

.field public a:J

.field public a:Lcom/xiaomi/push/gu;

.field public a:Ljava/lang/String;

.field private a:Ljava/util/BitSet;

.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public a:Z

.field public b:I

.field public b:J

.field public b:Ljava/lang/String;

.field public c:J

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ll/z3r0;

    .line 2
    .line 3
    const-string v1, "XmPushActionRegistrationResult"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z3r0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/hg;->a:Ll/z3r0;

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
    sput-object v0, Lcom/xiaomi/push/hg;->a:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hg;->b:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hg;->c:Ll/m3r0;

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
    sput-object v0, Lcom/xiaomi/push/hg;->d:Ll/m3r0;

    .line 47
    .line 48
    new-instance v0, Ll/m3r0;

    .line 49
    .line 50
    const/4 v5, 0x6

    .line 51
    const/16 v6, 0xa

    .line 52
    .line 53
    invoke-direct {v0, v2, v6, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 54
    .line 55
    .line 56
    sput-object v0, Lcom/xiaomi/push/hg;->e:Ll/m3r0;

    .line 57
    .line 58
    new-instance v0, Ll/m3r0;

    .line 59
    .line 60
    const/4 v5, 0x7

    .line 61
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/xiaomi/push/hg;->f:Ll/m3r0;

    .line 65
    .line 66
    new-instance v0, Ll/m3r0;

    .line 67
    .line 68
    const/16 v5, 0x8

    .line 69
    .line 70
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/xiaomi/push/hg;->g:Ll/m3r0;

    .line 74
    .line 75
    new-instance v0, Ll/m3r0;

    .line 76
    .line 77
    const/16 v7, 0x9

    .line 78
    .line 79
    invoke-direct {v0, v2, v3, v7}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 80
    .line 81
    .line 82
    sput-object v0, Lcom/xiaomi/push/hg;->h:Ll/m3r0;

    .line 83
    .line 84
    new-instance v0, Ll/m3r0;

    .line 85
    .line 86
    invoke-direct {v0, v2, v3, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lcom/xiaomi/push/hg;->i:Ll/m3r0;

    .line 90
    .line 91
    new-instance v0, Ll/m3r0;

    .line 92
    .line 93
    invoke-direct {v0, v2, v6, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 94
    .line 95
    .line 96
    sput-object v0, Lcom/xiaomi/push/hg;->j:Ll/m3r0;

    .line 97
    .line 98
    new-instance v0, Ll/m3r0;

    .line 99
    .line 100
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/xiaomi/push/hg;->k:Ll/m3r0;

    .line 104
    .line 105
    new-instance v0, Ll/m3r0;

    .line 106
    .line 107
    const/16 v1, 0xd

    .line 108
    .line 109
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/xiaomi/push/hg;->l:Ll/m3r0;

    .line 113
    .line 114
    new-instance v0, Ll/m3r0;

    .line 115
    .line 116
    const/16 v1, 0xe

    .line 117
    .line 118
    invoke-direct {v0, v2, v6, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 119
    .line 120
    .line 121
    sput-object v0, Lcom/xiaomi/push/hg;->m:Ll/m3r0;

    .line 122
    .line 123
    new-instance v0, Ll/m3r0;

    .line 124
    .line 125
    const/16 v1, 0xf

    .line 126
    .line 127
    invoke-direct {v0, v2, v3, v1}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 128
    .line 129
    .line 130
    sput-object v0, Lcom/xiaomi/push/hg;->n:Ll/m3r0;

    .line 131
    .line 132
    new-instance v0, Ll/m3r0;

    .line 133
    .line 134
    const/16 v6, 0x10

    .line 135
    .line 136
    invoke-direct {v0, v2, v5, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 137
    .line 138
    .line 139
    sput-object v0, Lcom/xiaomi/push/hg;->o:Ll/m3r0;

    .line 140
    .line 141
    new-instance v0, Ll/m3r0;

    .line 142
    .line 143
    const/16 v6, 0x11

    .line 144
    .line 145
    invoke-direct {v0, v2, v3, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 146
    .line 147
    .line 148
    sput-object v0, Lcom/xiaomi/push/hg;->p:Ll/m3r0;

    .line 149
    .line 150
    new-instance v0, Ll/m3r0;

    .line 151
    .line 152
    const/16 v6, 0x12

    .line 153
    .line 154
    invoke-direct {v0, v2, v5, v6}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 155
    .line 156
    .line 157
    sput-object v0, Lcom/xiaomi/push/hg;->q:Ll/m3r0;

    .line 158
    .line 159
    new-instance v0, Ll/m3r0;

    .line 160
    .line 161
    const/16 v5, 0x13

    .line 162
    .line 163
    invoke-direct {v0, v2, v3, v5}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 164
    .line 165
    .line 166
    sput-object v0, Lcom/xiaomi/push/hg;->r:Ll/m3r0;

    .line 167
    .line 168
    new-instance v0, Ll/m3r0;

    .line 169
    .line 170
    const/16 v3, 0x14

    .line 171
    .line 172
    invoke-direct {v0, v2, v4, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Lcom/xiaomi/push/hg;->s:Ll/m3r0;

    .line 176
    .line 177
    new-instance v0, Ll/m3r0;

    .line 178
    .line 179
    const/16 v3, 0x15

    .line 180
    .line 181
    invoke-direct {v0, v2, v1, v3}, Ll/m3r0;-><init>(Ljava/lang/String;BS)V

    .line 182
    .line 183
    .line 184
    sput-object v0, Lcom/xiaomi/push/hg;->t:Ll/m3r0;

    .line 185
    .line 186
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
    const/4 v1, 0x6

    .line 7
    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/xiaomi/push/hg;->a:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/hg;)I
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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->a()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, p1, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->b()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->b()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->b()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    .line 106
    .line 107
    iget-object v1, p1, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->c()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->c()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    iget-object v0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v1, p1, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->d()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->d()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-eqz v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p1, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->e()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->e()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->e()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->a:J

    .line 226
    .line 227
    iget-wide v2, p1, Lcom/xiaomi/push/hg;->a:J

    .line 228
    .line 229
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->f()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->f()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->f()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_c

    .line 264
    .line 265
    iget-object v0, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v1, p1, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->g()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->g()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->g()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_e

    .line 304
    .line 305
    iget-object v0, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v1, p1, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->h()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->h()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->h()Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object v0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    .line 346
    .line 347
    iget-object v1, p1, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->i()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->i()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->i()Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_12

    .line 384
    .line 385
    iget-object v0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    .line 386
    .line 387
    iget-object v1, p1, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->j()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->j()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->j()Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_14

    .line 424
    .line 425
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->b:J

    .line 426
    .line 427
    iget-wide v2, p1, Lcom/xiaomi/push/hg;->b:J

    .line 428
    .line 429
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->k()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->k()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->k()Z

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    if-eqz v0, :cond_16

    .line 464
    .line 465
    iget-object v0, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    .line 466
    .line 467
    iget-object v1, p1, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->l()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->l()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->l()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-eqz v0, :cond_18

    .line 504
    .line 505
    iget-object v0, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    .line 506
    .line 507
    iget-object v1, p1, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->m()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->m()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->m()Z

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    if-eqz v0, :cond_1a

    .line 544
    .line 545
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->c:J

    .line 546
    .line 547
    iget-wide v2, p1, Lcom/xiaomi/push/hg;->c:J

    .line 548
    .line 549
    invoke-static {v0, v1, v2, v3}, Ll/k3r0;->c(JJ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->n()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->n()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->n()Z

    .line 580
    .line 581
    .line 582
    move-result v0

    .line 583
    if-eqz v0, :cond_1c

    .line 584
    .line 585
    iget-object v0, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    .line 586
    .line 587
    iget-object v1, p1, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    .line 588
    .line 589
    invoke-static {v0, v1}, Ll/k3r0;->e(Ljava/lang/String;Ljava/lang/String;)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->o()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->o()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->o()Z

    .line 620
    .line 621
    .line 622
    move-result v0

    .line 623
    if-eqz v0, :cond_1e

    .line 624
    .line 625
    iget v0, p0, Lcom/xiaomi/push/hg;->a:I

    .line 626
    .line 627
    iget v1, p1, Lcom/xiaomi/push/hg;->a:I

    .line 628
    .line 629
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->p()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->p()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->p()Z

    .line 660
    .line 661
    .line 662
    move-result v0

    .line 663
    if-eqz v0, :cond_20

    .line 664
    .line 665
    iget-object v0, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    .line 666
    .line 667
    iget-object v1, p1, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->q()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->q()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->q()Z

    .line 700
    .line 701
    .line 702
    move-result v0

    .line 703
    if-eqz v0, :cond_22

    .line 704
    .line 705
    iget v0, p0, Lcom/xiaomi/push/hg;->b:I

    .line 706
    .line 707
    iget v1, p1, Lcom/xiaomi/push/hg;->b:I

    .line 708
    .line 709
    invoke-static {v0, v1}, Ll/k3r0;->b(II)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->r()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->r()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->r()Z

    .line 740
    .line 741
    .line 742
    move-result v0

    .line 743
    if-eqz v0, :cond_24

    .line 744
    .line 745
    iget-object v0, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    .line 746
    .line 747
    iget-object v1, p1, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->s()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->s()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->s()Z

    .line 780
    .line 781
    .line 782
    move-result v0

    .line 783
    if-eqz v0, :cond_26

    .line 784
    .line 785
    iget-boolean v0, p0, Lcom/xiaomi/push/hg;->a:Z

    .line 786
    .line 787
    iget-boolean v1, p1, Lcom/xiaomi/push/hg;->a:Z

    .line 788
    .line 789
    invoke-static {v0, v1}, Ll/k3r0;->k(ZZ)I

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->t()Z

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
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->t()Z

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->t()Z

    .line 820
    .line 821
    .line 822
    move-result v0

    .line 823
    if-eqz v0, :cond_28

    .line 824
    .line 825
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 826
    .line 827
    iget-object p1, p1, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 828
    .line 829
    invoke-static {p0, p1}, Ll/k3r0;->g(Ljava/util/List;Ljava/util/List;)I

    .line 830
    .line 831
    .line 832
    move-result p0

    .line 833
    if-eqz p0, :cond_28

    .line 834
    .line 835
    return p0

    .line 836
    :cond_28
    const/4 p0, 0x0

    .line 837
    return p0
.end method

.method public a()J
    .locals 2

    .line 839
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->a:J

    return-wide v0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 838
    iget-object p0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    return-object p0
.end method

.method public a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 841
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    return-object p0
.end method

.method public a()V
    .locals 3

    .line 963
    iget-object v0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 964
    iget-object v0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-void

    .line 965
    :cond_0
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'appId\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0

    .line 966
    :cond_1
    new-instance v0, Lcom/xiaomi/push/ib;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Required field \'id\' was not present! Struct: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ll/w3r0;)V
    .locals 6

    .line 901
    invoke-virtual {p1}, Ll/w3r0;->k()Ll/z3r0;

    .line 902
    :goto_0
    invoke-virtual {p1}, Ll/w3r0;->g()Ll/m3r0;

    move-result-object v0

    .line 903
    iget-byte v1, v0, Ll/m3r0;->b:B

    if-nez v1, :cond_1

    .line 904
    invoke-virtual {p1}, Ll/w3r0;->D()V

    .line 905
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->e()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 906
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()V

    return-void

    .line 907
    :cond_0
    new-instance p1, Lcom/xiaomi/push/ib;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Required field \'errorCode\' was not found in serialized data! Struct: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/xiaomi/push/ib;-><init>(Ljava/lang/String;)V

    throw p1

    .line 908
    :cond_1
    iget-short v0, v0, Ll/m3r0;->c:S

    const/16 v2, 0x8

    const/16 v3, 0xa

    const/4 v4, 0x1

    const/16 v5, 0xb

    packed-switch v0, :pswitch_data_0

    .line 909
    :pswitch_0
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_1
    const/16 v0, 0xf

    if-ne v1, v0, :cond_3

    .line 910
    invoke-virtual {p1}, Ll/w3r0;->h()Ll/n3r0;

    move-result-object v0

    .line 911
    new-instance v1, Ljava/util/ArrayList;

    iget v2, v0, Ll/n3r0;->b:I

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    const/4 v1, 0x0

    .line 912
    :goto_1
    iget v2, v0, Ll/n3r0;->b:I

    if-ge v1, v2, :cond_2

    .line 913
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v2

    .line 914
    iget-object v3, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 915
    :cond_2
    invoke-virtual {p1}, Ll/w3r0;->G()V

    goto/16 :goto_2

    .line 916
    :cond_3
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_2
    const/4 v0, 0x2

    if-ne v1, v0, :cond_4

    .line 917
    invoke-virtual {p1}, Ll/w3r0;->y()Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/push/hg;->a:Z

    .line 918
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->f(Z)V

    goto/16 :goto_2

    .line 919
    :cond_4
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_3
    if-ne v1, v5, :cond_5

    .line 920
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    goto/16 :goto_2

    .line 921
    :cond_5
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_4
    if-ne v1, v2, :cond_6

    .line 922
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/hg;->b:I

    .line 923
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->e(Z)V

    goto/16 :goto_2

    .line 924
    :cond_6
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_5
    if-ne v1, v5, :cond_7

    .line 925
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    goto/16 :goto_2

    .line 926
    :cond_7
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_6
    if-ne v1, v2, :cond_8

    .line 927
    invoke-virtual {p1}, Ll/w3r0;->c()I

    move-result v0

    iput v0, p0, Lcom/xiaomi/push/hg;->a:I

    .line 928
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->d(Z)V

    goto/16 :goto_2

    .line 929
    :cond_8
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_7
    if-ne v1, v5, :cond_9

    .line 930
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    goto/16 :goto_2

    .line 931
    :cond_9
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_8
    if-ne v1, v3, :cond_a

    .line 932
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/hg;->c:J

    .line 933
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->c(Z)V

    goto/16 :goto_2

    .line 934
    :cond_a
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_9
    if-ne v1, v5, :cond_b

    .line 935
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    goto/16 :goto_2

    .line 936
    :cond_b
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_a
    if-ne v1, v5, :cond_c

    .line 937
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    goto/16 :goto_2

    .line 938
    :cond_c
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_b
    if-ne v1, v3, :cond_d

    .line 939
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/hg;->b:J

    .line 940
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->b(Z)V

    goto/16 :goto_2

    .line 941
    :cond_d
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_c
    if-ne v1, v5, :cond_e

    .line 942
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    goto/16 :goto_2

    .line 943
    :cond_e
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_d
    if-ne v1, v5, :cond_f

    .line 944
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    goto/16 :goto_2

    .line 945
    :cond_f
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto/16 :goto_2

    :pswitch_e
    if-ne v1, v5, :cond_10

    .line 946
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    goto :goto_2

    .line 947
    :cond_10
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_f
    if-ne v1, v5, :cond_11

    .line 948
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    goto :goto_2

    .line 949
    :cond_11
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_10
    if-ne v1, v3, :cond_12

    .line 950
    invoke-virtual {p1}, Ll/w3r0;->d()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/hg;->a:J

    .line 951
    invoke-virtual {p0, v4}, Lcom/xiaomi/push/hg;->a(Z)V

    goto :goto_2

    .line 952
    :cond_12
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_11
    if-ne v1, v5, :cond_13

    .line 953
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    goto :goto_2

    .line 954
    :cond_13
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_12
    if-ne v1, v5, :cond_14

    .line 955
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    goto :goto_2

    .line 956
    :cond_14
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_13
    const/16 v0, 0xc

    if-ne v1, v0, :cond_15

    .line 957
    new-instance v0, Lcom/xiaomi/push/gu;

    invoke-direct {v0}, Lcom/xiaomi/push/gu;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    .line 958
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gu;->a(Ll/w3r0;)V

    goto :goto_2

    .line 959
    :cond_15
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    goto :goto_2

    :pswitch_14
    if-ne v1, v5, :cond_16

    .line 960
    invoke-virtual {p1}, Ll/w3r0;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    goto :goto_2

    .line 961
    :cond_16
    invoke-static {p1, v1}, Ll/x3r0;->a(Ll/w3r0;B)V

    .line 962
    :goto_2
    invoke-virtual {p1}, Ll/w3r0;->E()V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_0
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
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public a(Z)V
    .locals 1

    .line 840
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 900
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a(Lcom/xiaomi/push/hg;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 842
    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()Z

    move-result v1

    .line 843
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->a()Z

    move-result v2

    if-nez v1, :cond_1

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v1, :cond_3b

    if-nez v2, :cond_2

    goto/16 :goto_0

    .line 844
    :cond_2
    iget-object v1, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 845
    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->b()Z

    move-result v1

    .line 846
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->b()Z

    move-result v2

    if-nez v1, :cond_4

    if-eqz v2, :cond_6

    :cond_4
    if-eqz v1, :cond_3b

    if-nez v2, :cond_5

    goto/16 :goto_0

    .line 847
    :cond_5
    iget-object v1, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/gu;->a(Lcom/xiaomi/push/gu;)Z

    move-result v1

    if-nez v1, :cond_6

    return v0

    .line 848
    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->c()Z

    move-result v1

    .line 849
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->c()Z

    move-result v2

    if-nez v1, :cond_7

    if-eqz v2, :cond_9

    :cond_7
    if-eqz v1, :cond_3b

    if-nez v2, :cond_8

    goto/16 :goto_0

    .line 850
    :cond_8
    iget-object v1, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v0

    .line 851
    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->d()Z

    move-result v1

    .line 852
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->d()Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_c

    :cond_a
    if-eqz v1, :cond_3b

    if-nez v2, :cond_b

    goto/16 :goto_0

    .line 853
    :cond_b
    iget-object v1, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v0

    .line 854
    :cond_c
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->a:J

    iget-wide v3, p1, Lcom/xiaomi/push/hg;->a:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_d

    return v0

    .line 855
    :cond_d
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->f()Z

    move-result v1

    .line 856
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->f()Z

    move-result v2

    if-nez v1, :cond_e

    if-eqz v2, :cond_10

    :cond_e
    if-eqz v1, :cond_3b

    if-nez v2, :cond_f

    goto/16 :goto_0

    .line 857
    :cond_f
    iget-object v1, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    return v0

    .line 858
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->g()Z

    move-result v1

    .line 859
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->g()Z

    move-result v2

    if-nez v1, :cond_11

    if-eqz v2, :cond_13

    :cond_11
    if-eqz v1, :cond_3b

    if-nez v2, :cond_12

    goto/16 :goto_0

    .line 860
    :cond_12
    iget-object v1, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    return v0

    .line 861
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->h()Z

    move-result v1

    .line 862
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->h()Z

    move-result v2

    if-nez v1, :cond_14

    if-eqz v2, :cond_16

    :cond_14
    if-eqz v1, :cond_3b

    if-nez v2, :cond_15

    goto/16 :goto_0

    .line 863
    :cond_15
    iget-object v1, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    return v0

    .line 864
    :cond_16
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->i()Z

    move-result v1

    .line 865
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->i()Z

    move-result v2

    if-nez v1, :cond_17

    if-eqz v2, :cond_19

    :cond_17
    if-eqz v1, :cond_3b

    if-nez v2, :cond_18

    goto/16 :goto_0

    .line 866
    :cond_18
    iget-object v1, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    return v0

    .line 867
    :cond_19
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->j()Z

    move-result v1

    .line 868
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->j()Z

    move-result v2

    if-nez v1, :cond_1a

    if-eqz v2, :cond_1c

    :cond_1a
    if-eqz v1, :cond_3b

    if-nez v2, :cond_1b

    goto/16 :goto_0

    .line 869
    :cond_1b
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->b:J

    iget-wide v3, p1, Lcom/xiaomi/push/hg;->b:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1c

    return v0

    .line 870
    :cond_1c
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->k()Z

    move-result v1

    .line 871
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->k()Z

    move-result v2

    if-nez v1, :cond_1d

    if-eqz v2, :cond_1f

    :cond_1d
    if-eqz v1, :cond_3b

    if-nez v2, :cond_1e

    goto/16 :goto_0

    .line 872
    :cond_1e
    iget-object v1, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    return v0

    .line 873
    :cond_1f
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->l()Z

    move-result v1

    .line 874
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->l()Z

    move-result v2

    if-nez v1, :cond_20

    if-eqz v2, :cond_22

    :cond_20
    if-eqz v1, :cond_3b

    if-nez v2, :cond_21

    goto/16 :goto_0

    .line 875
    :cond_21
    iget-object v1, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v0

    .line 876
    :cond_22
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->m()Z

    move-result v1

    .line 877
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->m()Z

    move-result v2

    if-nez v1, :cond_23

    if-eqz v2, :cond_25

    :cond_23
    if-eqz v1, :cond_3b

    if-nez v2, :cond_24

    goto/16 :goto_0

    .line 878
    :cond_24
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->c:J

    iget-wide v3, p1, Lcom/xiaomi/push/hg;->c:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_25

    return v0

    .line 879
    :cond_25
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->n()Z

    move-result v1

    .line 880
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->n()Z

    move-result v2

    if-nez v1, :cond_26

    if-eqz v2, :cond_28

    :cond_26
    if-eqz v1, :cond_3b

    if-nez v2, :cond_27

    goto/16 :goto_0

    .line 881
    :cond_27
    iget-object v1, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    return v0

    .line 882
    :cond_28
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->o()Z

    move-result v1

    .line 883
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->o()Z

    move-result v2

    if-nez v1, :cond_29

    if-eqz v2, :cond_2b

    :cond_29
    if-eqz v1, :cond_3b

    if-nez v2, :cond_2a

    goto/16 :goto_0

    .line 884
    :cond_2a
    iget v1, p0, Lcom/xiaomi/push/hg;->a:I

    iget v2, p1, Lcom/xiaomi/push/hg;->a:I

    if-eq v1, v2, :cond_2b

    return v0

    .line 885
    :cond_2b
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->p()Z

    move-result v1

    .line 886
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->p()Z

    move-result v2

    if-nez v1, :cond_2c

    if-eqz v2, :cond_2e

    :cond_2c
    if-eqz v1, :cond_3b

    if-nez v2, :cond_2d

    goto/16 :goto_0

    .line 887
    :cond_2d
    iget-object v1, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2e

    return v0

    .line 888
    :cond_2e
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->q()Z

    move-result v1

    .line 889
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->q()Z

    move-result v2

    if-nez v1, :cond_2f

    if-eqz v2, :cond_31

    :cond_2f
    if-eqz v1, :cond_3b

    if-nez v2, :cond_30

    goto :goto_0

    .line 890
    :cond_30
    iget v1, p0, Lcom/xiaomi/push/hg;->b:I

    iget v2, p1, Lcom/xiaomi/push/hg;->b:I

    if-eq v1, v2, :cond_31

    return v0

    .line 891
    :cond_31
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->r()Z

    move-result v1

    .line 892
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->r()Z

    move-result v2

    if-nez v1, :cond_32

    if-eqz v2, :cond_34

    :cond_32
    if-eqz v1, :cond_3b

    if-nez v2, :cond_33

    goto :goto_0

    .line 893
    :cond_33
    iget-object v1, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    iget-object v2, p1, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v0

    .line 894
    :cond_34
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->s()Z

    move-result v1

    .line 895
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->s()Z

    move-result v2

    if-nez v1, :cond_35

    if-eqz v2, :cond_37

    :cond_35
    if-eqz v1, :cond_3b

    if-nez v2, :cond_36

    goto :goto_0

    .line 896
    :cond_36
    iget-boolean v1, p0, Lcom/xiaomi/push/hg;->a:Z

    iget-boolean v2, p1, Lcom/xiaomi/push/hg;->a:Z

    if-eq v1, v2, :cond_37

    return v0

    .line 897
    :cond_37
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->t()Z

    move-result v1

    .line 898
    invoke-virtual {p1}, Lcom/xiaomi/push/hg;->t()Z

    move-result v2

    if-nez v1, :cond_38

    if-eqz v2, :cond_3a

    :cond_38
    if-eqz v1, :cond_3b

    if-nez v2, :cond_39

    goto :goto_0

    .line 899
    :cond_39
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    iget-object p1, p1, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3a

    return v0

    :cond_3a
    const/4 p0, 0x1

    return p0

    :cond_3b
    :goto_0
    return v0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 470
    iget-object p0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    return-object p0
.end method

.method public b(Ll/w3r0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/xiaomi/push/hg;->a:Ll/z3r0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/w3r0;->v(Ll/z3r0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/xiaomi/push/hg;->a:Ll/m3r0;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget-object v0, Lcom/xiaomi/push/hg;->b:Ll/m3r0;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

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
    iget-object v0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Lcom/xiaomi/push/hg;->c:Ll/m3r0;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget-object v0, Lcom/xiaomi/push/hg;->d:Ll/m3r0;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

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
    sget-object v0, Lcom/xiaomi/push/hg;->e:Ll/m3r0;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 92
    .line 93
    .line 94
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->a:J

    .line 95
    .line 96
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->f()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    sget-object v0, Lcom/xiaomi/push/hg;->f:Ll/m3r0;

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v0, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->g()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    sget-object v0, Lcom/xiaomi/push/hg;->g:Ll/m3r0;

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 146
    .line 147
    .line 148
    :cond_5
    iget-object v0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    .line 149
    .line 150
    if-eqz v0, :cond_6

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->h()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_6

    .line 157
    .line 158
    sget-object v0, Lcom/xiaomi/push/hg;->h:Ll/m3r0;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 169
    .line 170
    .line 171
    :cond_6
    iget-object v0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz v0, :cond_7

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->i()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_7

    .line 180
    .line 181
    sget-object v0, Lcom/xiaomi/push/hg;->i:Ll/m3r0;

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 192
    .line 193
    .line 194
    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->j()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_8

    .line 199
    .line 200
    sget-object v0, Lcom/xiaomi/push/hg;->j:Ll/m3r0;

    .line 201
    .line 202
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 203
    .line 204
    .line 205
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->b:J

    .line 206
    .line 207
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 211
    .line 212
    .line 213
    :cond_8
    iget-object v0, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz v0, :cond_9

    .line 216
    .line 217
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->k()Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_9

    .line 222
    .line 223
    sget-object v0, Lcom/xiaomi/push/hg;->k:Ll/m3r0;

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 234
    .line 235
    .line 236
    :cond_9
    iget-object v0, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    .line 237
    .line 238
    if-eqz v0, :cond_a

    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->l()Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_a

    .line 245
    .line 246
    sget-object v0, Lcom/xiaomi/push/hg;->l:Ll/m3r0;

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 257
    .line 258
    .line 259
    :cond_a
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->m()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_b

    .line 264
    .line 265
    sget-object v0, Lcom/xiaomi/push/hg;->m:Ll/m3r0;

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 268
    .line 269
    .line 270
    iget-wide v0, p0, Lcom/xiaomi/push/hg;->c:J

    .line 271
    .line 272
    invoke-virtual {p1, v0, v1}, Ll/w3r0;->p(J)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 276
    .line 277
    .line 278
    :cond_b
    iget-object v0, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    .line 279
    .line 280
    if-eqz v0, :cond_c

    .line 281
    .line 282
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->n()Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-eqz v0, :cond_c

    .line 287
    .line 288
    sget-object v0, Lcom/xiaomi/push/hg;->n:Ll/m3r0;

    .line 289
    .line 290
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    .line 294
    .line 295
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 299
    .line 300
    .line 301
    :cond_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->o()Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-eqz v0, :cond_d

    .line 306
    .line 307
    sget-object v0, Lcom/xiaomi/push/hg;->o:Ll/m3r0;

    .line 308
    .line 309
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 310
    .line 311
    .line 312
    iget v0, p0, Lcom/xiaomi/push/hg;->a:I

    .line 313
    .line 314
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 318
    .line 319
    .line 320
    :cond_d
    iget-object v0, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    .line 321
    .line 322
    if-eqz v0, :cond_e

    .line 323
    .line 324
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->p()Z

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    if-eqz v0, :cond_e

    .line 329
    .line 330
    sget-object v0, Lcom/xiaomi/push/hg;->p:Ll/m3r0;

    .line 331
    .line 332
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 341
    .line 342
    .line 343
    :cond_e
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->q()Z

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    if-eqz v0, :cond_f

    .line 348
    .line 349
    sget-object v0, Lcom/xiaomi/push/hg;->q:Ll/m3r0;

    .line 350
    .line 351
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 352
    .line 353
    .line 354
    iget v0, p0, Lcom/xiaomi/push/hg;->b:I

    .line 355
    .line 356
    invoke-virtual {p1, v0}, Ll/w3r0;->o(I)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 360
    .line 361
    .line 362
    :cond_f
    iget-object v0, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    .line 363
    .line 364
    if-eqz v0, :cond_10

    .line 365
    .line 366
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->r()Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_10

    .line 371
    .line 372
    sget-object v0, Lcom/xiaomi/push/hg;->r:Ll/m3r0;

    .line 373
    .line 374
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 375
    .line 376
    .line 377
    iget-object v0, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 383
    .line 384
    .line 385
    :cond_10
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->s()Z

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    if-eqz v0, :cond_11

    .line 390
    .line 391
    sget-object v0, Lcom/xiaomi/push/hg;->s:Ll/m3r0;

    .line 392
    .line 393
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 394
    .line 395
    .line 396
    iget-boolean v0, p0, Lcom/xiaomi/push/hg;->a:Z

    .line 397
    .line 398
    invoke-virtual {p1, v0}, Ll/w3r0;->x(Z)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 402
    .line 403
    .line 404
    :cond_11
    iget-object v0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 405
    .line 406
    if-eqz v0, :cond_13

    .line 407
    .line 408
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->t()Z

    .line 409
    .line 410
    .line 411
    move-result v0

    .line 412
    if-eqz v0, :cond_13

    .line 413
    .line 414
    sget-object v0, Lcom/xiaomi/push/hg;->t:Ll/m3r0;

    .line 415
    .line 416
    invoke-virtual {p1, v0}, Ll/w3r0;->s(Ll/m3r0;)V

    .line 417
    .line 418
    .line 419
    new-instance v0, Ll/n3r0;

    .line 420
    .line 421
    iget-object v1, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 422
    .line 423
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    const/16 v2, 0xb

    .line 428
    .line 429
    invoke-direct {v0, v2, v1}, Ll/n3r0;-><init>(BI)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {p1, v0}, Ll/w3r0;->t(Ll/n3r0;)V

    .line 433
    .line 434
    .line 435
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 436
    .line 437
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    if-eqz v0, :cond_12

    .line 446
    .line 447
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    check-cast v0, Ljava/lang/String;

    .line 452
    .line 453
    invoke-virtual {p1, v0}, Ll/w3r0;->q(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    goto :goto_0

    .line 457
    :cond_12
    invoke-virtual {p1}, Ll/w3r0;->C()V

    .line 458
    .line 459
    .line 460
    invoke-virtual {p1}, Ll/w3r0;->z()V

    .line 461
    .line 462
    .line 463
    :cond_13
    invoke-virtual {p1}, Ll/w3r0;->A()V

    .line 464
    .line 465
    .line 466
    invoke-virtual {p1}, Ll/w3r0;->m()V

    .line 467
    .line 468
    .line 469
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 471
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public b()Z
    .locals 0

    .line 472
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    return-object p0
.end method

.method public c(Z)V
    .locals 1

    .line 10
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

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
    check-cast p1, Lcom/xiaomi/push/hg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hg;->a(Lcom/xiaomi/push/hg;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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
    instance-of v1, p1, Lcom/xiaomi/push/hg;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/xiaomi/push/hg;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/hg;->a(Lcom/xiaomi/push/hg;)Z

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

.method public f(Z)V
    .locals 1

    .line 9
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1}, Ljava/util/BitSet;->set(IZ)V

    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

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

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->f:Ljava/lang/String;

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

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

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

.method public o()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/BitSet;

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

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

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
    const-string v1, "XmPushActionRegistrationResult("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->a()Z

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
    iget-object v1, p0, Lcom/xiaomi/push/hg;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->b()Z

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
    iget-object v1, p0, Lcom/xiaomi/push/hg;->a:Lcom/xiaomi/push/gu;

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
    iget-object v1, p0, Lcom/xiaomi/push/hg;->b:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/xiaomi/push/hg;->c:Ljava/lang/String;

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
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v1, "errorCode:"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->a:J

    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->f()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_9

    .line 129
    .line 130
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "reason:"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lcom/xiaomi/push/hg;->d:Ljava/lang/String;

    .line 139
    .line 140
    if-nez v1, :cond_8

    .line 141
    .line 142
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    :cond_9
    :goto_5
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->g()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v1, "regId:"

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/xiaomi/push/hg;->e:Ljava/lang/String;

    .line 164
    .line 165
    if-nez v1, :cond_a

    .line 166
    .line 167
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    :cond_b
    :goto_6
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->i()Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "packageName:"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Lcom/xiaomi/push/hg;->g:Ljava/lang/String;

    .line 189
    .line 190
    if-nez v1, :cond_c

    .line 191
    .line 192
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    goto :goto_7

    .line 196
    :cond_c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    :cond_d
    :goto_7
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->j()Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_e

    .line 204
    .line 205
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v1, "registeredAt:"

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->b:J

    .line 214
    .line 215
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    :cond_e
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->k()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_10

    .line 223
    .line 224
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v1, "aliasName:"

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    iget-object v1, p0, Lcom/xiaomi/push/hg;->h:Ljava/lang/String;

    .line 233
    .line 234
    if-nez v1, :cond_f

    .line 235
    .line 236
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    goto :goto_8

    .line 240
    :cond_f
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    :cond_10
    :goto_8
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->l()Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    if-eqz v1, :cond_12

    .line 248
    .line 249
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string v1, "clientId:"

    .line 253
    .line 254
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget-object v1, p0, Lcom/xiaomi/push/hg;->i:Ljava/lang/String;

    .line 258
    .line 259
    if-nez v1, :cond_11

    .line 260
    .line 261
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    goto :goto_9

    .line 265
    :cond_11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    :cond_12
    :goto_9
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->m()Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_13

    .line 273
    .line 274
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v1, "costTime:"

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget-wide v1, p0, Lcom/xiaomi/push/hg;->c:J

    .line 283
    .line 284
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    :cond_13
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->n()Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eqz v1, :cond_15

    .line 292
    .line 293
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    const-string v1, "appVersion:"

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    iget-object v1, p0, Lcom/xiaomi/push/hg;->j:Ljava/lang/String;

    .line 302
    .line 303
    if-nez v1, :cond_14

    .line 304
    .line 305
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    goto :goto_a

    .line 309
    :cond_14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    :cond_15
    :goto_a
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->o()Z

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    if-eqz v1, :cond_16

    .line 317
    .line 318
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    const-string v1, "pushSdkVersionCode:"

    .line 322
    .line 323
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    iget v1, p0, Lcom/xiaomi/push/hg;->a:I

    .line 327
    .line 328
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    :cond_16
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->p()Z

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    if-eqz v1, :cond_18

    .line 336
    .line 337
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    const-string v1, "hybridPushEndpoint:"

    .line 341
    .line 342
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    iget-object v1, p0, Lcom/xiaomi/push/hg;->k:Ljava/lang/String;

    .line 346
    .line 347
    if-nez v1, :cond_17

    .line 348
    .line 349
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    goto :goto_b

    .line 353
    :cond_17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    :cond_18
    :goto_b
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->q()Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-eqz v1, :cond_19

    .line 361
    .line 362
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    const-string v1, "appVersionCode:"

    .line 366
    .line 367
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget v1, p0, Lcom/xiaomi/push/hg;->b:I

    .line 371
    .line 372
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    :cond_19
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->r()Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    if-eqz v1, :cond_1b

    .line 380
    .line 381
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    const-string v1, "region:"

    .line 385
    .line 386
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    iget-object v1, p0, Lcom/xiaomi/push/hg;->l:Ljava/lang/String;

    .line 390
    .line 391
    if-nez v1, :cond_1a

    .line 392
    .line 393
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    goto :goto_c

    .line 397
    :cond_1a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    :cond_1b
    :goto_c
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->s()Z

    .line 401
    .line 402
    .line 403
    move-result v1

    .line 404
    if-eqz v1, :cond_1c

    .line 405
    .line 406
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string v1, "isHybridFrame:"

    .line 410
    .line 411
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    iget-boolean v1, p0, Lcom/xiaomi/push/hg;->a:Z

    .line 415
    .line 416
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    :cond_1c
    invoke-virtual {p0}, Lcom/xiaomi/push/hg;->t()Z

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    if-eqz v1, :cond_1e

    .line 424
    .line 425
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    const-string v1, "autoMarkPkgs:"

    .line 429
    .line 430
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    iget-object p0, p0, Lcom/xiaomi/push/hg;->a:Ljava/util/List;

    .line 434
    .line 435
    if-nez p0, :cond_1d

    .line 436
    .line 437
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    goto :goto_d

    .line 441
    :cond_1d
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    :cond_1e
    :goto_d
    const-string p0, ")"

    .line 445
    .line 446
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    return-object p0
.end method
