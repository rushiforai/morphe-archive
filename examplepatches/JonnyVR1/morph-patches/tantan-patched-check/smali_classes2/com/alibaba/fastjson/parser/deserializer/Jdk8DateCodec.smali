.class public Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;
.super Lcom/alibaba/fastjson/parser/deserializer/ContextObjectDeserializer;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/serializer/ContextObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field private static final ISO_FIXED_FORMAT:Ljava/time/format/DateTimeFormatter;

.field private static final defaultFormatter:Ljava/time/format/DateTimeFormatter;

.field private static final defaultFormatter_23:Ljava/time/format/DateTimeFormatter;

.field private static final defaultPatttern:Ljava/lang/String; = "yyyy-MM-dd HH:mm:ss"

.field private static final formatter_d10_cn:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_de:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_eur:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_in:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_kr:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_tw:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d10_us:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_d8:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_cn:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_cn_1:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_de:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_in:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_kr:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_tw:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_iso8601:Ljava/time/format/DateTimeFormatter;

.field private static final formatter_iso8601_pattern:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss"

.field private static final formatter_iso8601_pattern_23:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSS"

.field private static final formatter_iso8601_pattern_29:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSSSSS"

.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    .line 7
    .line 8
    const-string v0, "yyyy-MM-dd HH:mm:ss"

    .line 9
    .line 10
    invoke-static {v0}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter:Ljava/time/format/DateTimeFormatter;

    .line 15
    .line 16
    const-string v1, "yyyy-MM-dd HH:mm:ss.SSS"

    .line 17
    .line 18
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter_23:Ljava/time/format/DateTimeFormatter;

    .line 23
    .line 24
    const-string v1, "yyyy/MM/dd HH:mm:ss"

    .line 25
    .line 26
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_tw:Ljava/time/format/DateTimeFormatter;

    .line 31
    .line 32
    const-string v1, "yyyy\u5e74M\u6708d\u65e5 HH:mm:ss"

    .line 33
    .line 34
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn:Ljava/time/format/DateTimeFormatter;

    .line 39
    .line 40
    const-string v1, "yyyy\u5e74M\u6708d\u65e5 H\u65f6m\u5206s\u79d2"

    .line 41
    .line 42
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn_1:Ljava/time/format/DateTimeFormatter;

    .line 47
    .line 48
    const-string v1, "yyyy\ub144M\uc6d4d\uc77c HH:mm:ss"

    .line 49
    .line 50
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_kr:Ljava/time/format/DateTimeFormatter;

    .line 55
    .line 56
    const-string v1, "MM/dd/yyyy HH:mm:ss"

    .line 57
    .line 58
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

    .line 63
    .line 64
    const-string v1, "dd/MM/yyyy HH:mm:ss"

    .line 65
    .line 66
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

    .line 71
    .line 72
    const-string v1, "dd.MM.yyyy HH:mm:ss"

    .line 73
    .line 74
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_de:Ljava/time/format/DateTimeFormatter;

    .line 79
    .line 80
    const-string v1, "dd-MM-yyyy HH:mm:ss"

    .line 81
    .line 82
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_in:Ljava/time/format/DateTimeFormatter;

    .line 87
    .line 88
    const-string v1, "yyyyMMdd"

    .line 89
    .line 90
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d8:Ljava/time/format/DateTimeFormatter;

    .line 95
    .line 96
    const-string v1, "yyyy/MM/dd"

    .line 97
    .line 98
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_tw:Ljava/time/format/DateTimeFormatter;

    .line 103
    .line 104
    const-string v1, "yyyy\u5e74M\u6708d\u65e5"

    .line 105
    .line 106
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_cn:Ljava/time/format/DateTimeFormatter;

    .line 111
    .line 112
    const-string v1, "yyyy\ub144M\uc6d4d\uc77c"

    .line 113
    .line 114
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_kr:Ljava/time/format/DateTimeFormatter;

    .line 119
    .line 120
    const-string v1, "MM/dd/yyyy"

    .line 121
    .line 122
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_us:Ljava/time/format/DateTimeFormatter;

    .line 127
    .line 128
    const-string v1, "dd/MM/yyyy"

    .line 129
    .line 130
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_eur:Ljava/time/format/DateTimeFormatter;

    .line 135
    .line 136
    const-string v1, "dd.MM.yyyy"

    .line 137
    .line 138
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_de:Ljava/time/format/DateTimeFormatter;

    .line 143
    .line 144
    const-string v1, "dd-MM-yyyy"

    .line 145
    .line 146
    invoke-static {v1}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    sput-object v1, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_in:Ljava/time/format/DateTimeFormatter;

    .line 151
    .line 152
    invoke-static {v0}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {}, Ll/wnq;->a()Ljava/time/ZoneId;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-static {v0, v1}, Ll/hoq;->a(Ljava/time/format/DateTimeFormatter;Ljava/time/ZoneId;)Ljava/time/format/DateTimeFormatter;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->ISO_FIXED_FORMAT:Ljava/time/format/DateTimeFormatter;

    .line 165
    .line 166
    const-string v0, "yyyy-MM-dd\'T\'HH:mm:ss"

    .line 167
    .line 168
    invoke-static {v0}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_iso8601:Ljava/time/format/DateTimeFormatter;

    .line 173
    .line 174
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/deserializer/ContextObjectDeserializer;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private write(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/time/temporal/TemporalAccessor;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p0, "unixtime"

    .line 2
    .line 3
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Ll/smq;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {p2}, Ll/ymq;->a(Ljava/lang/Object;)Ljava/time/chrono/ChronoZonedDateTime;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/zmq;->a(Ljava/time/chrono/ChronoZonedDateTime;)J

    .line 20
    .line 21
    .line 22
    move-result-wide p2

    .line 23
    long-to-int p0, p2

    .line 24
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {p2}, Ll/tmq;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-static {p2}, Ll/toq;->a(Ljava/lang/Object;)Ljava/time/LocalDateTime;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p2, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 39
    .line 40
    invoke-static {p2}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p0, p2}, Ll/vmq;->a(Ljava/time/LocalDateTime;Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toEpochSecond()J

    .line 49
    .line 50
    .line 51
    move-result-wide p2

    .line 52
    long-to-int p0, p2

    .line 53
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    const-string p0, "millis"

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_4

    .line 64
    .line 65
    invoke-static {p2}, Ll/smq;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    invoke-static {p2}, Ll/ymq;->a(Ljava/lang/Object;)Ljava/time/chrono/ChronoZonedDateTime;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/bnq;->a(Ljava/time/chrono/ChronoZonedDateTime;)Ljava/time/Instant;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-static {p2}, Ll/tmq;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    invoke-static {p2}, Ll/toq;->a(Ljava/lang/Object;)Ljava/time/LocalDateTime;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget-object v0, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 91
    .line 92
    invoke-static {v0}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {p0, v0}, Ll/vmq;->a(Ljava/time/LocalDateTime;Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ljava/time/ZonedDateTime;->toInstant()Ljava/time/Instant;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    goto :goto_0

    .line 105
    :cond_3
    const/4 p0, 0x0

    .line 106
    :goto_0
    if-eqz p0, :cond_4

    .line 107
    .line 108
    invoke-static {p0}, Ll/wmq;->a(Ljava/time/Instant;)J

    .line 109
    .line 110
    .line 111
    move-result-wide p2

    .line 112
    invoke-virtual {p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_4
    const-string p0, "yyyy-MM-dd\'T\'HH:mm:ss"

    .line 117
    .line 118
    if-ne p3, p0, :cond_5

    .line 119
    .line 120
    sget-object p0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_iso8601:Ljava/time/format/DateTimeFormatter;

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    invoke-static {p3}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    :goto_1
    invoke-static {p0, p2}, Ll/xmq;->a(Ljava/time/format/DateTimeFormatter;Ljava/time/temporal/TemporalAccessor;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "I)TT;"
        }
    .end annotation

    .line 1
    iget-object p3, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    const/4 v0, 0x0

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    if-ne p5, v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 17
    .line 18
    .line 19
    move-result p5

    .line 20
    const/4 v2, 0x4

    .line 21
    if-ne p5, v2, :cond_14

    .line 22
    .line 23
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p5

    .line 27
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 28
    .line 29
    .line 30
    if-eqz p4, :cond_2

    .line 31
    .line 32
    const-string p3, "yyyy-MM-dd HH:mm:ss"

    .line 33
    .line 34
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-eqz p3, :cond_1

    .line 39
    .line 40
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter:Ljava/time/format/DateTimeFormatter;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-static {p4}, Ll/lnq;->a(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move-object p3, v0

    .line 49
    :goto_0
    const-string v2, ""

    .line 50
    .line 51
    invoke-virtual {v2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_3
    invoke-static {}, Ll/soq;->a()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    if-ne p2, v2, :cond_6

    .line 63
    .line 64
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    const/16 p2, 0xa

    .line 69
    .line 70
    if-eq p1, p2, :cond_5

    .line 71
    .line 72
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-ne p1, v1, :cond_4

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    invoke-virtual {p0, p5, p3}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->parseDateTime(Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDateTime;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_5
    :goto_1
    invoke-virtual {p0, p5, p4, p3}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->parseLocalDate(Ljava/lang/String;Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDate;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/znq;->a()Ljava/time/LocalTime;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, p1}, Ll/goq;->a(Ljava/time/LocalDate;Ljava/time/LocalTime;)Ljava/time/LocalDateTime;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_6
    invoke-static {}, Ll/ioq;->a()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/16 v2, 0x17

    .line 102
    .line 103
    if-ne p2, v1, :cond_8

    .line 104
    .line 105
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-ne p1, v2, :cond_7

    .line 110
    .line 111
    invoke-static {p5}, Ll/enq;->a(Ljava/lang/CharSequence;)Ljava/time/LocalDateTime;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, Ll/loq;->a(Ljava/time/LocalDateTime;)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-static {p0}, Ll/moq;->a(Ljava/time/LocalDateTime;)I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    invoke-static {p0}, Ll/noq;->a(Ljava/time/LocalDateTime;)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-static {p1, p2, p0}, Ll/ooq;->a(III)Ljava/time/LocalDate;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_7
    invoke-virtual {p0, p5, p4, p3}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->parseLocalDate(Ljava/lang/String;Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDate;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :cond_8
    invoke-static {}, Ll/gnq;->a()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    move-result-object p4

    .line 141
    if-ne p2, p4, :cond_a

    .line 142
    .line 143
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-ne p0, v2, :cond_9

    .line 148
    .line 149
    invoke-static {p5}, Ll/enq;->a(Ljava/lang/CharSequence;)Ljava/time/LocalDateTime;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {p0}, Ll/hnq;->a(Ljava/time/LocalDateTime;)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    invoke-static {p0}, Ll/inq;->a(Ljava/time/LocalDateTime;)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    invoke-static {p0}, Ll/jnq;->a(Ljava/time/LocalDateTime;)I

    .line 162
    .line 163
    .line 164
    move-result p3

    .line 165
    invoke-static {p0}, Ll/qmq;->a(Ljava/time/LocalDateTime;)I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    invoke-static {p1, p2, p3, p0}, Ll/knq;->a(IIII)Ljava/time/LocalTime;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    :cond_9
    invoke-static {p5}, Ll/mnq;->a(Ljava/lang/CharSequence;)Ljava/time/LocalTime;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0

    .line 179
    :cond_a
    invoke-static {}, Ll/nnq;->a()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    move-result-object p4

    .line 183
    if-ne p2, p4, :cond_d

    .line 184
    .line 185
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter:Ljava/time/format/DateTimeFormatter;

    .line 186
    .line 187
    if-ne p3, p2, :cond_b

    .line 188
    .line 189
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->ISO_FIXED_FORMAT:Ljava/time/format/DateTimeFormatter;

    .line 190
    .line 191
    :cond_b
    if-nez p3, :cond_c

    .line 192
    .line 193
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    const/16 p4, 0x13

    .line 198
    .line 199
    if-gt p2, p4, :cond_c

    .line 200
    .line 201
    new-instance p2, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 202
    .line 203
    invoke-direct {p2, p5}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 207
    .line 208
    invoke-interface {p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->getTimeZone()Ljava/util/TimeZone;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p2, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->setTimeZone(Ljava/util/TimeZone;)V

    .line 213
    .line 214
    .line 215
    const/4 p4, 0x0

    .line 216
    invoke-virtual {p2, p4}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 217
    .line 218
    .line 219
    move-result p4

    .line 220
    if-eqz p4, :cond_c

    .line 221
    .line 222
    invoke-virtual {p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-static {p0}, Ll/onq;->a(Ljava/util/Date;)Ljava/time/Instant;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-static {p1}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-static {p0, p1}, Ll/pnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    return-object p0

    .line 243
    :cond_c
    invoke-virtual {p0, p5, p3}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->parseZonedDateTime(Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/ZonedDateTime;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    return-object p0

    .line 248
    :cond_d
    invoke-static {}, Ll/qnq;->a()Ljava/lang/Class;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    if-ne p2, p0, :cond_e

    .line 253
    .line 254
    invoke-static {p5}, Ll/rnq;->a(Ljava/lang/CharSequence;)Ljava/time/OffsetDateTime;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    return-object p0

    .line 259
    :cond_e
    invoke-static {}, Ll/snq;->a()Ljava/lang/Class;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    if-ne p2, p0, :cond_f

    .line 264
    .line 265
    invoke-static {p5}, Ll/tnq;->a(Ljava/lang/CharSequence;)Ljava/time/OffsetTime;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    return-object p0

    .line 270
    :cond_f
    invoke-static {}, Ll/unq;->a()Ljava/lang/Class;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    if-ne p2, p0, :cond_10

    .line 275
    .line 276
    invoke-static {p5}, Ll/vnq;->a(Ljava/lang/String;)Ljava/time/ZoneId;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    return-object p0

    .line 281
    :cond_10
    invoke-static {}, Ll/xnq;->a()Ljava/lang/Class;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    if-ne p2, p0, :cond_11

    .line 286
    .line 287
    invoke-static {p5}, Ll/ynq;->a(Ljava/lang/CharSequence;)Ljava/time/Period;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    return-object p0

    .line 292
    :cond_11
    invoke-static {}, Ll/aoq;->a()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    if-ne p2, p0, :cond_12

    .line 297
    .line 298
    invoke-static {p5}, Ll/boq;->a(Ljava/lang/CharSequence;)Ljava/time/Duration;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    return-object p0

    .line 303
    :cond_12
    invoke-static {}, Ll/coq;->a()Ljava/lang/Class;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    if-ne p2, p0, :cond_13

    .line 308
    .line 309
    invoke-static {p5}, Ll/doq;->a(Ljava/lang/CharSequence;)Ljava/time/Instant;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    return-object p0

    .line 314
    :cond_13
    return-object v0

    .line 315
    :cond_14
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    const/4 p1, 0x2

    .line 320
    if-ne p0, p1, :cond_1b

    .line 321
    .line 322
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    .line 323
    .line 324
    .line 325
    move-result-wide p0

    .line 326
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 327
    .line 328
    .line 329
    const-string p3, "unixtime"

    .line 330
    .line 331
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p3

    .line 335
    if-eqz p3, :cond_15

    .line 336
    .line 337
    const-wide/16 p3, 0x3e8

    .line 338
    .line 339
    mul-long/2addr p0, p3

    .line 340
    goto :goto_2

    .line 341
    :cond_15
    const-string p3, "yyyyMMddHHmmss"

    .line 342
    .line 343
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result p3

    .line 347
    if-eqz p3, :cond_16

    .line 348
    .line 349
    const-wide p3, 0x2540be400L

    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    div-long p3, p0, p3

    .line 355
    .line 356
    long-to-int v1, p3

    .line 357
    const-wide/32 p3, 0x5f5e100

    .line 358
    .line 359
    .line 360
    div-long p3, p0, p3

    .line 361
    .line 362
    const-wide/16 v2, 0x64

    .line 363
    .line 364
    rem-long/2addr p3, v2

    .line 365
    long-to-int p3, p3

    .line 366
    const-wide/32 p4, 0xf4240

    .line 367
    .line 368
    .line 369
    div-long p4, p0, p4

    .line 370
    .line 371
    rem-long/2addr p4, v2

    .line 372
    long-to-int p4, p4

    .line 373
    const-wide/16 v4, 0x2710

    .line 374
    .line 375
    div-long v4, p0, v4

    .line 376
    .line 377
    rem-long/2addr v4, v2

    .line 378
    long-to-int v4, v4

    .line 379
    div-long v5, p0, v2

    .line 380
    .line 381
    rem-long/2addr v5, v2

    .line 382
    long-to-int v5, v5

    .line 383
    rem-long v2, p0, v2

    .line 384
    .line 385
    long-to-int v6, v2

    .line 386
    invoke-static {}, Ll/soq;->a()Ljava/lang/Class;

    .line 387
    .line 388
    .line 389
    move-result-object p5

    .line 390
    if-ne p2, p5, :cond_16

    .line 391
    .line 392
    move v2, p3

    .line 393
    move v3, p4

    .line 394
    invoke-static/range {v1 .. v6}, Ll/eoq;->a(IIIIII)Ljava/time/LocalDateTime;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    return-object p0

    .line 399
    :cond_16
    :goto_2
    invoke-static {}, Ll/soq;->a()Ljava/lang/Class;

    .line 400
    .line 401
    .line 402
    move-result-object p3

    .line 403
    if-ne p2, p3, :cond_17

    .line 404
    .line 405
    invoke-static {p0, p1}, Ll/foq;->a(J)Ljava/time/Instant;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    sget-object p1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 410
    .line 411
    invoke-static {p1}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-static {p0, p1}, Ll/dnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    return-object p0

    .line 420
    :cond_17
    invoke-static {}, Ll/ioq;->a()Ljava/lang/Class;

    .line 421
    .line 422
    .line 423
    move-result-object p3

    .line 424
    if-ne p2, p3, :cond_18

    .line 425
    .line 426
    invoke-static {p0, p1}, Ll/foq;->a(J)Ljava/time/Instant;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    sget-object p1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 431
    .line 432
    invoke-static {p1}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 433
    .line 434
    .line 435
    move-result-object p1

    .line 436
    invoke-static {p0, p1}, Ll/dnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    invoke-static {p0}, Ll/joq;->a(Ljava/time/LocalDateTime;)Ljava/time/LocalDate;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    return-object p0

    .line 445
    :cond_18
    invoke-static {}, Ll/gnq;->a()Ljava/lang/Class;

    .line 446
    .line 447
    .line 448
    move-result-object p3

    .line 449
    if-ne p2, p3, :cond_19

    .line 450
    .line 451
    invoke-static {p0, p1}, Ll/foq;->a(J)Ljava/time/Instant;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    sget-object p1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 456
    .line 457
    invoke-static {p1}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    invoke-static {p0, p1}, Ll/dnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    invoke-static {p0}, Ll/koq;->a(Ljava/time/LocalDateTime;)Ljava/time/LocalTime;

    .line 466
    .line 467
    .line 468
    move-result-object p0

    .line 469
    return-object p0

    .line 470
    :cond_19
    invoke-static {}, Ll/nnq;->a()Ljava/lang/Class;

    .line 471
    .line 472
    .line 473
    move-result-object p3

    .line 474
    if-ne p2, p3, :cond_1a

    .line 475
    .line 476
    invoke-static {p0, p1}, Ll/foq;->a(J)Ljava/time/Instant;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    sget-object p1, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    .line 481
    .line 482
    invoke-static {p1}, Ll/umq;->a(Ljava/util/TimeZone;)Ljava/time/ZoneId;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    invoke-static {p0, p1}, Ll/pnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    .line 487
    .line 488
    .line 489
    move-result-object p0

    .line 490
    return-object p0

    .line 491
    :cond_1a
    invoke-static {}, Ll/l710;->a()V

    .line 492
    .line 493
    .line 494
    return-object v0

    .line 495
    :cond_1b
    invoke-static {}, Ll/l710;->a()V

    .line 496
    .line 497
    .line 498
    return-object v0
.end method

.method public getFastMatchToken()I
    .locals 0

    const/4 p0, 0x4

    return p0
.end method

.method public parseDateTime(Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDateTime;
    .locals 13

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_d

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/16 v2, 0x20

    .line 10
    .line 11
    const/16 v3, 0x10

    .line 12
    .line 13
    const/16 v4, 0xd

    .line 14
    .line 15
    const/4 v5, 0x7

    .line 16
    const/16 v6, 0x13

    .line 17
    .line 18
    const/16 v7, 0x2e

    .line 19
    .line 20
    const/4 v8, 0x4

    .line 21
    const/16 v9, 0x3a

    .line 22
    .line 23
    const/16 v10, 0xa

    .line 24
    .line 25
    const/16 v11, 0x2d

    .line 26
    .line 27
    if-ne v0, v6, :cond_9

    .line 28
    .line 29
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-ne v4, v9, :cond_a

    .line 50
    .line 51
    if-ne v3, v9, :cond_a

    .line 52
    .line 53
    if-ne v0, v11, :cond_1

    .line 54
    .line 55
    if-ne v5, v11, :cond_1

    .line 56
    .line 57
    const/16 v0, 0x54

    .line 58
    .line 59
    if-ne v6, v0, :cond_0

    .line 60
    .line 61
    invoke-static {}, Ll/poq;->a()Ljava/time/format/DateTimeFormatter;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_0
    if-ne v6, v2, :cond_a

    .line 68
    .line 69
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter:Ljava/time/format/DateTimeFormatter;

    .line 70
    .line 71
    goto/16 :goto_0

    .line 72
    .line 73
    :cond_1
    const/16 v2, 0x2f

    .line 74
    .line 75
    if-ne v0, v2, :cond_2

    .line 76
    .line 77
    if-ne v5, v2, :cond_2

    .line 78
    .line 79
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_tw:Ljava/time/format/DateTimeFormatter;

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :cond_2
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    const/4 v5, 0x2

    .line 92
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    const/4 v6, 0x3

    .line 97
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    const/4 v9, 0x5

    .line 102
    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    if-ne v5, v2, :cond_7

    .line 107
    .line 108
    if-ne v9, v2, :cond_7

    .line 109
    .line 110
    add-int/lit8 v3, v3, -0x30

    .line 111
    .line 112
    mul-int/2addr v3, v10

    .line 113
    add-int/lit8 v4, v4, -0x30

    .line 114
    .line 115
    add-int/2addr v3, v4

    .line 116
    add-int/lit8 v6, v6, -0x30

    .line 117
    .line 118
    mul-int/2addr v6, v10

    .line 119
    add-int/lit8 v0, v0, -0x30

    .line 120
    .line 121
    add-int/2addr v6, v0

    .line 122
    const/16 v0, 0xc

    .line 123
    .line 124
    if-le v3, v0, :cond_3

    .line 125
    .line 126
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

    .line 127
    .line 128
    goto/16 :goto_0

    .line 129
    .line 130
    :cond_3
    if-le v6, v0, :cond_4

    .line 131
    .line 132
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v2, "US"

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_5

    .line 150
    .line 151
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_5
    const-string v2, "BR"

    .line 155
    .line 156
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-nez v2, :cond_6

    .line 161
    .line 162
    const-string v2, "AU"

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_a

    .line 169
    .line 170
    :cond_6
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_7
    if-ne v5, v7, :cond_8

    .line 174
    .line 175
    if-ne v9, v7, :cond_8

    .line 176
    .line 177
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_de:Ljava/time/format/DateTimeFormatter;

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_8
    if-ne v5, v11, :cond_a

    .line 181
    .line 182
    if-ne v9, v11, :cond_a

    .line 183
    .line 184
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_in:Ljava/time/format/DateTimeFormatter;

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    const/16 v12, 0x17

    .line 192
    .line 193
    if-ne v0, v12, :cond_a

    .line 194
    .line 195
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    .line 204
    .line 205
    .line 206
    move-result v10

    .line 207
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 208
    .line 209
    .line 210
    move-result v4

    .line 211
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 216
    .line 217
    .line 218
    move-result v6

    .line 219
    if-ne v4, v9, :cond_a

    .line 220
    .line 221
    if-ne v3, v9, :cond_a

    .line 222
    .line 223
    if-ne v0, v11, :cond_a

    .line 224
    .line 225
    if-ne v5, v11, :cond_a

    .line 226
    .line 227
    if-ne v10, v2, :cond_a

    .line 228
    .line 229
    if-ne v6, v7, :cond_a

    .line 230
    .line 231
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter_23:Ljava/time/format/DateTimeFormatter;

    .line 232
    .line 233
    :cond_a
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    const/16 v2, 0x11

    .line 238
    .line 239
    if-lt v0, v2, :cond_d

    .line 240
    .line 241
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    const/16 v2, 0x5e74

    .line 246
    .line 247
    if-ne v0, v2, :cond_c

    .line 248
    .line 249
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    sub-int/2addr p2, v1

    .line 254
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 255
    .line 256
    .line 257
    move-result p2

    .line 258
    const/16 v0, 0x79d2

    .line 259
    .line 260
    if-ne p2, v0, :cond_b

    .line 261
    .line 262
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn_1:Ljava/time/format/DateTimeFormatter;

    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_b
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn:Ljava/time/format/DateTimeFormatter;

    .line 266
    .line 267
    goto :goto_1

    .line 268
    :cond_c
    const v1, 0xb144

    .line 269
    .line 270
    .line 271
    if-ne v0, v1, :cond_d

    .line 272
    .line 273
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_kr:Ljava/time/format/DateTimeFormatter;

    .line 274
    .line 275
    :cond_d
    :goto_1
    if-nez p2, :cond_e

    .line 276
    .line 277
    new-instance v0, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 278
    .line 279
    invoke-direct {v0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    if-eqz p0, :cond_e

    .line 287
    .line 288
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-static {p0}, Ll/cnq;->a(Ljava/util/Calendar;)Ljava/time/Instant;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-static {}, Ll/wnq;->a()Ljava/time/ZoneId;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-static {p0, p1}, Ll/dnq;->a(Ljava/time/Instant;Ljava/time/ZoneId;)Ljava/time/LocalDateTime;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    return-object p0

    .line 305
    :cond_e
    if-nez p2, :cond_f

    .line 306
    .line 307
    invoke-static {p1}, Ll/enq;->a(Ljava/lang/CharSequence;)Ljava/time/LocalDateTime;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    return-object p0

    .line 312
    :cond_f
    invoke-static {p1, p2}, Ll/fnq;->a(Ljava/lang/CharSequence;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDateTime;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    return-object p0
.end method

.method public parseLocalDate(Ljava/lang/String;Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDate;
    .locals 7

    .line 1
    if-nez p3, :cond_a

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 p2, 0x8

    .line 8
    .line 9
    if-ne p0, p2, :cond_0

    .line 10
    .line 11
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d8:Ljava/time/format/DateTimeFormatter;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p2, 0x4

    .line 18
    const/16 v0, 0xa

    .line 19
    .line 20
    if-ne p0, v0, :cond_8

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v1, 0x7

    .line 27
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/16 v2, 0x2f

    .line 32
    .line 33
    if-ne p0, v2, :cond_1

    .line 34
    .line 35
    if-ne v1, v2, :cond_1

    .line 36
    .line 37
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_tw:Ljava/time/format/DateTimeFormatter;

    .line 38
    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v3, 0x1

    .line 45
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x2

    .line 50
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    const/4 v5, 0x3

    .line 55
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const/4 v6, 0x5

    .line 60
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-ne v4, v2, :cond_6

    .line 65
    .line 66
    if-ne v6, v2, :cond_6

    .line 67
    .line 68
    add-int/lit8 v1, v1, -0x30

    .line 69
    .line 70
    mul-int/2addr v1, v0

    .line 71
    add-int/lit8 v3, v3, -0x30

    .line 72
    .line 73
    add-int/2addr v1, v3

    .line 74
    add-int/lit8 v5, v5, -0x30

    .line 75
    .line 76
    mul-int/2addr v5, v0

    .line 77
    add-int/lit8 p0, p0, -0x30

    .line 78
    .line 79
    add-int/2addr v5, p0

    .line 80
    const/16 p0, 0xc

    .line 81
    .line 82
    if-le v1, p0, :cond_2

    .line 83
    .line 84
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_eur:Ljava/time/format/DateTimeFormatter;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    if-le v5, p0, :cond_3

    .line 88
    .line 89
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_us:Ljava/time/format/DateTimeFormatter;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "US"

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_us:Ljava/time/format/DateTimeFormatter;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    const-string v0, "BR"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_5

    .line 118
    .line 119
    const-string v0, "AU"

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    :cond_5
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_eur:Ljava/time/format/DateTimeFormatter;

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_6
    const/16 p0, 0x2e

    .line 131
    .line 132
    if-ne v4, p0, :cond_7

    .line 133
    .line 134
    if-ne v6, p0, :cond_7

    .line 135
    .line 136
    sget-object p0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_de:Ljava/time/format/DateTimeFormatter;

    .line 137
    .line 138
    :goto_0
    move-object p3, p0

    .line 139
    goto :goto_1

    .line 140
    :cond_7
    const/16 p0, 0x2d

    .line 141
    .line 142
    if-ne v4, p0, :cond_8

    .line 143
    .line 144
    if-ne v6, p0, :cond_8

    .line 145
    .line 146
    sget-object p0, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_in:Ljava/time/format/DateTimeFormatter;

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_8
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    const/16 v0, 0x9

    .line 154
    .line 155
    if-lt p0, v0, :cond_a

    .line 156
    .line 157
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    const/16 p2, 0x5e74

    .line 162
    .line 163
    if-ne p0, p2, :cond_9

    .line 164
    .line 165
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_cn:Ljava/time/format/DateTimeFormatter;

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_9
    const p2, 0xb144

    .line 169
    .line 170
    .line 171
    if-ne p0, p2, :cond_a

    .line 172
    .line 173
    sget-object p3, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_d10_kr:Ljava/time/format/DateTimeFormatter;

    .line 174
    .line 175
    :cond_a
    :goto_2
    if-nez p3, :cond_b

    .line 176
    .line 177
    invoke-static {p1}, Ll/pmq;->a(Ljava/lang/CharSequence;)Ljava/time/LocalDate;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    return-object p0

    .line 182
    :cond_b
    invoke-static {p1, p3}, Ll/anq;->a(Ljava/lang/CharSequence;Ljava/time/format/DateTimeFormatter;)Ljava/time/LocalDate;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0
.end method

.method public parseZonedDateTime(Ljava/lang/String;Ljava/time/format/DateTimeFormatter;)Ljava/time/ZonedDateTime;
    .locals 10

    .line 1
    if-nez p2, :cond_c

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x13

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x4

    .line 11
    if-ne p0, v0, :cond_9

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x7

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v3, 0xa

    .line 23
    .line 24
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/16 v5, 0xd

    .line 29
    .line 30
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/16 v6, 0x10

    .line 35
    .line 36
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const/16 v7, 0x3a

    .line 41
    .line 42
    if-ne v5, v7, :cond_9

    .line 43
    .line 44
    if-ne v6, v7, :cond_9

    .line 45
    .line 46
    const/16 v5, 0x2d

    .line 47
    .line 48
    if-ne p0, v5, :cond_1

    .line 49
    .line 50
    if-ne v0, v5, :cond_1

    .line 51
    .line 52
    const/16 p0, 0x54

    .line 53
    .line 54
    if-ne v4, p0, :cond_0

    .line 55
    .line 56
    invoke-static {}, Ll/poq;->a()Ljava/time/format/DateTimeFormatter;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_0
    const/16 p0, 0x20

    .line 63
    .line 64
    if-ne v4, p0, :cond_9

    .line 65
    .line 66
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->defaultFormatter:Ljava/time/format/DateTimeFormatter;

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :cond_1
    const/16 v4, 0x2f

    .line 71
    .line 72
    if-ne p0, v4, :cond_2

    .line 73
    .line 74
    if-ne v0, v4, :cond_2

    .line 75
    .line 76
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_tw:Ljava/time/format/DateTimeFormatter;

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_2
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    const/4 v7, 0x2

    .line 90
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    const/4 v8, 0x3

    .line 95
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    const/4 v9, 0x5

    .line 100
    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    if-ne v7, v4, :cond_7

    .line 105
    .line 106
    if-ne v9, v4, :cond_7

    .line 107
    .line 108
    add-int/lit8 v0, v0, -0x30

    .line 109
    .line 110
    mul-int/2addr v0, v3

    .line 111
    add-int/lit8 v6, v6, -0x30

    .line 112
    .line 113
    add-int/2addr v0, v6

    .line 114
    add-int/lit8 v8, v8, -0x30

    .line 115
    .line 116
    mul-int/2addr v8, v3

    .line 117
    add-int/lit8 p0, p0, -0x30

    .line 118
    .line 119
    add-int/2addr v8, p0

    .line 120
    const/16 p0, 0xc

    .line 121
    .line 122
    if-le v0, p0, :cond_3

    .line 123
    .line 124
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    if-le v8, p0, :cond_4

    .line 128
    .line 129
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string v0, "US"

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_5

    .line 147
    .line 148
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_us:Ljava/time/format/DateTimeFormatter;

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_5
    const-string v0, "BR"

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_6

    .line 158
    .line 159
    const-string v0, "AU"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_9

    .line 166
    .line 167
    :cond_6
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_eur:Ljava/time/format/DateTimeFormatter;

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_7
    const/16 p0, 0x2e

    .line 171
    .line 172
    if-ne v7, p0, :cond_8

    .line 173
    .line 174
    if-ne v9, p0, :cond_8

    .line 175
    .line 176
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_de:Ljava/time/format/DateTimeFormatter;

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_8
    if-ne v7, v5, :cond_9

    .line 180
    .line 181
    if-ne v9, v5, :cond_9

    .line 182
    .line 183
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_in:Ljava/time/format/DateTimeFormatter;

    .line 184
    .line 185
    :cond_9
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    const/16 v0, 0x11

    .line 190
    .line 191
    if-lt p0, v0, :cond_c

    .line 192
    .line 193
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    const/16 v0, 0x5e74

    .line 198
    .line 199
    if-ne p0, v0, :cond_b

    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    sub-int/2addr p0, v1

    .line 206
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    const/16 p2, 0x79d2

    .line 211
    .line 212
    if-ne p0, p2, :cond_a

    .line 213
    .line 214
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn_1:Ljava/time/format/DateTimeFormatter;

    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_a
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_cn:Ljava/time/format/DateTimeFormatter;

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_b
    const v0, 0xb144

    .line 221
    .line 222
    .line 223
    if-ne p0, v0, :cond_c

    .line 224
    .line 225
    sget-object p2, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->formatter_dt19_kr:Ljava/time/format/DateTimeFormatter;

    .line 226
    .line 227
    :cond_c
    :goto_1
    if-nez p2, :cond_d

    .line 228
    .line 229
    invoke-static {p1}, Ll/qoq;->a(Ljava/lang/CharSequence;)Ljava/time/ZonedDateTime;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    return-object p0

    .line 234
    :cond_d
    invoke-static {p1, p2}, Ll/roq;->a(Ljava/lang/CharSequence;Ljava/time/format/DateTimeFormatter;)Ljava/time/ZonedDateTime;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    return-object p0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/BeanContext;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget-object p1, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 136
    invoke-virtual {p3}, Lcom/alibaba/fastjson/serializer/BeanContext;->getFormat()Ljava/lang/String;

    move-result-object p3

    .line 137
    invoke-static {p2}, Ll/rmq;->a(Ljava/lang/Object;)Ljava/time/temporal/TemporalAccessor;

    move-result-object p2

    invoke-direct {p0, p1, p2, p3}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->write(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/time/temporal/TemporalAccessor;Ljava/lang/String;)V

    return-void
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    iget-object p3, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    if-nez p2, :cond_0

    .line 139
    invoke-virtual {p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    return-void

    :cond_0
    if-nez p4, :cond_1

    .line 140
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p4

    .line 141
    :cond_1
    invoke-static {}, Ll/soq;->a()Ljava/lang/Class;

    move-result-object v0

    if-ne p4, v0, :cond_6

    .line 142
    sget-object p4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseISO8601DateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p4}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v0

    .line 143
    invoke-static {p2}, Ll/toq;->a(Ljava/lang/Object;)Ljava/time/LocalDateTime;

    move-result-object p2

    .line 144
    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormatPattern()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    and-int/2addr p5, v0

    .line 145
    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss"

    if-nez p5, :cond_5

    invoke-virtual {p1, p4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    .line 146
    :cond_2
    invoke-static {p2}, Ll/qmq;->a(Ljava/time/LocalDateTime;)I

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const p4, 0xf4240

    .line 147
    rem-int/2addr p1, p4

    if-nez p1, :cond_4

    .line 148
    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS"

    goto :goto_0

    .line 149
    :cond_4
    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSSSSS"

    .line 150
    :cond_5
    :goto_0
    invoke-direct {p0, p3, p2, v1}, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->write(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/time/temporal/TemporalAccessor;Ljava/lang/String;)V

    return-void

    .line 151
    :cond_6
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    return-void
.end method
