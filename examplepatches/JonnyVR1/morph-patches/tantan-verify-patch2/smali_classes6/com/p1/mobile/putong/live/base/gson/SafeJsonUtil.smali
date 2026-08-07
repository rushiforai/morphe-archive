.class public Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static instance:Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;


# instance fields
.field private gson:Lcom/google/gson/Gson;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->instance:Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/gson/GsonBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/BooleanSerializer;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/BooleanSerializer;-><init>()V

    .line 12
    .line 13
    .line 14
    const-class v2, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/BooleanSerializer;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/BooleanSerializer;-><init>()V

    .line 22
    .line 23
    .line 24
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 27
    .line 28
    .line 29
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/DoubleSerializer;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/DoubleSerializer;-><init>()V

    .line 32
    .line 33
    .line 34
    const-class v2, Ljava/lang/Double;

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 37
    .line 38
    .line 39
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/DoubleSerializer;

    .line 40
    .line 41
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/DoubleSerializer;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 47
    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/FloatSerializer;

    .line 50
    .line 51
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/FloatSerializer;-><init>()V

    .line 52
    .line 53
    .line 54
    const-class v2, Ljava/lang/Float;

    .line 55
    .line 56
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 57
    .line 58
    .line 59
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/FloatSerializer;

    .line 60
    .line 61
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/FloatSerializer;-><init>()V

    .line 62
    .line 63
    .line 64
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 65
    .line 66
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 67
    .line 68
    .line 69
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/IntSerializer;

    .line 70
    .line 71
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/IntSerializer;-><init>()V

    .line 72
    .line 73
    .line 74
    const-class v2, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 77
    .line 78
    .line 79
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/IntSerializer;

    .line 80
    .line 81
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/IntSerializer;-><init>()V

    .line 82
    .line 83
    .line 84
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 85
    .line 86
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 87
    .line 88
    .line 89
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/LongSerializer;

    .line 90
    .line 91
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/LongSerializer;-><init>()V

    .line 92
    .line 93
    .line 94
    const-class v2, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 97
    .line 98
    .line 99
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/LongSerializer;

    .line 100
    .line 101
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/LongSerializer;-><init>()V

    .line 102
    .line 103
    .line 104
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 105
    .line 106
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 107
    .line 108
    .line 109
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/ShortSerializer;

    .line 110
    .line 111
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/ShortSerializer;-><init>()V

    .line 112
    .line 113
    .line 114
    const-class v2, Ljava/lang/Short;

    .line 115
    .line 116
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 117
    .line 118
    .line 119
    new-instance v1, Lcom/p1/mobile/putong/live/base/gson/ShortSerializer;

    .line 120
    .line 121
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/gson/ShortSerializer;-><init>()V

    .line 122
    .line 123
    .line 124
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 125
    .line 126
    invoke-virtual {v0, v2, v1}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->serializeNulls()Lcom/google/gson/GsonBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

    .line 137
    .line 138
    return-void
.end method

.method public static buildInGson()Lcom/google/gson/Gson;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

    .line 6
    .line 7
    return-object v0
.end method

.method public static getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->instance:Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/JsonElement;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/gson/JsonSyntaxException;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

    invoke-virtual {p0, p1, p2}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public fromJson(Lcom/google/gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/JsonElement;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/gson/JsonSyntaxException;
        }
    .end annotation

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

    invoke-virtual {p0, p1, p2}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/JsonElement;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
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
            Lcom/google/gson/JsonSyntaxException;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

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

.method public fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/gson/JsonSyntaxException;
        }
    .end annotation

    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 27
    :cond_0
    const-class v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    .line 28
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

    invoke-virtual {p0, p1, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toJson(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->gson:Lcom/google/gson/Gson;

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
