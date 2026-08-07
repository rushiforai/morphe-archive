.class public final Ll/ko0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ko0$a;,
        Ll/ko0$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\r\u0018\u0000 *2\u00020\u0001:\u0002\u001f\u0012B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J-\u0010\r\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001d\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000f\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\'\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0019\u0010\u0019\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u0017\u001a\u00020\u0016H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001dR$\u0010$\u001a\u0004\u0018\u00010\u001e8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001f\u0010 \u001a\u0004\u0008\u001f\u0010!\"\u0004\u0008\"\u0010#R\"\u0010&\u001a\u00020\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010%\u001a\u0004\u0008&\u0010\'\"\u0004\u0008(\u0010)\u00a8\u0006+"
    }
    d2 = {
        "Ll/ko0;",
        "",
        "Ll/ap0;",
        "player",
        "<init>",
        "(Ll/ap0;)V",
        "Ll/wtl;",
        "fileContainer",
        "",
        "enableVersion1",
        "",
        "defaultVideoMode",
        "defaultFps",
        "e",
        "(Ll/wtl;ZII)I",
        "_videoWidth",
        "_videoHeight",
        "",
        "a",
        "(II)V",
        "c",
        "(Ll/wtl;II)Z",
        "",
        "boxHead",
        "Ll/ko0$a;",
        "d",
        "([B)Ll/ko0$a;",
        "Ll/ap0;",
        "getPlayer",
        "()Ll/ap0;",
        "Ll/jo0;",
        "b",
        "Ll/jo0;",
        "()Ll/jo0;",
        "setConfig",
        "(Ll/jo0;)V",
        "config",
        "Z",
        "isParsingConfig",
        "()Z",
        "setParsingConfig",
        "(Z)V",
        "Companion",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Ll/ko0$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/ap0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ll/jo0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ko0$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ko0$b;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/ko0;->Companion:Ll/ko0$b;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/ap0;)V
    .locals 0
    .param p1    # Ll/ap0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/ko0;->a:Ll/ap0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ko0;->b:Ll/jo0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jo0;->k()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/ko0;->b:Ll/jo0;

    .line 13
    .line 14
    if-eqz p0, :cond_5

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/jo0;->v(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/jo0;->u(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/jo0;->b()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x1

    .line 27
    const/4 v2, 0x2

    .line 28
    const/4 v3, 0x0

    .line 29
    if-eq v0, v1, :cond_4

    .line 30
    .line 31
    if-eq v0, v2, :cond_3

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    if-eq v0, v1, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    if-eq v0, v1, :cond_1

    .line 38
    .line 39
    div-int/2addr p1, v2

    .line 40
    invoke-virtual {p0, p1}, Ll/jo0;->w(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ll/jo0;->r(I)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/mi80;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-direct {p1, v3, v3, p2, v0}, Ll/mi80;-><init>(IIII)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/jo0;->n(Ll/mi80;)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ll/mi80;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-direct {p1, p2, v3, v0, v1}, Ll/mi80;-><init>(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ll/jo0;->t(Ll/mi80;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    invoke-virtual {p0, p1}, Ll/jo0;->w(I)V

    .line 84
    .line 85
    .line 86
    div-int/2addr p2, v2

    .line 87
    invoke-virtual {p0, p2}, Ll/jo0;->r(I)V

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/mi80;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-direct {p1, v3, v3, p2, v0}, Ll/mi80;-><init>(IIII)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Ll/jo0;->t(Ll/mi80;)V

    .line 104
    .line 105
    .line 106
    new-instance p1, Ll/mi80;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-direct {p1, v3, p2, v0, v1}, Ll/mi80;-><init>(IIII)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p1}, Ll/jo0;->n(Ll/mi80;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    div-int/2addr p1, v2

    .line 128
    invoke-virtual {p0, p1}, Ll/jo0;->w(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p2}, Ll/jo0;->r(I)V

    .line 132
    .line 133
    .line 134
    new-instance p1, Ll/mi80;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-direct {p1, v3, v3, p2, v0}, Ll/mi80;-><init>(IIII)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, p1}, Ll/jo0;->t(Ll/mi80;)V

    .line 148
    .line 149
    .line 150
    new-instance p1, Ll/mi80;

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-direct {p1, p2, v3, v0, v1}, Ll/mi80;-><init>(IIII)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, p1}, Ll/jo0;->n(Ll/mi80;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_3
    invoke-virtual {p0, p1}, Ll/jo0;->w(I)V

    .line 172
    .line 173
    .line 174
    div-int/2addr p2, v2

    .line 175
    invoke-virtual {p0, p2}, Ll/jo0;->r(I)V

    .line 176
    .line 177
    .line 178
    new-instance p1, Ll/mi80;

    .line 179
    .line 180
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-direct {p1, v3, v3, p2, v0}, Ll/mi80;-><init>(IIII)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ll/jo0;->n(Ll/mi80;)V

    .line 192
    .line 193
    .line 194
    new-instance p1, Ll/mi80;

    .line 195
    .line 196
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-direct {p1, v3, p2, v0, v1}, Ll/mi80;-><init>(IIII)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, p1}, Ll/jo0;->t(Ll/mi80;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_4
    div-int/2addr p1, v2

    .line 216
    invoke-virtual {p0, p1}, Ll/jo0;->w(I)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0, p2}, Ll/jo0;->r(I)V

    .line 220
    .line 221
    .line 222
    new-instance p1, Ll/mi80;

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    invoke-direct {p1, v3, v3, p2, v0}, Ll/mi80;-><init>(IIII)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0, p1}, Ll/jo0;->n(Ll/mi80;)V

    .line 236
    .line 237
    .line 238
    new-instance p1, Ll/mi80;

    .line 239
    .line 240
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    invoke-virtual {p0}, Ll/jo0;->j()I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    invoke-virtual {p0}, Ll/jo0;->d()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-direct {p1, p2, v3, v0, v1}, Ll/mi80;-><init>(IIII)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, p1}, Ll/jo0;->t(Ll/mi80;)V

    .line 256
    .line 257
    .line 258
    :cond_5
    return-void
.end method

.method public final b()Ll/jo0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ko0;->b:Ll/jo0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ll/wtl;II)Z
    .locals 9

    .line 1
    new-instance v0, Ll/jo0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jo0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ko0;->b:Ll/jo0;

    .line 7
    .line 8
    invoke-interface {p1}, Ll/wtl;->a()V

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    new-array v2, v1, [B

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    :goto_0
    const/4 v5, 0x0

    .line 18
    invoke-interface {p1, v2, v5, v1}, Ll/wtl;->read([BII)I

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    if-ne v6, v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ll/ko0;->d([B)Ll/ko0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    if-nez v6, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    const-string v7, "vapc"

    .line 32
    .line 33
    invoke-virtual {v6}, Ll/ko0$a;->b()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    invoke-virtual {v6, v3, v4}, Ll/ko0$a;->d(J)V

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-virtual {v6}, Ll/ko0$a;->a()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    int-to-long v7, v5

    .line 52
    add-long/2addr v3, v7

    .line 53
    invoke-virtual {v6}, Ll/ko0$a;->a()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    int-to-long v5, v5

    .line 58
    const-wide/16 v7, 0x8

    .line 59
    .line 60
    sub-long/2addr v5, v7

    .line 61
    invoke-interface {p1, v5, v6}, Ll/wtl;->skip(J)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    :goto_1
    const/4 v6, 0x0

    .line 66
    :goto_2
    if-nez v6, :cond_3

    .line 67
    .line 68
    sget-object p1, Ll/z0;->INSTANCE:Ll/z0;

    .line 69
    .line 70
    const-string v1, "AnimPlayer.AnimConfigManager"

    .line 71
    .line 72
    const-string v2, "vapc box head not found"

    .line 73
    .line 74
    invoke-virtual {p1, v1, v2}, Ll/z0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p1, 0x1

    .line 78
    invoke-virtual {v0, p1}, Ll/jo0;->o(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p2}, Ll/jo0;->p(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, p3}, Ll/jo0;->q(I)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/ko0;->a:Ll/ap0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/jo0;->c()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    invoke-virtual {p0, p2}, Ll/ap0;->x(I)V

    .line 94
    .line 95
    .line 96
    return p1

    .line 97
    :cond_3
    invoke-virtual {v6}, Ll/ko0$a;->a()I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    sub-int/2addr p2, v1

    .line 102
    new-array v1, p2, [B

    .line 103
    .line 104
    invoke-interface {p1, v1, v5, p2}, Ll/wtl;->read([BII)I

    .line 105
    .line 106
    .line 107
    invoke-interface {p1}, Ll/wtl;->b()V

    .line 108
    .line 109
    .line 110
    const-string p1, "UTF-8"

    .line 111
    .line 112
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    new-instance v2, Ljava/lang/String;

    .line 120
    .line 121
    invoke-direct {v2, v1, v5, p2, p1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Lorg/json/JSONObject;

    .line 125
    .line 126
    invoke-direct {p1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ll/jo0;->s(Lorg/json/JSONObject;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, p1}, Ll/jo0;->m(Lorg/json/JSONObject;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-lez p3, :cond_4

    .line 137
    .line 138
    invoke-virtual {v0, p3}, Ll/jo0;->q(I)V

    .line 139
    .line 140
    .line 141
    :cond_4
    iget-object p0, p0, Ll/ko0;->a:Ll/ap0;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/jo0;->c()I

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    invoke-virtual {p0, p2}, Ll/ap0;->x(I)V

    .line 148
    .line 149
    .line 150
    return p1
.end method

.method public final d([B)Ll/ko0$a;
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/16 v0, 0x8

    .line 3
    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ll/ko0$a;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/ko0$a;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    aget-byte v1, p1, v1

    .line 15
    .line 16
    and-int/lit16 v1, v1, 0xff

    .line 17
    .line 18
    shl-int/lit8 v1, v1, 0x18

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    aget-byte v2, p1, v2

    .line 22
    .line 23
    and-int/lit16 v2, v2, 0xff

    .line 24
    .line 25
    shl-int/lit8 v2, v2, 0x10

    .line 26
    .line 27
    or-int/2addr v1, v2

    .line 28
    const/4 v2, 0x2

    .line 29
    aget-byte v2, p1, v2

    .line 30
    .line 31
    and-int/lit16 v2, v2, 0xff

    .line 32
    .line 33
    shl-int/lit8 v0, v2, 0x8

    .line 34
    .line 35
    or-int/2addr v0, v1

    .line 36
    const/4 v1, 0x3

    .line 37
    aget-byte v1, p1, v1

    .line 38
    .line 39
    and-int/lit16 v1, v1, 0xff

    .line 40
    .line 41
    or-int/2addr v0, v1

    .line 42
    invoke-virtual {p0, v0}, Ll/ko0$a;->c(I)V

    .line 43
    .line 44
    .line 45
    const-string v0, "US-ASCII"

    .line 46
    .line 47
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    new-instance v1, Ljava/lang/String;

    .line 55
    .line 56
    const/4 v2, 0x4

    .line 57
    invoke-direct {v1, p1, v2, v2, v0}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ll/ko0$a;->e(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-object p0
.end method

.method public final e(Ll/wtl;ZII)I
    .locals 9
    .param p1    # Ll/wtl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "AnimPlayer.AnimConfigManager"

    .line 2
    .line 3
    const-string v1, "parseConfig cost="

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/16 v3, 0x2715

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    :try_start_0
    iput-boolean v2, p0, Ll/ko0;->c:Z

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v5

    .line 18
    invoke-virtual {p0, p1, p3, p4}, Ll/ko0;->c(Ll/wtl;II)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    sget-object p3, Ll/z0;->INSTANCE:Ll/z0;

    .line 23
    .line 24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v7

    .line 28
    sub-long/2addr v7, v5

    .line 29
    new-instance p4, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "ms enableVersion1="

    .line 38
    .line 39
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, " result="

    .line 46
    .line 47
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    invoke-virtual {p3, v0, p4}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    if-nez p1, :cond_0

    .line 61
    .line 62
    iput-boolean v4, p0, Ll/ko0;->c:Z

    .line 63
    .line 64
    return v3

    .line 65
    :catchall_0
    move-exception p1

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    iget-object p1, p0, Ll/ko0;->b:Ll/jo0;

    .line 68
    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/jo0;->k()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-ne p1, v2, :cond_1

    .line 76
    .line 77
    if-nez p2, :cond_1

    .line 78
    .line 79
    iput-boolean v4, p0, Ll/ko0;->c:Z

    .line 80
    .line 81
    return v3

    .line 82
    :cond_1
    iget-object p1, p0, Ll/ko0;->b:Ll/jo0;

    .line 83
    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p2, p0, Ll/ko0;->a:Ll/ap0;

    .line 87
    .line 88
    invoke-virtual {p2}, Ll/ap0;->j()Ll/bp0;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2, p1}, Ll/bp0;->b(Ll/jo0;)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    move p1, v4

    .line 98
    :goto_0
    iput-boolean v4, p0, Ll/ko0;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    return p1

    .line 101
    :goto_1
    sget-object p2, Ll/z0;->INSTANCE:Ll/z0;

    .line 102
    .line 103
    new-instance p3, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string p4, "parseConfig error "

    .line 106
    .line 107
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-virtual {p2, v0, p3, p1}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    iput-boolean v4, p0, Ll/ko0;->c:Z

    .line 121
    .line 122
    return v3
.end method
