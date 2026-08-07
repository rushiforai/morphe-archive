.class public final Lcom/facebook/appevents/ml/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/appevents/ml/a$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0011\n\u0002\u0008\u001a\n\u0002\u0010%\n\u0002\u0008\u0005\u0008\u0007\u0018\u0000 (2\u00020\u0001:\u0001\u000eB\u001d\u0008\u0002\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J-\u0010\u000c\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0008\u001a\u00020\u00042\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00030\t2\u0006\u0010\u000b\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0010\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0011\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u000fR\u0014\u0010\u0013\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u000fR\u0014\u0010\u0015\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u000fR\u0014\u0010\u0017\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u000fR\u0014\u0010\u0019\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u000fR\u0014\u0010\u001b\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u000fR\u0014\u0010\u001d\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u000fR\u0014\u0010\u001f\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u000fR\u0014\u0010!\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008 \u0010\u000fR\u0014\u0010#\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\"\u0010\u000fR \u0010\'\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040$8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008%\u0010&\u00a8\u0006)"
    }
    d2 = {
        "Lcom/facebook/appevents/ml/a;",
        "",
        "",
        "",
        "Ll/bqw;",
        "weights",
        "<init>",
        "(Ljava/util/Map;)V",
        "dense",
        "",
        "texts",
        "task",
        "b",
        "(Ll/bqw;[Ljava/lang/String;Ljava/lang/String;)Ll/bqw;",
        "a",
        "Ll/bqw;",
        "embedding",
        "convs0Weight",
        "c",
        "convs1Weight",
        "d",
        "convs2Weight",
        "e",
        "convs0Bias",
        "f",
        "convs1Bias",
        "g",
        "convs2Bias",
        "h",
        "fc1Weight",
        "i",
        "fc2Weight",
        "j",
        "fc1Bias",
        "k",
        "fc2Bias",
        "",
        "l",
        "Ljava/util/Map;",
        "finalWeights",
        "Companion",
        "facebook-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/appevents/ml/a$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final e:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final f:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final g:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final h:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final i:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final j:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final k:Ll/bqw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/bqw;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/facebook/appevents/ml/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/facebook/appevents/ml/a$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/facebook/appevents/ml/a;->Companion:Lcom/facebook/appevents/ml/a$a;

    .line 8
    .line 9
    const-string v0, "embedding.weight"

    .line 10
    .line 11
    const-string v1, "embed.weight"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v0, "dense1.weight"

    .line 18
    .line 19
    const-string v1, "fc1.weight"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v0, "dense2.weight"

    .line 26
    .line 27
    const-string v1, "fc2.weight"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    const-string v0, "dense3.weight"

    .line 34
    .line 35
    const-string v1, "fc3.weight"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v0, "dense1.bias"

    .line 42
    .line 43
    const-string v1, "fc1.bias"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const-string v0, "dense2.bias"

    .line 50
    .line 51
    const-string v1, "fc2.bias"

    .line 52
    .line 53
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    const-string v0, "dense3.bias"

    .line 58
    .line 59
    const-string v1, "fc3.bias"

    .line 60
    .line 61
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    filled-new-array/range {v2 .. v8}, [Lkotlin/Pair;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sput-object v0, Lcom/facebook/appevents/ml/a;->m:Ljava/util/Map;

    .line 74
    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/bqw;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "embed.weight"

    .line 5
    .line 6
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "Required value was null."

    .line 12
    .line 13
    if-eqz v0, :cond_d

    .line 14
    .line 15
    check-cast v0, Ll/bqw;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->a:Ll/bqw;

    .line 18
    .line 19
    const-string v0, "convs.0.weight"

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_c

    .line 26
    .line 27
    check-cast v0, Ll/bqw;

    .line 28
    .line 29
    invoke-static {v0}, Ll/t260;->l(Ll/bqw;)Ll/bqw;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->b:Ll/bqw;

    .line 34
    .line 35
    const-string v0, "convs.1.weight"

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_b

    .line 42
    .line 43
    check-cast v0, Ll/bqw;

    .line 44
    .line 45
    invoke-static {v0}, Ll/t260;->l(Ll/bqw;)Ll/bqw;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->c:Ll/bqw;

    .line 50
    .line 51
    const-string v0, "convs.2.weight"

    .line 52
    .line 53
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_a

    .line 58
    .line 59
    check-cast v0, Ll/bqw;

    .line 60
    .line 61
    invoke-static {v0}, Ll/t260;->l(Ll/bqw;)Ll/bqw;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->d:Ll/bqw;

    .line 66
    .line 67
    const-string v0, "convs.0.bias"

    .line 68
    .line 69
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_9

    .line 74
    .line 75
    check-cast v0, Ll/bqw;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->e:Ll/bqw;

    .line 78
    .line 79
    const-string v0, "convs.1.bias"

    .line 80
    .line 81
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_8

    .line 86
    .line 87
    check-cast v0, Ll/bqw;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->f:Ll/bqw;

    .line 90
    .line 91
    const-string v0, "convs.2.bias"

    .line 92
    .line 93
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_7

    .line 98
    .line 99
    check-cast v0, Ll/bqw;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->g:Ll/bqw;

    .line 102
    .line 103
    const-string v0, "fc1.weight"

    .line 104
    .line 105
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    check-cast v0, Ll/bqw;

    .line 112
    .line 113
    invoke-static {v0}, Ll/t260;->k(Ll/bqw;)Ll/bqw;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->h:Ll/bqw;

    .line 118
    .line 119
    const-string v0, "fc2.weight"

    .line 120
    .line 121
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    if-eqz v0, :cond_5

    .line 126
    .line 127
    check-cast v0, Ll/bqw;

    .line 128
    .line 129
    invoke-static {v0}, Ll/t260;->k(Ll/bqw;)Ll/bqw;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->i:Ll/bqw;

    .line 134
    .line 135
    const-string v0, "fc1.bias"

    .line 136
    .line 137
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    if-eqz v0, :cond_4

    .line 142
    .line 143
    check-cast v0, Ll/bqw;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->j:Ll/bqw;

    .line 146
    .line 147
    const-string v0, "fc2.bias"

    .line 148
    .line 149
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    if-eqz v0, :cond_3

    .line 154
    .line 155
    check-cast v0, Ll/bqw;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->k:Ll/bqw;

    .line 158
    .line 159
    new-instance v0, Ljava/util/HashMap;

    .line 160
    .line 161
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 162
    .line 163
    .line 164
    iput-object v0, p0, Lcom/facebook/appevents/ml/a;->l:Ljava/util/Map;

    .line 165
    .line 166
    sget-object v0, Lcom/facebook/appevents/ml/ModelManager$Task;->MTML_INTEGRITY_DETECT:Lcom/facebook/appevents/ml/ModelManager$Task;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/facebook/appevents/ml/ModelManager$Task;->toKey()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sget-object v1, Lcom/facebook/appevents/ml/ModelManager$Task;->MTML_APP_EVENT_PREDICTION:Lcom/facebook/appevents/ml/ModelManager$Task;

    .line 173
    .line 174
    invoke-virtual {v1}, Lcom/facebook/appevents/ml/ModelManager$Task;->toKey()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    if-eqz v1, :cond_2

    .line 195
    .line 196
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    check-cast v1, Ljava/lang/String;

    .line 201
    .line 202
    new-instance v2, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v3, ".weight"

    .line 211
    .line 212
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    new-instance v3, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v1, ".bias"

    .line 228
    .line 229
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    check-cast v3, Ll/bqw;

    .line 241
    .line 242
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    check-cast v4, Ll/bqw;

    .line 247
    .line 248
    if-eqz v3, :cond_1

    .line 249
    .line 250
    invoke-static {v3}, Ll/t260;->k(Ll/bqw;)Ll/bqw;

    .line 251
    .line 252
    .line 253
    move-result-object v3

    .line 254
    iget-object v5, p0, Lcom/facebook/appevents/ml/a;->l:Ljava/util/Map;

    .line 255
    .line 256
    invoke-interface {v5, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    :cond_1
    if-eqz v4, :cond_0

    .line 260
    .line 261
    iget-object v2, p0, Lcom/facebook/appevents/ml/a;->l:Ljava/util/Map;

    .line 262
    .line 263
    invoke-interface {v2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_2
    return-void

    .line 268
    :cond_3
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    throw v1

    .line 272
    :cond_4
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    throw v1

    .line 276
    :cond_5
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    throw v1

    .line 280
    :cond_6
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    throw v1

    .line 284
    :cond_7
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    throw v1

    .line 288
    :cond_8
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    throw v1

    .line 292
    :cond_9
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    throw v1

    .line 296
    :cond_a
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    throw v1

    .line 300
    :cond_b
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    throw v1

    .line 304
    :cond_c
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    throw v1

    .line 308
    :cond_d
    invoke-static {v2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    throw v1
.end method

.method public synthetic constructor <init>(Ljava/util/Map;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 312
    invoke-direct {p0, p1}, Lcom/facebook/appevents/ml/a;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method public static final synthetic a()Ljava/util/Map;
    .locals 3

    .line 1
    const-class v0, Lcom/facebook/appevents/ml/a;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    :try_start_0
    sget-object v0, Lcom/facebook/appevents/ml/a;->m:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :catchall_0
    move-exception v1

    .line 15
    invoke-static {v1, v0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v2
.end method


# virtual methods
.method public final b(Ll/bqw;[Ljava/lang/String;Ljava/lang/String;)Ll/bqw;
    .locals 5
    .param p1    # Ll/bqw;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->a:Ll/bqw;

    .line 19
    .line 20
    const/16 v2, 0x80

    .line 21
    .line 22
    invoke-static {p2, v2, v0}, Ll/t260;->e([Ljava/lang/String;ILl/bqw;)Ll/bqw;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->b:Ll/bqw;

    .line 27
    .line 28
    invoke-static {p2, v0}, Ll/t260;->c(Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->e:Ll/bqw;

    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/t260;->a(Ll/bqw;Ll/bqw;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Ll/t260;->i(Ll/bqw;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->c:Ll/bqw;

    .line 41
    .line 42
    invoke-static {p2, v0}, Ll/t260;->c(Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v2, p0, Lcom/facebook/appevents/ml/a;->f:Ll/bqw;

    .line 47
    .line 48
    invoke-static {v0, v2}, Ll/t260;->a(Ll/bqw;Ll/bqw;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Ll/t260;->i(Ll/bqw;)V

    .line 52
    .line 53
    .line 54
    const/4 v2, 0x2

    .line 55
    invoke-static {v0, v2}, Ll/t260;->g(Ll/bqw;I)Ll/bqw;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v2, p0, Lcom/facebook/appevents/ml/a;->d:Ll/bqw;

    .line 60
    .line 61
    invoke-static {v0, v2}, Ll/t260;->c(Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Lcom/facebook/appevents/ml/a;->g:Ll/bqw;

    .line 66
    .line 67
    invoke-static {v2, v3}, Ll/t260;->a(Ll/bqw;Ll/bqw;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v2}, Ll/t260;->i(Ll/bqw;)V

    .line 71
    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {p2, v3}, Ll/bqw;->b(I)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {p2, v4}, Ll/t260;->g(Ll/bqw;I)Ll/bqw;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {v0, v3}, Ll/bqw;->b(I)I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    invoke-static {v0, v4}, Ll/t260;->g(Ll/bqw;I)Ll/bqw;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v2, v3}, Ll/bqw;->b(I)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    invoke-static {v2, v4}, Ll/t260;->g(Ll/bqw;I)Ll/bqw;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {p2, v3}, Ll/t260;->f(Ll/bqw;I)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v3}, Ll/t260;->f(Ll/bqw;I)V

    .line 102
    .line 103
    .line 104
    invoke-static {v2, v3}, Ll/t260;->f(Ll/bqw;I)V

    .line 105
    .line 106
    .line 107
    filled-new-array {p2, v0, v2, p1}, [Ll/bqw;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Ll/t260;->b([Ll/bqw;)Ll/bqw;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object p2, p0, Lcom/facebook/appevents/ml/a;->h:Ll/bqw;

    .line 116
    .line 117
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->j:Ll/bqw;

    .line 118
    .line 119
    invoke-static {p1, p2, v0}, Ll/t260;->d(Ll/bqw;Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p1}, Ll/t260;->i(Ll/bqw;)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/facebook/appevents/ml/a;->i:Ll/bqw;

    .line 127
    .line 128
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->k:Ll/bqw;

    .line 129
    .line 130
    invoke-static {p1, p2, v0}, Ll/t260;->d(Ll/bqw;Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p1}, Ll/t260;->i(Ll/bqw;)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Lcom/facebook/appevents/ml/a;->l:Ljava/util/Map;

    .line 138
    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v2, ".weight"

    .line 148
    .line 149
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    check-cast p2, Ll/bqw;

    .line 161
    .line 162
    iget-object v0, p0, Lcom/facebook/appevents/ml/a;->l:Ljava/util/Map;

    .line 163
    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string p3, ".bias"

    .line 173
    .line 174
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    check-cast p3, Ll/bqw;

    .line 186
    .line 187
    if-eqz p2, :cond_2

    .line 188
    .line 189
    if-nez p3, :cond_1

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_1
    invoke-static {p1, p2, p3}, Ll/t260;->d(Ll/bqw;Ll/bqw;Ll/bqw;)Ll/bqw;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-static {p1}, Ll/t260;->j(Ll/bqw;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    .line 198
    .line 199
    return-object p1

    .line 200
    :catchall_0
    move-exception p1

    .line 201
    goto :goto_1

    .line 202
    :cond_2
    :goto_0
    return-object v1

    .line 203
    :goto_1
    invoke-static {p1, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    return-object v1
.end method
