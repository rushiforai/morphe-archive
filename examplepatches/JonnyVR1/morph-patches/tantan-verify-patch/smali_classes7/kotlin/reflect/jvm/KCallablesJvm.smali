.class public final Lkotlin/reflect/jvm/KCallablesJvm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0007\",\u0010\u0007\u001a\u00020\u0001*\u0006\u0012\u0002\u0008\u00030\u00002\u0006\u0010\u0002\u001a\u00020\u00018F@FX\u0086\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u0003\u0010\u0004\"\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/reflect/KCallable;",
        "",
        "value",
        "a",
        "(Lkotlin/reflect/KCallable;)Z",
        "setAccessible",
        "(Lkotlin/reflect/KCallable;Z)V",
        "isAccessible",
        "kotlin-reflection"
    }
    k = 0x2
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/JvmName;
.end annotation


# direct methods
.method public static final a(Lkotlin/reflect/KCallable;)Z
    .locals 5
    .param p0    # Lkotlin/reflect/KCallable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KCallable<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lkotlin/reflect/KMutableProperty;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    check-cast v0, Lkotlin/reflect/KProperty;

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->b(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Field;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v3, v2

    .line 25
    :goto_0
    if-eqz v3, :cond_3

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->c(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Method;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v0, v2

    .line 39
    :goto_1
    if-eqz v0, :cond_3

    .line 40
    .line 41
    check-cast p0, Lkotlin/reflect/KMutableProperty;

    .line 42
    .line 43
    invoke-static {p0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->e(Lkotlin/reflect/KMutableProperty;)Ljava/lang/reflect/Method;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move p0, v2

    .line 55
    :goto_2
    if-eqz p0, :cond_3

    .line 56
    .line 57
    return v2

    .line 58
    :cond_3
    return v1

    .line 59
    :cond_4
    instance-of v0, p0, Lkotlin/reflect/KProperty;

    .line 60
    .line 61
    if-eqz v0, :cond_8

    .line 62
    .line 63
    check-cast p0, Lkotlin/reflect/KProperty;

    .line 64
    .line 65
    invoke-static {p0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->b(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Field;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    goto :goto_3

    .line 76
    :cond_5
    move v0, v2

    .line 77
    :goto_3
    if-eqz v0, :cond_7

    .line 78
    .line 79
    invoke-static {p0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->c(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Method;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-eqz p0, :cond_6

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    goto :goto_4

    .line 90
    :cond_6
    move p0, v2

    .line 91
    :goto_4
    if-eqz p0, :cond_7

    .line 92
    .line 93
    return v2

    .line 94
    :cond_7
    return v1

    .line 95
    :cond_8
    instance-of v0, p0, Lkotlin/reflect/KProperty$Getter;

    .line 96
    .line 97
    if-eqz v0, :cond_c

    .line 98
    .line 99
    move-object v0, p0

    .line 100
    check-cast v0, Lkotlin/reflect/KProperty$Getter;

    .line 101
    .line 102
    invoke-interface {v0}, Lkotlin/reflect/KProperty$Accessor;->g()Lkotlin/reflect/KProperty;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->b(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Field;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_9

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    goto :goto_5

    .line 117
    :cond_9
    move v0, v2

    .line 118
    :goto_5
    if-eqz v0, :cond_b

    .line 119
    .line 120
    check-cast p0, Lkotlin/reflect/KFunction;

    .line 121
    .line 122
    invoke-static {p0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->d(Lkotlin/reflect/KFunction;)Ljava/lang/reflect/Method;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    if-eqz p0, :cond_a

    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    goto :goto_6

    .line 133
    :cond_a
    move p0, v2

    .line 134
    :goto_6
    if-eqz p0, :cond_b

    .line 135
    .line 136
    return v2

    .line 137
    :cond_b
    return v1

    .line 138
    :cond_c
    instance-of v0, p0, Lkotlin/reflect/KMutableProperty$Setter;

    .line 139
    .line 140
    if-eqz v0, :cond_10

    .line 141
    .line 142
    move-object v0, p0

    .line 143
    check-cast v0, Lkotlin/reflect/KMutableProperty$Setter;

    .line 144
    .line 145
    invoke-interface {v0}, Lkotlin/reflect/KProperty$Accessor;->g()Lkotlin/reflect/KProperty;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->b(Lkotlin/reflect/KProperty;)Ljava/lang/reflect/Field;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    if-eqz v0, :cond_d

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    goto :goto_7

    .line 160
    :cond_d
    move v0, v2

    .line 161
    :goto_7
    if-eqz v0, :cond_f

    .line 162
    .line 163
    check-cast p0, Lkotlin/reflect/KFunction;

    .line 164
    .line 165
    invoke-static {p0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->d(Lkotlin/reflect/KFunction;)Ljava/lang/reflect/Method;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    if-eqz p0, :cond_e

    .line 170
    .line 171
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    goto :goto_8

    .line 176
    :cond_e
    move p0, v2

    .line 177
    :goto_8
    if-eqz p0, :cond_f

    .line 178
    .line 179
    return v2

    .line 180
    :cond_f
    return v1

    .line 181
    :cond_10
    instance-of v0, p0, Lkotlin/reflect/KFunction;

    .line 182
    .line 183
    if-eqz v0, :cond_17

    .line 184
    .line 185
    move-object v0, p0

    .line 186
    check-cast v0, Lkotlin/reflect/KFunction;

    .line 187
    .line 188
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->d(Lkotlin/reflect/KFunction;)Ljava/lang/reflect/Method;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    if-eqz v3, :cond_11

    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    goto :goto_9

    .line 199
    :cond_11
    move v3, v2

    .line 200
    :goto_9
    if-eqz v3, :cond_16

    .line 201
    .line 202
    invoke-static {p0}, Lkotlin/reflect/jvm/internal/UtilKt;->b(Ljava/lang/Object;)Lkotlin/reflect/jvm/internal/KCallableImpl;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const/4 v3, 0x0

    .line 207
    if-eqz p0, :cond_12

    .line 208
    .line 209
    invoke-virtual {p0}, Lkotlin/reflect/jvm/internal/KCallableImpl;->S()Lkotlin/reflect/jvm/internal/calls/Caller;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    if-eqz p0, :cond_12

    .line 214
    .line 215
    invoke-interface {p0}, Lkotlin/reflect/jvm/internal/calls/Caller;->b()Ljava/lang/reflect/Member;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    goto :goto_a

    .line 220
    :cond_12
    move-object p0, v3

    .line 221
    :goto_a
    instance-of v4, p0, Ljava/lang/reflect/AccessibleObject;

    .line 222
    .line 223
    if-eqz v4, :cond_13

    .line 224
    .line 225
    move-object v3, p0

    .line 226
    check-cast v3, Ljava/lang/reflect/AccessibleObject;

    .line 227
    .line 228
    :cond_13
    if-eqz v3, :cond_14

    .line 229
    .line 230
    invoke-virtual {v3}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    goto :goto_b

    .line 235
    :cond_14
    move p0, v2

    .line 236
    :goto_b
    if-eqz p0, :cond_16

    .line 237
    .line 238
    invoke-static {v0}, Lkotlin/reflect/jvm/ReflectJvmMapping;->a(Lkotlin/reflect/KFunction;)Ljava/lang/reflect/Constructor;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    if-eqz p0, :cond_15

    .line 243
    .line 244
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    goto :goto_c

    .line 249
    :cond_15
    move p0, v2

    .line 250
    :goto_c
    if-eqz p0, :cond_16

    .line 251
    .line 252
    return v2

    .line 253
    :cond_16
    return v1

    .line 254
    :cond_17
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 255
    .line 256
    new-instance v1, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    const-string v2, "Unknown callable: "

    .line 259
    .line 260
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    const-string v2, " ("

    .line 271
    .line 272
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const/16 p0, 0x29

    .line 279
    .line 280
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    throw v0
.end method
