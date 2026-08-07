.class public final Ll/tod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/esf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tod$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final o:[I

.field public static final p:Ll/tod$a;

.field public static final q:Ll/tod$a;


# instance fields
.field public b:Z

.field public c:Z

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:Lcom/google/common/collect/ImmutableList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public n:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/tod;->o:[I

    .line 9
    .line 10
    new-instance v0, Ll/tod$a;

    .line 11
    .line 12
    new-instance v1, Ll/rod;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/rod;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/tod$a;-><init>(Ll/tod$a$a;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/tod;->p:Ll/tod$a;

    .line 21
    .line 22
    new-instance v0, Ll/tod$a;

    .line 23
    .line 24
    new-instance v1, Ll/sod;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/sod;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {v0, v1}, Ll/tod$a;-><init>(Ll/tod$a$a;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ll/tod;->q:Ll/tod$a;

    .line 33
    .line 34
    return-void

    .line 35
    :array_0
    .array-data 4
        0x5
        0x4
        0xc
        0x8
        0x3
        0xa
        0x9
        0xb
        0x6
        0x2
        0x0
        0x1
        0x7
        0x10
        0xf
        0xe
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/tod;->k:I

    .line 6
    .line 7
    const v0, 0x1b8a0

    .line 8
    .line 9
    .line 10
    iput v0, p0, Ll/tod;->n:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d()Ljava/lang/reflect/Constructor;
    .locals 1

    .line 1
    invoke-static {}, Ll/tod;->g()Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic e()Ljava/lang/reflect/Constructor;
    .locals 1

    .line 1
    invoke-static {}, Ll/tod;->h()Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public static g()Ljava/lang/reflect/Constructor;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Ll/zrf;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const-string v1, "com.google.android.exoplayer2.ext.flac.FlacLibrary"

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "isAvailable"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string v0, "com.google.android.exoplayer2.ext.flac.FlacExtractor"

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-class v1, Ll/zrf;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 39
    .line 40
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    return-object v0

    .line 49
    :cond_0
    return-object v3
.end method

.method public static h()Ljava/lang/reflect/Constructor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Ll/zrf;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 1
    const-string v0, "com.google.android.exoplayer2.decoder.midi.MidiExtractor"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-class v1, Ll/zrf;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    return-object v0
.end method


# virtual methods
.method public declared-synchronized a(Landroid/net/Uri;Ljava/util/Map;)[Ll/zrf;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)[",
            "Ll/zrf;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 3
    .line 4
    sget-object v1, Ll/tod;->o:[I

    .line 5
    .line 6
    array-length v2, v1

    .line 7
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/eki;->b(Ljava/util/Map;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v2, -0x1

    .line 15
    if-eq p2, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p2, v0}, Ll/tod;->f(ILjava/util/List;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_2

    .line 23
    :cond_0
    :goto_0
    invoke-static {p1}, Ll/eki;->c(Landroid/net/Uri;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eq p1, v2, :cond_1

    .line 28
    .line 29
    if-eq p1, p2, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p1, v0}, Ll/tod;->f(ILjava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    array-length v2, v1

    .line 35
    const/4 v3, 0x0

    .line 36
    :goto_1
    if-ge v3, v2, :cond_3

    .line 37
    .line 38
    aget v4, v1, v3

    .line 39
    .line 40
    if-eq v4, p2, :cond_2

    .line 41
    .line 42
    if-eq v4, p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0, v4, v0}, Ll/tod;->f(ILjava/util/List;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    new-array p1, p1, [Ll/zrf;

    .line 55
    .line 56
    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, [Ll/zrf;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    return-object p1

    .line 64
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw p1
.end method

.method public declared-synchronized b()[Ll/zrf;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 3
    .line 4
    new-instance v1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/tod;->a(Landroid/net/Uri;Ljava/util/Map;)[Ll/zrf;

    .line 10
    .line 11
    .line 12
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    monitor-exit p0

    .line 14
    return-object v0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw v0
.end method

.method public final f(ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/zrf;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    goto :goto_0

    .line 7
    :pswitch_1
    new-instance p0, Ll/tp1;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/tp1;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_2
    sget-object p0, Ll/tod;->q:Ll/tod$a;

    .line 17
    .line 18
    new-array p1, v1, [Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/tod$a;->a([Ljava/lang/Object;)Ll/zrf;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    :goto_0
    return-void

    .line 30
    :pswitch_3
    new-instance p0, Ll/vpq;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/vpq;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_4
    new-instance p0, Ll/lpp0;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/lpp0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_5
    iget-object p1, p0, Ll/tod;->m:Lcom/google/common/collect/ImmutableList;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/tod;->m:Lcom/google/common/collect/ImmutableList;

    .line 57
    .line 58
    :cond_1
    new-instance p1, Ll/ikj0;

    .line 59
    .line 60
    iget v0, p0, Ll/tod;->k:I

    .line 61
    .line 62
    new-instance v1, Ll/h0j0;

    .line 63
    .line 64
    const-wide/16 v2, 0x0

    .line 65
    .line 66
    invoke-direct {v1, v2, v3}, Ll/h0j0;-><init>(J)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Ll/mtd;

    .line 70
    .line 71
    iget v3, p0, Ll/tod;->l:I

    .line 72
    .line 73
    iget-object v4, p0, Ll/tod;->m:Lcom/google/common/collect/ImmutableList;

    .line 74
    .line 75
    invoke-direct {v2, v3, v4}, Ll/mtd;-><init>(ILjava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget p0, p0, Ll/tod;->n:I

    .line 79
    .line 80
    invoke-direct {p1, v0, v1, v2, p0}, Ll/ikj0;-><init>(ILl/h0j0;Ll/jkj0$c;I)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :pswitch_6
    new-instance p0, Ll/s7b0;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/s7b0;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_7
    new-instance p0, Ll/ig50;

    .line 97
    .line 98
    invoke-direct {p0}, Ll/ig50;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :pswitch_8
    new-instance p1, Ll/d6j;

    .line 106
    .line 107
    iget v0, p0, Ll/tod;->i:I

    .line 108
    .line 109
    invoke-direct {p1, v0}, Ll/d6j;-><init>(I)V

    .line 110
    .line 111
    .line 112
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    new-instance p1, Ll/c710;

    .line 116
    .line 117
    iget p0, p0, Ll/tod;->h:I

    .line 118
    .line 119
    invoke-direct {p1, p0}, Ll/c710;-><init>(I)V

    .line 120
    .line 121
    .line 122
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :pswitch_9
    new-instance p1, Ll/z610;

    .line 127
    .line 128
    iget v2, p0, Ll/tod;->j:I

    .line 129
    .line 130
    iget-boolean v3, p0, Ll/tod;->b:Z

    .line 131
    .line 132
    or-int/2addr v2, v3

    .line 133
    iget-boolean p0, p0, Ll/tod;->c:Z

    .line 134
    .line 135
    if-eqz p0, :cond_2

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    move v0, v1

    .line 139
    :goto_1
    or-int p0, v2, v0

    .line 140
    .line 141
    invoke-direct {p1, p0}, Ll/z610;-><init>(I)V

    .line 142
    .line 143
    .line 144
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :pswitch_a
    new-instance p1, Ll/rhx;

    .line 149
    .line 150
    iget p0, p0, Ll/tod;->g:I

    .line 151
    .line 152
    invoke-direct {p1, p0}, Ll/rhx;-><init>(I)V

    .line 153
    .line 154
    .line 155
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :pswitch_b
    new-instance p0, Ll/awi;

    .line 160
    .line 161
    invoke-direct {p0}, Ll/awi;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :pswitch_c
    sget-object p1, Ll/tod;->p:Ll/tod$a;

    .line 169
    .line 170
    iget v0, p0, Ll/tod;->f:I

    .line 171
    .line 172
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p1, v0}, Ll/tod$a;->a([Ljava/lang/Object;)Ll/zrf;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    if-eqz p1, :cond_3

    .line 185
    .line 186
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_3
    new-instance p1, Ll/sri;

    .line 191
    .line 192
    iget p0, p0, Ll/tod;->f:I

    .line 193
    .line 194
    invoke-direct {p1, p0}, Ll/sri;-><init>(I)V

    .line 195
    .line 196
    .line 197
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :pswitch_d
    new-instance p1, Ll/ck0;

    .line 202
    .line 203
    iget v2, p0, Ll/tod;->e:I

    .line 204
    .line 205
    iget-boolean v3, p0, Ll/tod;->b:Z

    .line 206
    .line 207
    or-int/2addr v2, v3

    .line 208
    iget-boolean p0, p0, Ll/tod;->c:Z

    .line 209
    .line 210
    if-eqz p0, :cond_4

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_4
    move v0, v1

    .line 214
    :goto_2
    or-int p0, v2, v0

    .line 215
    .line 216
    invoke-direct {p1, p0}, Ll/ck0;-><init>(I)V

    .line 217
    .line 218
    .line 219
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :pswitch_e
    new-instance p1, Ll/v90;

    .line 224
    .line 225
    iget v2, p0, Ll/tod;->d:I

    .line 226
    .line 227
    iget-boolean v3, p0, Ll/tod;->b:Z

    .line 228
    .line 229
    or-int/2addr v2, v3

    .line 230
    iget-boolean p0, p0, Ll/tod;->c:Z

    .line 231
    .line 232
    if-eqz p0, :cond_5

    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_5
    move v0, v1

    .line 236
    :goto_3
    or-int p0, v2, v0

    .line 237
    .line 238
    invoke-direct {p1, p0}, Ll/v90;-><init>(I)V

    .line 239
    .line 240
    .line 241
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :pswitch_f
    new-instance p0, Ll/b9;

    .line 246
    .line 247
    invoke-direct {p0}, Ll/b9;-><init>()V

    .line 248
    .line 249
    .line 250
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_10
    new-instance p0, Ll/x8;

    .line 255
    .line 256
    invoke-direct {p0}, Ll/x8;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
