.class public Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;
.super Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;
.source "SourceFile"


# instance fields
.field private final b:Lcom/google/gson/internal/ConstructorConstructor;

.field private final c:Lcom/google/gson/FieldNamingStrategy;

.field private final d:Lcom/google/gson/internal/Excluder;


# direct methods
.method public constructor <init>(Lcom/google/gson/internal/ConstructorConstructor;Lcom/google/gson/FieldNamingStrategy;Lcom/google/gson/internal/Excluder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->b:Lcom/google/gson/internal/ConstructorConstructor;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->c:Lcom/google/gson/FieldNamingStrategy;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->d:Lcom/google/gson/internal/Excluder;

    .line 9
    .line 10
    return-void
.end method

.method private d(Ljava/lang/reflect/Field;Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->d:Lcom/google/gson/internal/Excluder;

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->e(Ljava/lang/reflect/Field;ZLcom/google/gson/internal/Excluder;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private static e(Ljava/lang/reflect/Field;ZLcom/google/gson/internal/Excluder;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2, v0, p1}, Lcom/google/gson/internal/Excluder;->excludeClass(Ljava/lang/Class;Z)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, p0, p1}, Lcom/google/gson/internal/Excluder;->excludeField(Ljava/lang/reflect/Field;Z)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private f(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;Ljava/lang/Class;)Ljava/util/Map;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/Gson;",
            "Lcom/google/gson/reflect/TypeToken<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/fvc0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Class;->isInterface()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_5

    .line 15
    .line 16
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    move-object/from16 v3, p2

    .line 21
    .line 22
    move-object/from16 v4, p3

    .line 23
    .line 24
    :goto_0
    const-class v5, Ljava/lang/Object;

    .line 25
    .line 26
    if-eq v4, v5, :cond_7

    .line 27
    .line 28
    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    array-length v6, v5

    .line 33
    const/4 v7, 0x0

    .line 34
    move v8, v7

    .line 35
    :goto_1
    if-ge v8, v6, :cond_6

    .line 36
    .line 37
    aget-object v11, v5, v8

    .line 38
    .line 39
    const/4 v9, 0x1

    .line 40
    invoke-direct {v0, v11, v9}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->d(Ljava/lang/reflect/Field;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v10

    .line 44
    invoke-direct {v0, v11, v7}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->d(Ljava/lang/reflect/Field;Z)Z

    .line 45
    .line 46
    .line 47
    move-result v15

    .line 48
    if-nez v10, :cond_1

    .line 49
    .line 50
    if-nez v15, :cond_1

    .line 51
    .line 52
    goto :goto_4

    .line 53
    :cond_1
    invoke-virtual {v11, v9}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    .line 61
    .line 62
    .line 63
    move-result-object v12

    .line 64
    invoke-static {v9, v4, v12}, Lcom/google/gson/internal/$Gson$Types;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    .line 65
    .line 66
    .line 67
    move-result-object v16

    .line 68
    invoke-direct {v0, v11}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->g(Ljava/lang/reflect/Field;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v9

    .line 72
    const/16 v17, 0x0

    .line 73
    .line 74
    move v12, v7

    .line 75
    move-object/from16 v18, v17

    .line 76
    .line 77
    :goto_2
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v13

    .line 81
    if-ge v12, v13, :cond_4

    .line 82
    .line 83
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v13

    .line 87
    check-cast v13, Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v12, :cond_2

    .line 90
    .line 91
    move v14, v7

    .line 92
    goto :goto_3

    .line 93
    :cond_2
    move v14, v10

    .line 94
    :goto_3
    iget-object v10, v0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->b:Lcom/google/gson/internal/ConstructorConstructor;

    .line 95
    .line 96
    move/from16 v19, v12

    .line 97
    .line 98
    move-object v12, v13

    .line 99
    invoke-static/range {v16 .. v16}, Lcom/google/gson/reflect/TypeToken;->get(Ljava/lang/reflect/Type;)Lcom/google/gson/reflect/TypeToken;

    .line 100
    .line 101
    .line 102
    move-result-object v13

    .line 103
    move/from16 v20, v19

    .line 104
    .line 105
    move-object/from16 v19, v9

    .line 106
    .line 107
    move-object/from16 v9, p1

    .line 108
    .line 109
    invoke-static/range {v9 .. v15}, Lcom/immomo/molive/foundation/util/safegson/factory/a;->b(Lcom/google/gson/Gson;Lcom/google/gson/internal/ConstructorConstructor;Ljava/lang/reflect/Field;Ljava/lang/String;Lcom/google/gson/reflect/TypeToken;ZZ)Ll/fvc0;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    invoke-interface {v1, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    check-cast v9, Ll/fvc0;

    .line 118
    .line 119
    if-nez v18, :cond_3

    .line 120
    .line 121
    move-object/from16 v18, v9

    .line 122
    .line 123
    :cond_3
    add-int/lit8 v12, v20, 0x1

    .line 124
    .line 125
    move v10, v14

    .line 126
    move-object/from16 v9, v19

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    if-nez v18, :cond_5

    .line 130
    .line 131
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v1, " declares multiple JSON fields named "

    .line 143
    .line 144
    invoke-virtual/range {v18 .. v18}, Ll/fvc0;->a()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v0, v1, v2}, Ll/src0;->a(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return-object v17

    .line 152
    :cond_6
    invoke-virtual {v3}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v4}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    invoke-static {v3, v4, v5}, Lcom/google/gson/internal/$Gson$Types;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-static {v3}, Lcom/google/gson/reflect/TypeToken;->get(Ljava/lang/reflect/Type;)Lcom/google/gson/reflect/TypeToken;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v3}, Lcom/google/gson/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_7
    :goto_5
    return-object v1
.end method

.method private g(Ljava/lang/reflect/Field;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->c:Lcom/google/gson/FieldNamingStrategy;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/immomo/molive/foundation/util/safegson/factory/a;->d(Lcom/google/gson/FieldNamingStrategy;Ljava/lang/reflect/Field;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public create(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)Lcom/google/gson/TypeAdapter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/Gson;",
            "Lcom/google/gson/reflect/TypeToken<",
            "TT;>;)",
            "Lcom/google/gson/TypeAdapter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/immomo/molive/foundation/util/safegson/factory/a;->a(Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    instance-of v1, v1, Ljava/lang/reflect/GenericArrayType;

    .line 18
    .line 19
    if-nez v1, :cond_7

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    instance-of v1, v1, Ljava/lang/Class;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/lang/Class;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-class v1, Ljava/lang/Object;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    return-object v2

    .line 51
    :cond_2
    const-class v1, Ljava/util/Collection;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    return-object v2

    .line 60
    :cond_3
    const-class v1, Ljava/util/Map;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    return-object v2

    .line 69
    :cond_4
    const-class v1, Lcom/google/gson/annotations/JsonAdapter;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Lcom/google/gson/annotations/JsonAdapter;

    .line 76
    .line 77
    if-eqz v1, :cond_5

    .line 78
    .line 79
    return-object v2

    .line 80
    :cond_5
    const-class v1, Ljava/lang/Enum;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_6

    .line 87
    .line 88
    if-eq v0, v1, :cond_6

    .line 89
    .line 90
    return-object v2

    .line 91
    :cond_6
    new-instance v1, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapter;

    .line 92
    .line 93
    iget-object v2, p0, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->b:Lcom/google/gson/internal/ConstructorConstructor;

    .line 94
    .line 95
    invoke-virtual {v2, p2}, Lcom/google/gson/internal/ConstructorConstructor;->get(Lcom/google/gson/reflect/TypeToken;)Lcom/google/gson/internal/ObjectConstructor;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;->f(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;Ljava/lang/Class;)Ljava/util/Map;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {v1, v2, p1}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapter;-><init>(Lcom/google/gson/internal/ObjectConstructor;Ljava/util/Map;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;->c()Ll/h5m;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v1, p0}, Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;->a(Ll/h5m;)V

    .line 111
    .line 112
    .line 113
    return-object v1

    .line 114
    :cond_7
    :goto_0
    return-object v2
.end method
