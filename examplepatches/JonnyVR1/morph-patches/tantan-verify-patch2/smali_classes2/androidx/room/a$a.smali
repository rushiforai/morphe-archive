.class public final Landroidx/room/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/room/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0008\u001a\u00020\u00072\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Landroidx/room/a$a;",
        "",
        "<init>",
        "()V",
        "",
        "Ll/zj0;",
        "matches",
        "Landroidx/room/a;",
        "a",
        "(Ljava/util/List;)Landroidx/room/a;",
        "room-common"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/room/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)Landroidx/room/a;
    .locals 9
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/zj0;",
            ">;)",
            "Landroidx/room/a;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-object p0, p1

    .line 5
    check-cast p0, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x1

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ll/zj0;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {v5}, Lkotlin/ranges/IntProgression;->c()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    invoke-virtual {v3}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {v6}, Lkotlin/ranges/IntProgression;->a()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    sub-int/2addr v5, v6

    .line 43
    add-int/2addr v5, v4

    .line 44
    invoke-virtual {v3}, Ll/zj0;->a()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    sub-int/2addr v5, v3

    .line 53
    add-int/2addr v2, v5

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/4 v5, 0x0

    .line 64
    if-eqz v3, :cond_b

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Ll/zj0;

    .line 71
    .line 72
    invoke-virtual {v3}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Lkotlin/ranges/IntProgression;->a()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eqz v6, :cond_2

    .line 85
    .line 86
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    check-cast v6, Ll/zj0;

    .line 91
    .line 92
    invoke-virtual {v6}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-virtual {v6}, Lkotlin/ranges/IntProgression;->a()I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    if-le v3, v6, :cond_1

    .line 101
    .line 102
    move v3, v6

    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-eqz v6, :cond_a

    .line 113
    .line 114
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Ll/zj0;

    .line 119
    .line 120
    invoke-virtual {v5}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-virtual {v5}, Lkotlin/ranges/IntProgression;->c()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    :cond_3
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    if-eqz v6, :cond_4

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    check-cast v6, Ll/zj0;

    .line 139
    .line 140
    invoke-virtual {v6}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    invoke-virtual {v6}, Lkotlin/ranges/IntProgression;->c()I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-ge v5, v6, :cond_3

    .line 149
    .line 150
    move v5, v6

    .line 151
    goto :goto_2

    .line 152
    :cond_4
    new-instance v0, Lkotlin/ranges/IntRange;

    .line 153
    .line 154
    invoke-direct {v0, v3, v5}, Lkotlin/ranges/IntRange;-><init>(II)V

    .line 155
    .line 156
    .line 157
    instance-of v3, v0, Ljava/util/Collection;

    .line 158
    .line 159
    if-eqz v3, :cond_5

    .line 160
    .line 161
    move-object v3, v0

    .line 162
    check-cast v3, Ljava/util/Collection;

    .line 163
    .line 164
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-eqz v3, :cond_5

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    move v3, v1

    .line 176
    :cond_6
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    if-eqz v5, :cond_9

    .line 181
    .line 182
    move-object v5, v0

    .line 183
    check-cast v5, Lkotlin/collections/IntIterator;

    .line 184
    .line 185
    invoke-virtual {v5}, Lkotlin/collections/IntIterator;->nextInt()I

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    move v7, v1

    .line 194
    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result v8

    .line 198
    if-eqz v8, :cond_6

    .line 199
    .line 200
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    check-cast v8, Ll/zj0;

    .line 205
    .line 206
    invoke-virtual {v8}, Ll/zj0;->b()Lkotlin/ranges/IntRange;

    .line 207
    .line 208
    .line 209
    move-result-object v8

    .line 210
    invoke-virtual {v8, v5}, Lkotlin/ranges/IntRange;->i(I)Z

    .line 211
    .line 212
    .line 213
    move-result v8

    .line 214
    if-eqz v8, :cond_8

    .line 215
    .line 216
    add-int/lit8 v7, v7, 0x1

    .line 217
    .line 218
    :cond_8
    if-le v7, v4, :cond_7

    .line 219
    .line 220
    add-int/lit8 v3, v3, 0x1

    .line 221
    .line 222
    if-gez v3, :cond_6

    .line 223
    .line 224
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .line 225
    .line 226
    .line 227
    goto :goto_3

    .line 228
    :cond_9
    move v1, v3

    .line 229
    :goto_4
    new-instance p0, Landroidx/room/a;

    .line 230
    .line 231
    invoke-direct {p0, p1, v2, v1}, Landroidx/room/a;-><init>(Ljava/util/List;II)V

    .line 232
    .line 233
    .line 234
    return-object p0

    .line 235
    :cond_a
    invoke-static {}, Ll/mor;->a()V

    .line 236
    .line 237
    .line 238
    return-object v5

    .line 239
    :cond_b
    invoke-static {}, Ll/mor;->a()V

    .line 240
    .line 241
    .line 242
    return-object v5
.end method
