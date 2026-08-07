.class public Ll/iwd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/jwd0;

.field private b:Lcom/google/gson/Gson;

.field private c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/jwd0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/iwd0;->c:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/iwd0;->a:Ll/jwd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/iwd0;->d()Lcom/google/gson/Gson;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/iwd0;->b:Lcom/google/gson/Gson;

    .line 18
    .line 19
    return-void
.end method

.method private a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;",
            "Ljava/util/List<",
            "Ll/g5m;",
            ">;)",
            "Lcom/google/gson/TypeAdapter;"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method private b(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;Ljava/util/List;)Lcom/google/gson/TypeAdapterFactory;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;",
            "Ljava/util/List<",
            "Ll/g5m;",
            ">;)",
            "Lcom/google/gson/TypeAdapterFactory;"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method private c(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g5m;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iwd0;->a:Ll/jwd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/g5m;

    .line 20
    .line 21
    iget-object v1, p0, Ll/iwd0;->a:Ll/jwd0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/jwd0;->a()Ll/h5m;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Ll/g5m;->a(Ll/h5m;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public d()Lcom/google/gson/Gson;
    .locals 8

    .line 1
    new-instance v0, Lcom/google/gson/GsonBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Lcom/google/gson/internal/ConstructorConstructor;

    .line 13
    .line 14
    invoke-direct {v3, v1}, Lcom/google/gson/internal/ConstructorConstructor;-><init>(Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v4, Lcom/immomo/molive/foundation/util/safegson/adapter/StringTypeAdapter;

    .line 23
    .line 24
    invoke-direct {v4}, Lcom/immomo/molive/foundation/util/safegson/adapter/StringTypeAdapter;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v4, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const-class v5, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v5, v4}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v0, v4}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/BooleanTypeAdapter;

    .line 42
    .line 43
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/BooleanTypeAdapter;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 51
    .line 52
    const-class v7, Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-static {v6, v7, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/IntegerTypeAdapter;

    .line 63
    .line 64
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/IntegerTypeAdapter;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 72
    .line 73
    const-class v7, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-static {v6, v7, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/LongTypeAdapter;

    .line 84
    .line 85
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/LongTypeAdapter;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 93
    .line 94
    const-class v7, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-static {v6, v7, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/FloatTypeAdapter;

    .line 105
    .line 106
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/FloatTypeAdapter;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 114
    .line 115
    const-class v7, Ljava/lang/Float;

    .line 116
    .line 117
    invoke-static {v6, v7, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/DoubleTypeAdapter;

    .line 126
    .line 127
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/DoubleTypeAdapter;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 135
    .line 136
    const-class v7, Ljava/lang/Double;

    .line 137
    .line 138
    invoke-static {v6, v7, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/adapter/BigDecimalTypeAdapter;

    .line 147
    .line 148
    invoke-direct {v5}, Lcom/immomo/molive/foundation/util/safegson/adapter/BigDecimalTypeAdapter;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-direct {p0, v5, v1}, Ll/iwd0;->a(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorHandleTypeAdapter;Ljava/util/List;)Lcom/google/gson/TypeAdapter;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    const-class v6, Ljava/math/BigDecimal;

    .line 156
    .line 157
    invoke-static {v6, v5}, Lcom/google/gson/internal/bind/TypeAdapters;->newFactory(Ljava/lang/Class;Lcom/google/gson/TypeAdapter;)Lcom/google/gson/TypeAdapterFactory;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    sget-object v5, Lcom/immomo/molive/foundation/util/safegson/factory/SafeArrayTypeAdapter;->f:Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;

    .line 166
    .line 167
    invoke-direct {p0, v5, v1}, Ll/iwd0;->b(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;Ljava/util/List;)Lcom/google/gson/TypeAdapterFactory;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/factory/SafeCollectionTypeAdapterFactory;

    .line 176
    .line 177
    invoke-direct {v5, v3}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeCollectionTypeAdapterFactory;-><init>(Lcom/google/gson/internal/ConstructorConstructor;)V

    .line 178
    .line 179
    .line 180
    invoke-direct {p0, v5, v1}, Ll/iwd0;->b(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;Ljava/util/List;)Lcom/google/gson/TypeAdapterFactory;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-virtual {v4, v5}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    new-instance v5, Lcom/immomo/molive/foundation/util/safegson/factory/SafeMapTypeAdapterFactory;

    .line 189
    .line 190
    invoke-direct {v5, v3, v2}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeMapTypeAdapterFactory;-><init>(Lcom/google/gson/internal/ConstructorConstructor;Z)V

    .line 191
    .line 192
    .line 193
    invoke-direct {p0, v5, v1}, Ll/iwd0;->b(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;Ljava/util/List;)Lcom/google/gson/TypeAdapterFactory;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v4, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    new-instance v4, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;

    .line 202
    .line 203
    sget-object v5, Lcom/google/gson/FieldNamingPolicy;->IDENTITY:Lcom/google/gson/FieldNamingPolicy;

    .line 204
    .line 205
    sget-object v6, Lcom/google/gson/internal/Excluder;->DEFAULT:Lcom/google/gson/internal/Excluder;

    .line 206
    .line 207
    invoke-direct {v4, v3, v5, v6}, Lcom/immomo/molive/foundation/util/safegson/factory/SafeReflectiveTypeAdapterFactory;-><init>(Lcom/google/gson/internal/ConstructorConstructor;Lcom/google/gson/FieldNamingStrategy;Lcom/google/gson/internal/Excluder;)V

    .line 208
    .line 209
    .line 210
    invoke-direct {p0, v4, v1}, Ll/iwd0;->b(Lcom/immomo/molive/foundation/util/safegson/handler/SafeErrorTypeAdapterFactory;Ljava/util/List;)Lcom/google/gson/TypeAdapterFactory;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {v2, v3}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    .line 215
    .line 216
    .line 217
    const-string v2, "MMM d, yyyy HH:mm:ss"

    .line 218
    .line 219
    invoke-virtual {v0, v2}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->serializeNulls()Lcom/google/gson/GsonBuilder;

    .line 223
    .line 224
    .line 225
    invoke-direct {p0, v1}, Ll/iwd0;->c(Ljava/util/List;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    return-object p0
.end method

.method public e(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const-class v0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_1
    iget-object p0, p0, Ll/iwd0;->b:Lcom/google/gson/Gson;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public f(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iwd0;->b:Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
