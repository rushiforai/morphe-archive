.class public Lcom/alibaba/fastjson/util/JavaBeanInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final buildMethod:Ljava/lang/reflect/Method;

.field public final builderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final creatorConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field public creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

.field public creatorConstructorParameters:[Ljava/lang/String;

.field public final defaultConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field public final defaultConstructorParameterSize:I

.field public final factoryMethod:Ljava/lang/reflect/Method;

.field public final fields:[Lcom/alibaba/fastjson/util/FieldInfo;

.field public final jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

.field public kotlin:Z

.field public kotlinDefaultConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field public orders:[Ljava/lang/String;

.field public final parserFeatures:I

.field public final sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

.field public final typeKey:Ljava/lang/String;

.field public final typeName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Constructor<",
            "*>;",
            "Ljava/lang/reflect/Constructor<",
            "*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            "Ljava/util/List<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->builderClass:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getParserFeatures(Ljava/lang/Class;)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    iput p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    .line 19
    .line 20
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;

    .line 21
    .line 22
    iput-object p7, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    if-eqz p7, :cond_3

    .line 26
    .line 27
    invoke-interface {p7}, Lcom/alibaba/fastjson/annotation/JSONType;->typeName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p6

    .line 31
    invoke-interface {p7}, Lcom/alibaba/fastjson/annotation/JSONType;->typeKey()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-lez v1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v0, p2

    .line 43
    :goto_0
    iput-object v0, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeKey:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p6

    .line 58
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    .line 59
    .line 60
    :goto_1
    invoke-interface {p7}, Lcom/alibaba/fastjson/annotation/JSONType;->orders()[Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p6

    .line 64
    array-length p7, p6

    .line 65
    if-nez p7, :cond_2

    .line 66
    .line 67
    move-object p6, p2

    .line 68
    :cond_2
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->orders:[Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p6

    .line 75
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeKey:Ljava/lang/String;

    .line 78
    .line 79
    iput-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->orders:[Ljava/lang/String;

    .line 80
    .line 81
    :goto_2
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result p6

    .line 85
    new-array p6, p6, [Lcom/alibaba/fastjson/util/FieldInfo;

    .line 86
    .line 87
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 88
    .line 89
    invoke-interface {p8, p6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    array-length p7, p6

    .line 93
    new-array p7, p7, [Lcom/alibaba/fastjson/util/FieldInfo;

    .line 94
    .line 95
    iget-object v0, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->orders:[Ljava/lang/String;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    if-eqz v0, :cond_7

    .line 99
    .line 100
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 101
    .line 102
    invoke-interface {p8}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result p8

    .line 106
    invoke-direct {v0, p8}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 107
    .line 108
    .line 109
    array-length p8, p6

    .line 110
    move v2, v1

    .line 111
    :goto_3
    if-ge v2, p8, :cond_4

    .line 112
    .line 113
    aget-object v3, p6, v2

    .line 114
    .line 115
    iget-object v4, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v4, v3}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_4
    iget-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->orders:[Ljava/lang/String;

    .line 124
    .line 125
    array-length p8, p6

    .line 126
    move v2, v1

    .line 127
    move v3, v2

    .line 128
    :goto_4
    if-ge v2, p8, :cond_6

    .line 129
    .line 130
    aget-object v4, p6, v2

    .line 131
    .line 132
    invoke-virtual {v0, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    check-cast v5, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 137
    .line 138
    if-eqz v5, :cond_5

    .line 139
    .line 140
    add-int/lit8 v6, v3, 0x1

    .line 141
    .line 142
    aput-object v5, p7, v3

    .line 143
    .line 144
    invoke-virtual {v0, v4}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move v3, v6

    .line 148
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_6
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 152
    .line 153
    .line 154
    move-result-object p6

    .line 155
    invoke-interface {p6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 156
    .line 157
    .line 158
    move-result-object p6

    .line 159
    :goto_5
    invoke-interface {p6}, Ljava/util/Iterator;->hasNext()Z

    .line 160
    .line 161
    .line 162
    move-result p8

    .line 163
    if-eqz p8, :cond_8

    .line 164
    .line 165
    invoke-interface {p6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p8

    .line 169
    check-cast p8, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 170
    .line 171
    add-int/lit8 v0, v3, 0x1

    .line 172
    .line 173
    aput-object p8, p7, v3

    .line 174
    .line 175
    move v3, v0

    .line 176
    goto :goto_5

    .line 177
    :cond_7
    array-length p8, p6

    .line 178
    invoke-static {p6, v1, p7, v1, p8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    .line 180
    .line 181
    invoke-static {p7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :cond_8
    iget-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 185
    .line 186
    invoke-static {p6, p7}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p6

    .line 190
    if-eqz p6, :cond_9

    .line 191
    .line 192
    iget-object p7, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 193
    .line 194
    :cond_9
    iput-object p7, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 195
    .line 196
    if-eqz p3, :cond_a

    .line 197
    .line 198
    invoke-virtual {p3}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 199
    .line 200
    .line 201
    move-result-object p3

    .line 202
    array-length p3, p3

    .line 203
    iput p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    .line 204
    .line 205
    goto :goto_6

    .line 206
    :cond_a
    if-eqz p5, :cond_b

    .line 207
    .line 208
    invoke-virtual {p5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 209
    .line 210
    .line 211
    move-result-object p3

    .line 212
    array-length p3, p3

    .line 213
    iput p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_b
    iput v1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    .line 217
    .line 218
    :goto_6
    if-eqz p4, :cond_12

    .line 219
    .line 220
    invoke-virtual {p4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    move-result-object p3

    .line 224
    iput-object p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

    .line 225
    .line 226
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->isKotlin(Ljava/lang/Class;)Z

    .line 227
    .line 228
    .line 229
    move-result p3

    .line 230
    iput-boolean p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlin:Z

    .line 231
    .line 232
    if-eqz p3, :cond_f

    .line 233
    .line 234
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getKoltinConstructorParameters(Ljava/lang/Class;)[Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p3

    .line 238
    iput-object p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameters:[Ljava/lang/String;

    .line 239
    .line 240
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iput-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->kotlinDefaultConstructor:Ljava/lang/reflect/Constructor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    .line 246
    :catchall_0
    invoke-static {p4}, Lcom/alibaba/fastjson/util/TypeUtils;->getParameterAnnotations(Ljava/lang/reflect/Constructor;)[[Ljava/lang/annotation/Annotation;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    move p3, v1

    .line 251
    :goto_7
    iget-object p4, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameters:[Ljava/lang/String;

    .line 252
    .line 253
    array-length p4, p4

    .line 254
    if-ge p3, p4, :cond_12

    .line 255
    .line 256
    array-length p4, p1

    .line 257
    if-ge p3, p4, :cond_12

    .line 258
    .line 259
    aget-object p4, p1, p3

    .line 260
    .line 261
    array-length p5, p4

    .line 262
    move p6, v1

    .line 263
    :goto_8
    if-ge p6, p5, :cond_d

    .line 264
    .line 265
    aget-object p7, p4, p6

    .line 266
    .line 267
    instance-of p8, p7, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 268
    .line 269
    if-eqz p8, :cond_c

    .line 270
    .line 271
    check-cast p7, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 272
    .line 273
    goto :goto_9

    .line 274
    :cond_c
    add-int/lit8 p6, p6, 0x1

    .line 275
    .line 276
    goto :goto_8

    .line 277
    :cond_d
    move-object p7, p2

    .line 278
    :goto_9
    if-eqz p7, :cond_e

    .line 279
    .line 280
    invoke-interface {p7}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p4

    .line 284
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 285
    .line 286
    .line 287
    move-result p5

    .line 288
    if-lez p5, :cond_e

    .line 289
    .line 290
    iget-object p5, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameters:[Ljava/lang/String;

    .line 291
    .line 292
    aput-object p4, p5, p3

    .line 293
    .line 294
    :cond_e
    add-int/lit8 p3, p3, 0x1

    .line 295
    .line 296
    goto :goto_7

    .line 297
    :cond_f
    iget-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

    .line 298
    .line 299
    array-length p1, p1

    .line 300
    iget-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 301
    .line 302
    array-length p2, p2

    .line 303
    if-eq p1, p2, :cond_10

    .line 304
    .line 305
    goto :goto_b

    .line 306
    :cond_10
    :goto_a
    iget-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameterTypes:[Ljava/lang/reflect/Type;

    .line 307
    .line 308
    array-length p2, p1

    .line 309
    if-ge v1, p2, :cond_12

    .line 310
    .line 311
    aget-object p1, p1, v1

    .line 312
    .line 313
    iget-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 314
    .line 315
    aget-object p2, p2, v1

    .line 316
    .line 317
    iget-object p2, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 318
    .line 319
    if-eq p1, p2, :cond_11

    .line 320
    .line 321
    :goto_b
    invoke-static {p4}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    iput-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructorParameters:[Ljava/lang/String;

    .line 326
    .line 327
    return-void

    .line 328
    :cond_11
    add-int/lit8 v1, v1, 0x1

    .line 329
    .line 330
    goto :goto_a

    .line 331
    :cond_12
    return-void
.end method

.method public static add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    sub-int/2addr v0, v1

    .line 7
    :goto_0
    if-ltz v0, :cond_4

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 14
    .line 15
    iget-object v3, v2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v4, p1, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_3

    .line 24
    .line 25
    iget-boolean v3, v2, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    iget-boolean v3, p1, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    .line 30
    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object v3, v2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 35
    .line 36
    iget-object v4, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    invoke-interface {p0, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_1
    invoke-virtual {v2, p1}, Lcom/alibaba/fastjson/util/FieldInfo;->compareTo(Lcom/alibaba/fastjson/util/FieldInfo;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-gez v2, :cond_2

    .line 53
    .line 54
    invoke-interface {p0, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return v1

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return v1
.end method

.method public static build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;)Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/PropertyNamingStrategy;",
            ")",
            "Lcom/alibaba/fastjson/util/JavaBeanInfo;"
        }
    .end annotation

    .line 239
    sget-boolean v4, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-result-object p0

    return-object p0
.end method

.method public static build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/PropertyNamingStrategy;",
            "ZZ)",
            "Lcom/alibaba/fastjson/util/JavaBeanInfo;"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 238
    invoke-static/range {v0 .. v5}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-result-object p0

    return-object p0
.end method

.method public static build(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;ZZZ)Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .locals 43
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/PropertyNamingStrategy;",
            "ZZZ)",
            "Lcom/alibaba/fastjson/util/JavaBeanInfo;"
        }
    .end annotation

    move-object/from16 v4, p0

    move-object/from16 v9, p1

    move/from16 v10, p5

    .line 1
    const-class v0, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-static {v4, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/alibaba/fastjson/annotation/JSONType;

    if-eqz v7, :cond_0

    .line 2
    invoke-interface {v7}, Lcom/alibaba/fastjson/annotation/JSONType;->naming()Lcom/alibaba/fastjson/PropertyNamingStrategy;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3
    sget-object v1, Lcom/alibaba/fastjson/PropertyNamingStrategy;->CamelCase:Lcom/alibaba/fastjson/PropertyNamingStrategy;

    if-eq v0, v1, :cond_0

    move-object v13, v0

    goto :goto_0

    :cond_0
    move-object/from16 v13, p2

    .line 4
    :goto_0
    invoke-static {v4, v7}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getBuilderClass(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;

    move-result-object v2

    .line 5
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v14

    .line 6
    invoke-virtual {v4}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v15

    .line 7
    invoke-static {v4}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildGenericInfo(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v12

    .line 8
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->isKotlin(Ljava/lang/Class;)Z

    move-result v11

    .line 9
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v3, 0x1

    if-eqz v11, :cond_2

    .line 10
    array-length v5, v0

    if-ne v5, v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    if-nez v2, :cond_3

    .line 11
    invoke-static {v4, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getDefaultConstructor(Ljava/lang/Class;[Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    goto :goto_2

    .line 12
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getDefaultConstructor(Ljava/lang/Class;[Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 13
    :goto_2
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    move/from16 v16, v3

    move-object v3, v5

    const/4 v5, 0x0

    if-eqz p3, :cond_6

    move-object v0, v4

    :goto_3
    if-eqz v0, :cond_4

    .line 14
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 15
    invoke-static {v4, v9, v13, v8, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->computeFields(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;Ljava/util/List;[Ljava/lang/reflect/Field;)V

    .line 16
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_3

    :cond_4
    if-eqz v3, :cond_5

    .line 17
    invoke-static {v3}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 18
    :cond_5
    new-instance v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/4 v4, 0x0

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    return-object v0

    :cond_6
    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v19, v7

    .line 19
    invoke-virtual {v4}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-nez v2, :cond_8

    invoke-virtual {v4}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_4

    :cond_7
    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    :goto_4
    move/from16 v2, v16

    .line 20
    :goto_5
    const-class v5, Ljava/util/Collection;

    const-class v6, Ljava/lang/Object;

    const-class v7, Ljava/lang/String;

    move/from16 p2, v11

    const-class v11, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v22, v13

    if-nez v21, :cond_9

    if-eqz v20, :cond_a

    :cond_9
    if-eqz v2, :cond_37

    .line 21
    :cond_a
    invoke-static {v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getCreatorConstructor([Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;

    move-result-object v23

    if-eqz v23, :cond_16

    if-nez v2, :cond_16

    .line 22
    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 23
    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v10

    .line 24
    array-length v0, v10

    if-lez v0, :cond_15

    .line 25
    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/util/TypeUtils;->getParameterAnnotations(Ljava/lang/reflect/Constructor;)[[Ljava/lang/annotation/Annotation;

    move-result-object v24

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 26
    :goto_6
    array-length v1, v10

    if-ge v0, v1, :cond_15

    .line 27
    aget-object v1, v24, v0

    .line 28
    array-length v3, v1

    const/4 v13, 0x0

    :goto_7
    if-ge v13, v3, :cond_c

    move-object/from16 p5, v1

    aget-object v1, p5, v13

    move-object/from16 v28, v2

    .line 29
    instance-of v2, v1, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v2, :cond_b

    .line 30
    check-cast v1, Lcom/alibaba/fastjson/annotation/JSONField;

    goto :goto_8

    :cond_b
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v1, p5

    move-object/from16 v2, v28

    goto :goto_7

    :cond_c
    move-object/from16 v28, v2

    const/4 v1, 0x0

    .line 31
    :goto_8
    aget-object v3, v10, v0

    .line 32
    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Constructor;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v2

    aget-object v2, v2, v0

    if-eqz v1, :cond_d

    .line 33
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v13

    invoke-static {v4, v13, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v13

    .line 34
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v29

    .line 35
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v30

    .line 36
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v31

    .line 37
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    :cond_d
    const/4 v1, 0x0

    const/4 v13, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    :goto_9
    if-eqz v1, :cond_e

    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v32

    if-nez v32, :cond_10

    :cond_e
    if-nez v28, :cond_f

    .line 39
    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    move-result-object v1

    move-object/from16 v28, v1

    .line 40
    :cond_f
    aget-object v1, v28, v0

    :cond_10
    if-nez v13, :cond_14

    if-nez v28, :cond_11

    if-eqz p2, :cond_12

    .line 41
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getKoltinConstructorParameters(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v28

    :cond_11
    :goto_a
    move-object/from16 p5, v1

    move-object/from16 v32, v2

    move-object/from16 v1, v28

    goto :goto_b

    .line 42
    :cond_12
    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    move-result-object v28

    goto :goto_a

    .line 43
    :goto_b
    array-length v2, v1

    if-le v2, v0, :cond_13

    .line 44
    aget-object v2, v1, v0

    .line 45
    invoke-static {v4, v2, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v13

    :cond_13
    move-object/from16 v28, v1

    :goto_c
    move v1, v0

    goto :goto_d

    :cond_14
    move-object/from16 p5, v1

    move-object/from16 v32, v2

    goto :goto_c

    .line 46
    :goto_d
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    move/from16 v2, v31

    move-object/from16 v31, v5

    move-object v5, v13

    move-object v13, v8

    move v8, v2

    move-object v2, v12

    move-object v12, v6

    move/from16 v6, v29

    move-object/from16 v29, v2

    move-object v2, v11

    move-object v11, v7

    move/from16 v7, v30

    move-object/from16 v30, v2

    move-object v2, v4

    move/from16 v9, v16

    move-object/from16 v4, v32

    const/16 v25, 0x0

    const/16 v26, 0x0

    move/from16 v16, v1

    move-object/from16 v1, p5

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;III)V

    move-object v4, v2

    .line 47
    invoke-static {v13, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    add-int/lit8 v0, v16, 0x1

    move/from16 v16, v9

    move-object v7, v11

    move-object v6, v12

    move-object v8, v13

    move-object/from16 v2, v28

    move-object/from16 v12, v29

    move-object/from16 v11, v30

    move-object/from16 v5, v31

    move-object/from16 v9, p1

    goto/16 :goto_6

    :cond_15
    move-object/from16 v31, v5

    move-object v13, v8

    move-object/from16 v30, v11

    move-object/from16 v29, v12

    move/from16 v9, v16

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object v12, v6

    move-object v11, v7

    move-object v1, v4

    move-object v8, v13

    move-object/from16 v13, v20

    move-object/from16 v9, v30

    move-object/from16 v10, v31

    const/16 p4, 0x2

    goto/16 :goto_23

    :cond_16
    move-object/from16 v31, v5

    move-object v13, v8

    move-object/from16 v30, v11

    move-object/from16 v29, v12

    move/from16 v9, v16

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object v12, v6

    move-object v11, v7

    .line 48
    invoke-static {v4, v15, v10}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getFactoryMethod(Ljava/lang/Class;[Ljava/lang/reflect/Method;Z)Ljava/lang/reflect/Method;

    move-result-object v16

    if-eqz v16, :cond_21

    .line 49
    invoke-static/range {v16 .. v16}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 50
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 51
    array-length v1, v0

    if-lez v1, :cond_20

    .line 52
    invoke-static/range {v16 .. v16}, Lcom/alibaba/fastjson/util/TypeUtils;->getParameterAnnotations(Ljava/lang/reflect/Method;)[[Ljava/lang/annotation/Annotation;

    move-result-object v9

    move-object/from16 v1, v25

    move/from16 v11, v26

    .line 53
    :goto_e
    array-length v2, v0

    if-ge v11, v2, :cond_1f

    .line 54
    aget-object v2, v9, v11

    .line 55
    array-length v3, v2

    move/from16 v5, v26

    :goto_f
    if-ge v5, v3, :cond_18

    aget-object v6, v2, v5

    .line 56
    instance-of v7, v6, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v7, :cond_17

    .line 57
    move-object v2, v6

    check-cast v2, Lcom/alibaba/fastjson/annotation/JSONField;

    goto :goto_10

    :cond_17
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    :cond_18
    move-object/from16 v2, v25

    :goto_10
    if-nez v2, :cond_1a

    if-eqz v10, :cond_19

    .line 58
    invoke-static/range {v16 .. v16}, Lcom/alibaba/fastjson/util/TypeUtils;->isJacksonCreator(Ljava/lang/reflect/Method;)Z

    move-result v3

    if-eqz v3, :cond_19

    goto :goto_11

    .line 59
    :cond_19
    const-string v0, "illegal json creator"

    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    return-object v25

    :cond_1a
    :goto_11
    if-eqz v2, :cond_1b

    .line 60
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    .line 61
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v5

    .line 62
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v6

    invoke-static {v6}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v6

    .line 63
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v2

    invoke-static {v2}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v2

    move v8, v2

    move v7, v6

    move v6, v5

    goto :goto_12

    :cond_1b
    move-object/from16 v3, v25

    move/from16 v6, v26

    move v7, v6

    move v8, v7

    :goto_12
    if-eqz v3, :cond_1d

    .line 64
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1c

    goto :goto_14

    :cond_1c
    :goto_13
    move-object v12, v1

    move-object v1, v3

    goto :goto_15

    :cond_1d
    :goto_14
    if-nez v1, :cond_1e

    .line 65
    invoke-static/range {v16 .. v16}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    move-result-object v1

    .line 66
    :cond_1e
    aget-object v3, v1, v11

    goto :goto_13

    .line 67
    :goto_15
    aget-object v3, v0, v11

    .line 68
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v2

    aget-object v2, v2, v11

    .line 69
    invoke-static {v4, v1, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v5

    move-object v15, v0

    .line 70
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v42, v4

    move-object v4, v2

    move-object/from16 v2, v42

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;III)V

    .line 71
    invoke-static {v13, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v4, p0

    move-object v1, v12

    move-object v0, v15

    goto/16 :goto_e

    .line 72
    :cond_1f
    new-instance v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object/from16 v1, p0

    move-object v8, v13

    move-object/from16 v5, v16

    move-object/from16 v7, v19

    move-object/from16 v2, v20

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    return-object v0

    :cond_20
    move-object/from16 p5, v16

    :goto_16
    move-object v1, v4

    move-object v8, v13

    move-object/from16 v13, v20

    move-object/from16 v9, v30

    move-object/from16 v10, v31

    const/16 p4, 0x2

    goto/16 :goto_22

    :cond_21
    move-object/from16 v10, v16

    if-nez v2, :cond_36

    .line 73
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz p2, :cond_22

    .line 74
    array-length v2, v0

    if-lez v2, :cond_22

    .line 75
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getKoltinConstructorParameters(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v2

    .line 76
    invoke-static {v0, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getKoltinConstructor([Ljava/lang/reflect/Constructor;[Ljava/lang/String;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 77
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    move-object/from16 v23, v0

    move-object v9, v2

    :goto_17
    move-object/from16 p5, v10

    move-object/from16 v10, v31

    const/16 p4, 0x2

    goto/16 :goto_1b

    .line 78
    :cond_22
    array-length v2, v0

    move-object/from16 v3, v25

    move/from16 v5, v26

    :goto_18
    if-ge v5, v2, :cond_2b

    aget-object v6, v0, v5

    .line 79
    invoke-virtual {v6}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    .line 80
    const-string v8, "org.springframework.security.web.authentication.WebAuthenticationDetails"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_23

    .line 81
    array-length v8, v7

    move/from16 v16, v9

    const/4 v9, 0x2

    if-ne v8, v9, :cond_23

    aget-object v8, v7, v26

    if-ne v8, v11, :cond_23

    aget-object v8, v7, v16

    if-ne v8, v11, :cond_23

    move/from16 v9, v16

    .line 82
    invoke-virtual {v6, v9}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 83
    invoke-static {v6}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    move-object/from16 v23, v6

    goto :goto_17

    .line 84
    :cond_23
    const-string v8, "org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_24

    .line 85
    array-length v8, v7

    const/4 v9, 0x3

    if-ne v8, v9, :cond_24

    aget-object v8, v7, v26

    if-ne v8, v12, :cond_24

    const/4 v8, 0x1

    aget-object v9, v7, v8

    if-ne v9, v12, :cond_24

    const/16 p4, 0x2

    aget-object v9, v7, p4

    move-object/from16 p5, v10

    move-object/from16 v10, v31

    if-ne v9, v10, :cond_25

    .line 86
    invoke-virtual {v6, v8}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    const/4 v9, 0x3

    .line 87
    new-array v2, v9, [Ljava/lang/String;

    const-string v0, "principal"

    aput-object v0, v2, v26

    const-string v0, "credentials"

    aput-object v0, v2, v8

    const-string v0, "authorities"

    aput-object v0, v2, p4

    :goto_19
    move-object v9, v2

    move-object/from16 v23, v6

    goto :goto_1b

    :cond_24
    move-object/from16 p5, v10

    move-object/from16 v10, v31

    const/16 p4, 0x2

    .line 88
    :cond_25
    const-string v8, "org.springframework.security.core.authority.SimpleGrantedAuthority"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_26

    .line 89
    array-length v8, v7

    const/4 v9, 0x1

    if-ne v8, v9, :cond_27

    aget-object v7, v7, v26

    if-ne v7, v11, :cond_27

    .line 90
    new-array v2, v9, [Ljava/lang/String;

    const-string v0, "authority"

    aput-object v0, v2, v26

    goto :goto_19

    :cond_26
    const/4 v9, 0x1

    .line 91
    :cond_27
    invoke-virtual {v6}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v7

    and-int/2addr v7, v9

    if-eqz v7, :cond_2a

    .line 92
    invoke-static {v6}, Lcom/alibaba/fastjson/util/ASMUtils;->lookupParameterNames(Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2a

    .line 93
    array-length v8, v7

    if-nez v8, :cond_28

    goto :goto_1a

    :cond_28
    if-eqz v23, :cond_29

    if-eqz v3, :cond_29

    .line 94
    array-length v8, v7

    array-length v9, v3

    if-gt v8, v9, :cond_29

    goto :goto_1a

    :cond_29
    move-object/from16 v23, v6

    move-object v3, v7

    :cond_2a
    :goto_1a
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v31, v10

    const/4 v9, 0x1

    move-object/from16 v10, p5

    goto/16 :goto_18

    :cond_2b
    move-object/from16 p5, v10

    move-object/from16 v10, v31

    const/16 p4, 0x2

    move-object v9, v3

    :goto_1b
    if-eqz v9, :cond_2c

    .line 95
    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    goto :goto_1c

    :cond_2c
    move-object/from16 v0, v25

    :goto_1c
    if-eqz v9, :cond_35

    .line 96
    array-length v2, v0

    array-length v3, v9

    if-ne v2, v3, :cond_35

    .line 97
    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/util/TypeUtils;->getParameterAnnotations(Ljava/lang/reflect/Constructor;)[[Ljava/lang/annotation/Annotation;

    move-result-object v17

    move/from16 v2, v26

    .line 98
    :goto_1d
    array-length v3, v0

    if-ge v2, v3, :cond_33

    .line 99
    aget-object v3, v17, v2

    .line 100
    aget-object v5, v9, v2

    .line 101
    array-length v6, v3

    move/from16 v7, v26

    :goto_1e
    if-ge v7, v6, :cond_2e

    aget-object v8, v3, v7

    move-object/from16 v24, v0

    .line 102
    instance-of v0, v8, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v0, :cond_2d

    .line 103
    move-object v0, v8

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONField;

    goto :goto_1f

    :cond_2d
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v0, v24

    goto :goto_1e

    :cond_2e
    move-object/from16 v24, v0

    move-object/from16 v0, v25

    .line 104
    :goto_1f
    aget-object v3, v24, v2

    .line 105
    invoke-virtual/range {v23 .. v23}, Ljava/lang/reflect/Constructor;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v6

    aget-object v6, v6, v2

    .line 106
    invoke-static {v4, v5, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v7

    if-eqz v7, :cond_2f

    if-nez v0, :cond_2f

    move-object/from16 v8, v30

    .line 107
    invoke-static {v7, v8}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Field;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONField;

    goto :goto_20

    :cond_2f
    move-object/from16 v8, v30

    :goto_20
    if-nez v0, :cond_31

    .line 108
    const-string v0, "org.springframework.security.core.userdetails.User"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    const-string v0, "password"

    .line 109
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 110
    sget-object v0, Lcom/alibaba/fastjson/parser/Feature;->InitStringFieldAsEmpty:Lcom/alibaba/fastjson/parser/Feature;

    iget v0, v0, Lcom/alibaba/fastjson/parser/Feature;->mask:I

    move-object/from16 v30, v8

    move/from16 v28, v26

    move v8, v0

    move-object v0, v7

    move/from16 v7, v28

    goto :goto_21

    :cond_30
    move-object v0, v7

    move-object/from16 v30, v8

    move/from16 v7, v26

    move v8, v7

    move/from16 v28, v8

    goto :goto_21

    .line 111
    :cond_31
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v28

    .line 112
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v30

    if-eqz v30, :cond_32

    move-object/from16 v5, v28

    .line 113
    :cond_32
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v28

    .line 114
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v30

    .line 115
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v0

    invoke-static {v0}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v0

    move-object/from16 v42, v8

    move v8, v0

    move-object v0, v7

    move/from16 v7, v30

    move-object/from16 v30, v42

    .line 116
    :goto_21
    new-instance v31, Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v42, v5

    move-object v5, v0

    move-object/from16 v0, v31

    move-object/from16 v31, v9

    move-object/from16 v9, v30

    move/from16 v30, v2

    move-object v2, v4

    move-object v4, v6

    move/from16 v6, v28

    move-object/from16 v28, v24

    move-object/from16 v24, v1

    move-object/from16 v1, v42

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;III)V

    .line 117
    invoke-static {v13, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    add-int/lit8 v2, v30, 0x1

    move-object/from16 v4, p0

    move-object/from16 v30, v9

    move-object/from16 v1, v24

    move-object/from16 v0, v28

    move-object/from16 v9, v31

    goto/16 :goto_1d

    :cond_33
    move-object/from16 v9, v30

    if-nez p2, :cond_34

    .line 118
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "javax.servlet.http.Cookie"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    .line 119
    new-instance v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object/from16 v1, p0

    move-object v8, v13

    move-object/from16 v7, v19

    move-object/from16 v2, v20

    move-object/from16 v4, v23

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    return-object v0

    :cond_34
    move-object/from16 v1, p0

    move-object v8, v13

    move-object/from16 v13, v20

    move-object/from16 v4, v23

    move-object/from16 v17, p5

    move-object/from16 v23, v4

    goto :goto_23

    :cond_35
    move-object v1, v4

    .line 120
    const-string v0, "default constructor not found. "

    invoke-static {v0, v1}, Ll/rkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v25

    :cond_36
    move-object/from16 p5, v10

    goto/16 :goto_16

    :goto_22
    move-object/from16 v17, p5

    goto :goto_23

    :cond_37
    move-object v1, v4

    move-object v10, v5

    move-object v9, v11

    move-object/from16 v29, v12

    move-object/from16 v13, v20

    const/16 p4, 0x2

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object v12, v6

    move-object v11, v7

    move-object/from16 v23, v25

    :goto_23
    if-eqz v21, :cond_38

    .line 121
    invoke-static/range {v21 .. v21}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 122
    :cond_38
    const-string v0, "set"

    if-eqz v13, :cond_4c

    .line 123
    const-class v2, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    invoke-static {v13, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    if-eqz v3, :cond_39

    .line 124
    invoke-interface {v3}, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;->withPrefix()Ljava/lang/String;

    move-result-object v3

    goto :goto_24

    :cond_39
    move-object/from16 v3, v25

    :goto_24
    if-nez v3, :cond_3a

    .line 125
    const-string v3, "with"

    .line 126
    :cond_3a
    invoke-virtual {v13}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    array-length v5, v4

    move/from16 v6, v26

    :goto_25
    if-ge v6, v5, :cond_46

    move-object v7, v2

    aget-object v2, v4, v6

    .line 127
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v20

    if-eqz v20, :cond_3b

    move-object/from16 v33, v3

    move-object/from16 v16, v4

    move/from16 v20, v5

    move/from16 v24, v6

    move-object/from16 v35, v7

    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v34, v14

    move-object/from16 p2, v15

    move-object/from16 v12, v29

    move-object v15, v0

    :goto_26
    move-object v14, v8

    goto/16 :goto_2c

    :cond_3b
    move-object/from16 p2, v0

    .line 128
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    :goto_27
    move-object/from16 v16, v15

    move-object/from16 v15, p2

    move-object/from16 p2, v16

    move-object/from16 v33, v3

    move-object/from16 v16, v4

    move/from16 v20, v5

    move/from16 v24, v6

    move-object/from16 v35, v7

    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v34, v14

    move-object/from16 v12, v29

    goto :goto_26

    .line 129
    :cond_3c
    invoke-static {v2, v9}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONField;

    if-nez v0, :cond_3d

    .line 130
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getSuperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v0

    :cond_3d
    if-eqz v0, :cond_40

    .line 131
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v20

    if-nez v20, :cond_3e

    goto :goto_27

    :cond_3e
    move/from16 v20, v6

    .line 132
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v6

    .line 133
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v24

    .line 134
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v28

    .line 135
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->length()I

    move-result v30

    if-eqz v30, :cond_3f

    .line 136
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v30, v9

    move-object v9, v0

    .line 137
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v31, v10

    const/4 v10, 0x0

    move-object/from16 v32, v11

    const/4 v11, 0x0

    move-object/from16 v33, v3

    const/4 v3, 0x0

    move-object/from16 v16, v15

    move-object/from16 v15, p2

    move-object/from16 p2, v16

    move-object/from16 v16, v4

    move-object/from16 v35, v7

    move-object/from16 v37, v12

    move-object/from16 v34, v14

    move/from16 v7, v24

    move-object/from16 v12, v29

    move-object/from16 v40, v30

    move-object/from16 v36, v31

    move-object/from16 v38, v32

    move-object/from16 v4, p0

    move-object v14, v8

    move/from16 v24, v20

    move/from16 v8, v28

    move/from16 v20, v5

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_2c

    :cond_3f
    move-object/from16 v35, v7

    move-object/from16 v34, v14

    move/from16 v7, v24

    move-object v14, v8

    move/from16 v24, v20

    move/from16 v8, v28

    move-object/from16 v16, v15

    move-object/from16 v15, p2

    move-object/from16 p2, v16

    move-object/from16 v33, v3

    move-object/from16 v16, v4

    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v12, v29

    move-object v9, v0

    move/from16 v20, v5

    goto :goto_28

    :cond_40
    move/from16 v24, v6

    move-object/from16 v35, v7

    move-object/from16 v34, v14

    move-object v14, v8

    move/from16 v6, v26

    move v7, v6

    move v8, v7

    move-object/from16 v16, v15

    move-object/from16 v15, p2

    move-object/from16 p2, v16

    move-object/from16 v33, v3

    move-object/from16 v16, v4

    move/from16 v20, v5

    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v12, v29

    move-object v9, v0

    .line 138
    :goto_28
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 139
    invoke-virtual {v0, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x3

    if-le v1, v3, :cond_41

    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_29
    move-object v3, v1

    move/from16 v0, v26

    move-object/from16 v1, v33

    goto :goto_2b

    .line 141
    :cond_41
    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_42

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_29

    :cond_42
    move-object/from16 v1, v33

    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_43

    :goto_2a
    move-object/from16 v33, v1

    goto :goto_2c

    .line 144
    :cond_43
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v3, v4, :cond_44

    goto :goto_2a

    .line 145
    :cond_44
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v26

    .line 146
    :goto_2b
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_45

    invoke-static {v4}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v5

    if-nez v5, :cond_45

    goto :goto_2a

    .line 148
    :cond_45
    invoke-static {v4}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    invoke-virtual {v3, v0, v4}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 149
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v33, v1

    move-object v1, v0

    .line 150
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v3, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    :goto_2c
    add-int/lit8 v6, v24, 0x1

    move-object/from16 v1, p0

    move-object/from16 v29, v12

    move-object v8, v14

    move-object v0, v15

    move-object/from16 v4, v16

    move/from16 v5, v20

    move-object/from16 v3, v33

    move-object/from16 v14, v34

    move-object/from16 v2, v35

    move-object/from16 v10, v36

    move-object/from16 v12, v37

    move-object/from16 v11, v38

    move-object/from16 v9, v40

    const/16 p4, 0x2

    const/16 v26, 0x0

    move-object/from16 v15, p2

    goto/16 :goto_25

    :cond_46
    move-object v7, v2

    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v34, v14

    move-object/from16 p2, v15

    move-object/from16 v12, v29

    move-object v15, v0

    move-object v14, v8

    .line 151
    invoke-static {v13, v7}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    if-eqz v0, :cond_47

    .line 152
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;->buildMethod()Ljava/lang/String;

    move-result-object v1

    goto :goto_2d

    :cond_47
    move-object/from16 v1, v25

    :goto_2d
    if-eqz v1, :cond_49

    .line 153
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_48

    goto :goto_2f

    :cond_48
    :goto_2e
    move-object/from16 v0, v25

    goto :goto_30

    .line 154
    :cond_49
    :goto_2f
    const-string v1, "build"

    goto :goto_2e

    .line 155
    :goto_30
    :try_start_0
    invoke-virtual {v13, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_31

    :catch_0
    move-object/from16 v6, v18

    :goto_31
    if-nez v6, :cond_4a

    .line 156
    :try_start_1
    const-string v1, "create"

    invoke-virtual {v13, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v6, v1

    :catch_1
    :cond_4a
    if-eqz v6, :cond_4b

    .line 157
    invoke-static {v6}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    move-object/from16 v18, v6

    const/16 v25, 0x0

    :goto_32
    move-object/from16 v0, p2

    goto :goto_33

    .line 158
    :cond_4b
    const-string v0, "buildMethod not found."

    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    const/16 v25, 0x0

    return-object v25

    :cond_4c
    move-object/from16 v40, v9

    move-object/from16 v36, v10

    move-object/from16 v38, v11

    move-object/from16 v37, v12

    move-object/from16 v34, v14

    move-object/from16 p2, v15

    move-object/from16 v12, v29

    move-object v15, v0

    move-object v14, v8

    goto :goto_32

    .line 159
    :goto_33
    array-length v1, v0

    const/4 v2, 0x0

    :goto_34
    if-ge v2, v1, :cond_6e

    move v4, v2

    aget-object v2, v0, v4

    .line 160
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 161
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-eqz v6, :cond_4d

    :goto_35
    move-object/from16 v5, p1

    move-object/from16 v16, v0

    move/from16 v20, v1

    move/from16 v24, v4

    :goto_36
    move-object/from16 p2, v13

    move-object/from16 v26, v15

    move-object/from16 v13, v22

    move-object/from16 v32, v38

    move-object/from16 v15, v40

    const/16 v28, 0x0

    const/16 v39, 0x2

    :goto_37
    move-object/from16 v4, p0

    goto/16 :goto_43

    .line 162
    :cond_4d
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    .line 163
    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4e

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4e

    goto :goto_35

    .line 164
    :cond_4e
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v7, v37

    if-ne v6, v7, :cond_50

    :cond_4f
    move-object/from16 v5, p1

    move-object/from16 v16, v0

    move/from16 v20, v1

    move/from16 v24, v4

    move-object/from16 v37, v7

    goto :goto_36

    .line 165
    :cond_50
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 166
    array-length v8, v6

    if-eqz v8, :cond_4f

    array-length v8, v6

    const/4 v9, 0x2

    if-le v8, v9, :cond_51

    move-object/from16 v5, p1

    move-object/from16 v16, v0

    move/from16 v20, v1

    move/from16 v24, v4

    move-object/from16 v37, v7

    move/from16 v39, v9

    move-object/from16 p2, v13

    move-object/from16 v26, v15

    move-object/from16 v13, v22

    move-object/from16 v32, v38

    move-object/from16 v15, v40

    const/16 v28, 0x0

    goto :goto_37

    :cond_51
    move-object/from16 v8, v40

    .line 167
    invoke-static {v2, v8}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    check-cast v10, Lcom/alibaba/fastjson/annotation/JSONField;

    const/4 v11, 0x0

    const/16 v16, 0x0

    move-object/from16 v30, v8

    if-eqz v10, :cond_54

    .line 168
    array-length v8, v6

    if-ne v8, v9, :cond_54

    const/16 v26, 0x0

    aget-object v8, v6, v26

    move-object/from16 v3, v38

    if-ne v8, v3, :cond_53

    const/16 v41, 0x1

    aget-object v8, v6, v41

    if-ne v8, v7, :cond_52

    move-object v8, v0

    .line 169
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    move/from16 v39, v9

    move-object v9, v10

    const/4 v10, 0x0

    move v6, v11

    const/4 v11, 0x0

    move v5, v1

    const-string v1, ""

    move-object/from16 v32, v3

    const/4 v3, 0x0

    move/from16 v24, v4

    move/from16 v20, v5

    move-object/from16 v37, v7

    move-object/from16 p2, v13

    move/from16 v7, v16

    move/from16 v13, v41

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v16, v8

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    :goto_38
    move-object/from16 v26, v15

    move-object/from16 v13, v22

    move-object/from16 v15, v30

    const/16 v28, 0x0

    goto/16 :goto_43

    :cond_52
    move/from16 v20, v1

    move-object/from16 v32, v3

    move/from16 v24, v4

    move-object/from16 v37, v7

    move/from16 v39, v9

    move-object v9, v10

    move-object/from16 p2, v13

    move/from16 v7, v16

    move/from16 v13, v41

    const/4 v8, 0x0

    :goto_39
    move-object/from16 v4, p0

    move-object/from16 v16, v0

    goto :goto_3b

    :cond_53
    move/from16 v20, v1

    move-object/from16 v32, v3

    move/from16 v24, v4

    move-object/from16 v37, v7

    move/from16 v39, v9

    move-object v9, v10

    move-object/from16 p2, v13

    move/from16 v7, v16

    :goto_3a
    const/4 v8, 0x0

    const/4 v13, 0x1

    goto :goto_39

    :cond_54
    move/from16 v20, v1

    move/from16 v24, v4

    move-object/from16 v37, v7

    move/from16 v39, v9

    move-object v9, v10

    move-object/from16 p2, v13

    move/from16 v7, v16

    move-object/from16 v32, v38

    goto :goto_3a

    .line 170
    :goto_3b
    array-length v0, v6

    if-eq v0, v13, :cond_56

    :cond_55
    :goto_3c
    move-object/from16 v5, p1

    goto :goto_38

    :cond_56
    if-nez v9, :cond_57

    .line 171
    invoke-static {v4, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getSuperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v10

    move-object v9, v10

    :cond_57
    if-nez v9, :cond_58

    .line 172
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_58

    goto :goto_3c

    :cond_58
    if-eqz v9, :cond_5b

    .line 173
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v0

    if-nez v0, :cond_59

    goto :goto_3c

    :cond_59
    move-object v0, v6

    .line 174
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v6

    .line 175
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v7

    .line 176
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v8

    .line 177
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_5a

    .line 178
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v1

    .line 179
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v3, 0x0

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_38

    :cond_5a
    move v11, v6

    goto :goto_3d

    :cond_5b
    move-object v0, v6

    :goto_3d
    if-nez v9, :cond_5c

    .line 180
    invoke-virtual {v5, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_55

    :cond_5c
    if-eqz p2, :cond_5d

    goto :goto_3c

    :cond_5d
    const/4 v3, 0x3

    .line 181
    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 182
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v6

    if-nez v6, :cond_5e

    const/16 v6, 0x200

    if-le v1, v6, :cond_5f

    :cond_5e
    move-object/from16 v6, v34

    goto/16 :goto_40

    :cond_5f
    const/16 v6, 0x5f

    if-ne v1, v6, :cond_62

    const/4 v6, 0x4

    .line 183
    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v6, v34

    .line 184
    invoke-static {v4, v1, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v10

    if-nez v10, :cond_61

    .line 185
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 186
    invoke-static {v4, v5, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v10

    if-nez v10, :cond_60

    goto :goto_3e

    :cond_60
    move-object v1, v5

    :cond_61
    :goto_3e
    move-object v3, v1

    move-object v1, v10

    goto/16 :goto_41

    :cond_62
    move-object/from16 v6, v34

    const/16 v10, 0x66

    if-ne v1, v10, :cond_63

    .line 187
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :goto_3f
    move-object v3, v1

    move-object/from16 v1, v25

    goto :goto_41

    .line 188
    :cond_63
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v10, 0x5

    if-lt v1, v10, :cond_64

    const/4 v1, 0x4

    invoke-virtual {v5, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-eqz v1, :cond_64

    .line 189
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3f

    .line 190
    :cond_64
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 191
    invoke-static {v4, v1, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v5

    if-nez v5, :cond_65

    move-object/from16 v5, p1

    move-object/from16 v34, v6

    goto/16 :goto_38

    :cond_65
    move-object v3, v1

    move-object v1, v5

    goto :goto_41

    .line 192
    :goto_40
    sget-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    if-eqz v1, :cond_66

    .line 193
    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3f

    .line 194
    :cond_66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v3, 0x4

    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3f

    :goto_41
    if-nez v1, :cond_67

    .line 195
    invoke-static {v4, v3, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v1

    :cond_67
    const/4 v5, 0x0

    if-nez v1, :cond_68

    .line 196
    aget-object v0, v0, v5

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v10, :cond_68

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "is"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    invoke-static {v4, v0, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v1

    :cond_68
    if-eqz v1, :cond_6c

    move-object/from16 v0, v30

    .line 199
    invoke-static {v1, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Field;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    check-cast v10, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v10, :cond_6b

    .line 200
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v7

    if-nez v7, :cond_69

    move/from16 v28, v5

    move-object/from16 v34, v6

    move-object/from16 v26, v15

    move-object/from16 v13, v22

    move-object/from16 v5, p1

    move-object v15, v0

    goto/16 :goto_43

    :cond_69
    move-object/from16 v34, v6

    .line 201
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v6

    .line 202
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    invoke-static {v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v7

    .line 203
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v8

    invoke-static {v8}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v8

    .line 204
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_6a

    move-object v3, v1

    .line 205
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v30, v0

    .line 206
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v11, 0x0

    move/from16 v28, v5

    move-object/from16 v26, v15

    move-object/from16 v15, v30

    move-object/from16 v13, v34

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    move-object/from16 v4, p0

    move-object/from16 v13, v22

    goto :goto_43

    :cond_6a
    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    move/from16 v28, v5

    move-object/from16 v26, v15

    move-object/from16 v13, v34

    move-object v15, v0

    goto :goto_42

    :cond_6b
    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    move/from16 v28, v5

    move-object v13, v6

    move-object/from16 v26, v15

    move-object v15, v0

    move v6, v11

    goto :goto_42

    :cond_6c
    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    move/from16 v28, v5

    move-object v13, v6

    move-object/from16 v26, v15

    move-object/from16 v15, v30

    move v6, v11

    move-object/from16 v10, v25

    :goto_42
    if-eqz v22, :cond_6d

    move-object/from16 v0, v22

    .line 207
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/PropertyNamingStrategy;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 208
    :cond_6d
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v11, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v34, v13

    move-object/from16 v13, v22

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    :goto_43
    add-int/lit8 v2, v24, 0x1

    move-object/from16 v22, v13

    move-object/from16 v40, v15

    move-object/from16 v0, v16

    move/from16 v1, v20

    move-object/from16 v15, v26

    move-object/from16 v38, v32

    move-object/from16 v13, p2

    goto/16 :goto_34

    :cond_6e
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 p2, v13

    move-object/from16 v13, v22

    move-object/from16 v15, v40

    const/16 v28, 0x0

    .line 209
    invoke-virtual {v4}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 210
    invoke-static {v4, v5, v13, v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->computeFields(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;Ljava/util/List;[Ljava/lang/reflect/Field;)V

    .line 211
    invoke-virtual {v4}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    array-length v1, v0

    move/from16 v2, v28

    :goto_44
    if-ge v2, v1, :cond_7a

    move/from16 v28, v2

    aget-object v2, v0, v28

    .line 212
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    .line 213
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x4

    if-ge v6, v7, :cond_6f

    move-object/from16 v20, v0

    move/from16 v22, v1

    move/from16 v16, v7

    move-object/from16 v30, v15

    move-object/from16 v15, v34

    move-object/from16 v31, v36

    :goto_45
    const/16 v27, 0x3

    goto/16 :goto_4c

    .line 214
    :cond_6f
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-eqz v6, :cond_71

    :cond_70
    :goto_46
    move-object/from16 v20, v0

    move/from16 v22, v1

    move-object/from16 v30, v15

    move-object/from16 v15, v34

    move-object/from16 v31, v36

    :goto_47
    const/16 v16, 0x4

    goto :goto_45

    :cond_71
    if-nez p2, :cond_70

    .line 215
    const-string v6, "get"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_70

    const/4 v9, 0x3

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v6

    if-eqz v6, :cond_70

    .line 216
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    array-length v6, v6

    if-eqz v6, :cond_72

    goto :goto_46

    .line 217
    :cond_72
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v7, v36

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_74

    const-class v6, Ljava/util/Map;

    .line 218
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_74

    const-class v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 219
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    if-eq v6, v8, :cond_74

    const-class v6, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 220
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    if-eq v6, v8, :cond_74

    const-class v6, Ljava/util/concurrent/atomic/AtomicLong;

    .line 221
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    if-ne v6, v8, :cond_73

    goto :goto_49

    :cond_73
    :goto_48
    move-object/from16 v20, v0

    move/from16 v22, v1

    move-object/from16 v31, v7

    move-object/from16 v30, v15

    move-object/from16 v15, v34

    goto :goto_47

    .line 222
    :cond_74
    :goto_49
    invoke-static {v2, v15}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v9, :cond_75

    .line 223
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v6

    if-eqz v6, :cond_75

    goto :goto_48

    :cond_75
    if-eqz v9, :cond_76

    .line 224
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_76

    .line 225
    invoke-interface {v9}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v6, v34

    const/4 v8, 0x3

    const/4 v10, 0x4

    goto :goto_4b

    .line 226
    :cond_76
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v8, 0x3

    invoke-virtual {v3, v8}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v10, 0x4

    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v6, v34

    .line 227
    invoke-static {v4, v3, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v11

    if-eqz v11, :cond_77

    .line 228
    invoke-static {v11, v15}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Field;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v11

    check-cast v11, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v11, :cond_77

    .line 229
    invoke-interface {v11}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v11

    if-nez v11, :cond_77

    :goto_4a
    move-object/from16 v20, v0

    move/from16 v22, v1

    move-object/from16 v31, v7

    move/from16 v27, v8

    move/from16 v16, v10

    move-object/from16 v30, v15

    move-object v15, v6

    goto :goto_4c

    :cond_77
    :goto_4b
    if-eqz v13, :cond_78

    .line 230
    invoke-virtual {v13, v3}, Lcom/alibaba/fastjson/PropertyNamingStrategy;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 231
    :cond_78
    invoke-static {v14, v3}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getField(Ljava/util/List;Ljava/lang/String;)Lcom/alibaba/fastjson/util/FieldInfo;

    move-result-object v11

    if-eqz v11, :cond_79

    goto :goto_4a

    :cond_79
    move-object v11, v0

    .line 232
    new-instance v0, Lcom/alibaba/fastjson/util/FieldInfo;

    move/from16 v16, v10

    const/4 v10, 0x0

    move-object/from16 v20, v11

    const/4 v11, 0x0

    move/from16 v22, v1

    move-object v1, v3

    const/4 v3, 0x0

    move-object/from16 v34, v6

    const/4 v6, 0x0

    move-object/from16 v31, v7

    const/4 v7, 0x0

    move/from16 v27, v8

    const/4 v8, 0x0

    move-object/from16 v30, v15

    move-object/from16 v15, v34

    invoke-direct/range {v0 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v14, v0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    :goto_4c
    add-int/lit8 v2, v28, 0x1

    move-object/from16 v34, v15

    move-object/from16 v0, v20

    move/from16 v1, v22

    move-object/from16 v15, v30

    move-object/from16 v36, v31

    goto/16 :goto_44

    :cond_7a
    move-object/from16 v15, v34

    .line 233
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_7c

    .line 234
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->isXmlField(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7b

    const/16 v41, 0x1

    goto :goto_4d

    :cond_7b
    move/from16 v41, p3

    :goto_4d
    if-eqz v41, :cond_7c

    move-object v0, v4

    :goto_4e
    if-eqz v0, :cond_7c

    .line 235
    invoke-static {v4, v5, v13, v14, v15}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->computeFields(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;Ljava/util/List;[Ljava/lang/reflect/Field;)V

    .line 236
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4e

    .line 237
    :cond_7c
    new-instance v0, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-object/from16 v2, p2

    move-object v1, v4

    move-object v8, v14

    move-object/from16 v5, v17

    move-object/from16 v6, v18

    move-object/from16 v7, v19

    move-object/from16 v3, v21

    move-object/from16 v4, v23

    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    return-object v0
.end method

.method private static buildGenericInfo(Ljava/lang/Class;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Map<",
            "Ljava/lang/reflect/TypeVariable;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :goto_0
    move-object v6, v0

    .line 10
    move-object v0, p0

    .line 11
    move-object p0, v6

    .line 12
    if-eqz p0, :cond_4

    .line 13
    .line 14
    const-class v2, Ljava/lang/Object;

    .line 15
    .line 16
    if-eq p0, v2, :cond_4

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    instance-of v2, v2, Ljava/lang/reflect/ParameterizedType;

    .line 23
    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v3, 0x0

    .line 41
    :goto_1
    array-length v4, v0

    .line 42
    if-ge v3, v4, :cond_3

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    new-instance v1, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    :cond_1
    aget-object v4, v0, v3

    .line 52
    .line 53
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_2

    .line 58
    .line 59
    aget-object v4, v0, v3

    .line 60
    .line 61
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Ljava/lang/reflect/Type;

    .line 66
    .line 67
    aget-object v5, v2, v3

    .line 68
    .line 69
    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    aget-object v4, v2, v3

    .line 74
    .line 75
    aget-object v5, v0, v3

    .line 76
    .line 77
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    return-object v1
.end method

.method private static computeFields(Ljava/lang/Class;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/PropertyNamingStrategy;Ljava/util/List;[Ljava/lang/reflect/Field;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/PropertyNamingStrategy;",
            "Ljava/util/List<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;[",
            "Ljava/lang/reflect/Field;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p4

    .line 4
    .line 5
    invoke-static/range {p0 .. p0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildGenericInfo(Ljava/lang/Class;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v14

    .line 9
    array-length v15, v1

    .line 10
    const/16 v16, 0x0

    .line 11
    .line 12
    move/from16 v2, v16

    .line 13
    .line 14
    :goto_0
    if-ge v2, v15, :cond_9

    .line 15
    .line 16
    aget-object v5, v1, v2

    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    and-int/lit8 v4, v3, 0x8

    .line 23
    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    :cond_0
    :goto_1
    move/from16 v17, v2

    .line 27
    .line 28
    move-object/from16 v2, p3

    .line 29
    .line 30
    goto/16 :goto_3

    .line 31
    .line 32
    :cond_1
    and-int/lit8 v3, v3, 0x10

    .line 33
    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const-class v4, Ljava/util/Map;

    .line 41
    .line 42
    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    const-class v4, Ljava/util/Collection;

    .line 49
    .line 50
    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    const-class v4, Ljava/util/concurrent/atomic/AtomicLong;

    .line 57
    .line 58
    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_2

    .line 63
    .line 64
    const-class v4, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    .line 66
    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_2

    .line 71
    .line 72
    const-class v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 73
    .line 74
    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_0

    .line 79
    .line 80
    :cond_2
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 95
    .line 96
    iget-object v4, v4, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_3

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 114
    .line 115
    invoke-static {v5, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Field;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    move-object v12, v4

    .line 120
    check-cast v12, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 121
    .line 122
    if-eqz v12, :cond_7

    .line 123
    .line 124
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-nez v4, :cond_5

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_5
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-static {v6}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    invoke-static {v7}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 156
    .line 157
    .line 158
    move-result v8

    .line 159
    if-eqz v8, :cond_6

    .line 160
    .line 161
    invoke-interface {v12}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    :cond_6
    move v8, v4

    .line 166
    move v9, v6

    .line 167
    move v10, v7

    .line 168
    goto :goto_2

    .line 169
    :cond_7
    move/from16 v8, v16

    .line 170
    .line 171
    move v9, v8

    .line 172
    move v10, v9

    .line 173
    :goto_2
    if-eqz v0, :cond_8

    .line 174
    .line 175
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/PropertyNamingStrategy;->translate(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    :cond_8
    move v4, v2

    .line 180
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 181
    .line 182
    const/4 v11, 0x0

    .line 183
    const/4 v13, 0x0

    .line 184
    move v6, v4

    .line 185
    const/4 v4, 0x0

    .line 186
    move-object/from16 v7, p1

    .line 187
    .line 188
    move/from16 v17, v6

    .line 189
    .line 190
    move-object/from16 v6, p0

    .line 191
    .line 192
    invoke-direct/range {v2 .. v14}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IIILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;Ljava/util/Map;)V

    .line 193
    .line 194
    .line 195
    move-object v3, v2

    .line 196
    move-object/from16 v2, p3

    .line 197
    .line 198
    invoke-static {v2, v3}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    .line 199
    .line 200
    .line 201
    :goto_3
    add-int/lit8 v3, v17, 0x1

    .line 202
    .line 203
    move v2, v3

    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :cond_9
    return-void
.end method

.method public static getBuilderClass(Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 36
    invoke-static {v0, p0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getBuilderClass(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public static getBuilderClass(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "org.springframework.security.web.savedrequest.DefaultSavedRequest"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "org.springframework.security.web.savedrequest.DefaultSavedRequest$Builder"

    .line 16
    .line 17
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    invoke-interface {p1}, Lcom/alibaba/fastjson/annotation/JSONType;->builder()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-class v0, Ljava/lang/Void;

    .line 31
    .line 32
    if-ne p1, v0, :cond_2

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    return-object p1
.end method

.method public static getCreatorConstructor([Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/Constructor;",
            ")",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v4, v1

    .line 5
    move v3, v2

    .line 6
    :goto_0
    const-string v5, "multi-JSONCreator"

    .line 7
    .line 8
    if-ge v3, v0, :cond_2

    .line 9
    .line 10
    aget-object v6, p0, v3

    .line 11
    .line 12
    const-class v7, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 13
    .line 14
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 15
    .line 16
    .line 17
    move-result-object v7

    .line 18
    check-cast v7, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 19
    .line 20
    if-eqz v7, :cond_1

    .line 21
    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    move-object v4, v6

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    if-eqz v4, :cond_3

    .line 34
    .line 35
    return-object v4

    .line 36
    :cond_3
    array-length v0, p0

    .line 37
    move v3, v2

    .line 38
    :goto_2
    if-ge v3, v0, :cond_9

    .line 39
    .line 40
    aget-object v6, p0, v3

    .line 41
    .line 42
    invoke-static {v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getParameterAnnotations(Ljava/lang/reflect/Constructor;)[[Ljava/lang/annotation/Annotation;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    array-length v8, v7

    .line 47
    if-nez v8, :cond_4

    .line 48
    .line 49
    goto :goto_5

    .line 50
    :cond_4
    array-length v8, v7

    .line 51
    move v9, v2

    .line 52
    :goto_3
    if-ge v9, v8, :cond_6

    .line 53
    .line 54
    aget-object v10, v7, v9

    .line 55
    .line 56
    array-length v11, v10

    .line 57
    move v12, v2

    .line 58
    :goto_4
    if-ge v12, v11, :cond_7

    .line 59
    .line 60
    aget-object v13, v10, v12

    .line 61
    .line 62
    instance-of v13, v13, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 63
    .line 64
    if-eqz v13, :cond_5

    .line 65
    .line 66
    add-int/lit8 v9, v9, 0x1

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_5
    add-int/lit8 v12, v12, 0x1

    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_6
    if-nez v4, :cond_8

    .line 73
    .line 74
    move-object v4, v6

    .line 75
    :cond_7
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_8
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_9
    return-object v4
.end method

.method public static getDefaultConstructor(Ljava/lang/Class;[Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/reflect/Constructor<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    array-length v0, p1

    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    if-ge v3, v0, :cond_2

    .line 17
    .line 18
    aget-object v4, p1, v3

    .line 19
    .line 20
    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    array-length v5, v5

    .line 25
    if-nez v5, :cond_1

    .line 26
    .line 27
    move-object v1, v4

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    :goto_1
    if-nez v1, :cond_4

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Class;->isMemberClass()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    array-length v0, p1

    .line 51
    move v3, v2

    .line 52
    :goto_2
    if-ge v3, v0, :cond_4

    .line 53
    .line 54
    aget-object v4, p1, v3

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    array-length v6, v5

    .line 61
    const/4 v7, 0x1

    .line 62
    if-ne v6, v7, :cond_3

    .line 63
    .line 64
    aget-object v5, v5, v2

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-eqz v5, :cond_3

    .line 75
    .line 76
    return-object v4

    .line 77
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    return-object v1
.end method

.method private static getFactoryMethod(Ljava/lang/Class;[Ljava/lang/reflect/Method;Z)Ljava/lang/reflect/Method;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/reflect/Method;",
            "Z)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v4, v1

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v0, :cond_4

    .line 7
    .line 8
    aget-object v5, p1, v3

    .line 9
    .line 10
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 11
    .line 12
    .line 13
    move-result v6

    .line 14
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    if-nez v6, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-virtual {p0, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-nez v6, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const-class v6, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 33
    .line 34
    invoke-static {v5, v6}, Lcom/alibaba/fastjson/util/TypeUtils;->getAnnotation(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    check-cast v6, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 39
    .line 40
    if-eqz v6, :cond_3

    .line 41
    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    move-object v4, v5

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const-string p0, "multi-JSONCreator"

    .line 47
    .line 48
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v1

    .line 52
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_4
    if-nez v4, :cond_6

    .line 56
    .line 57
    if-eqz p2, :cond_6

    .line 58
    .line 59
    array-length p0, p1

    .line 60
    :goto_2
    if-ge v2, p0, :cond_6

    .line 61
    .line 62
    aget-object p2, p1, v2

    .line 63
    .line 64
    invoke-static {p2}, Lcom/alibaba/fastjson/util/TypeUtils;->isJacksonCreator(Ljava/lang/reflect/Method;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    return-object p2

    .line 71
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_6
    return-object v4
.end method

.method private static getField(Ljava/util/List;Ljava/lang/String;)Lcom/alibaba/fastjson/util/FieldInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/alibaba/fastjson/util/FieldInfo;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, v0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    :goto_0
    return-object v0

    .line 47
    :cond_2
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method
