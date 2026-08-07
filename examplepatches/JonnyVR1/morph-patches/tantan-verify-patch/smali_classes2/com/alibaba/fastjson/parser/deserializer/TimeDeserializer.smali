.class public Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, 0x0

    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    if-ne p2, v0, :cond_3

    .line 11
    .line 12
    const/4 p1, 0x4

    .line 13
    invoke-interface {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const-string v1, "syntax error"

    .line 21
    .line 22
    if-ne p2, p1, :cond_2

    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    invoke-interface {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-ne p2, p1, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    const/16 v2, 0xd

    .line 39
    .line 40
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-ne v3, v2, :cond_0

    .line 48
    .line 49
    invoke-interface {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ljava/sql/Time;

    .line 53
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/sql/Time;-><init>(J)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_0
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-object p3

    .line 62
    :cond_1
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-object p3

    .line 66
    :cond_2
    invoke-static {v1}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-object p3

    .line 70
    :cond_3
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-nez p0, :cond_4

    .line 75
    .line 76
    return-object p3

    .line 77
    :cond_4
    instance-of p1, p0, Ljava/sql/Time;

    .line 78
    .line 79
    if-eqz p1, :cond_5

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_5
    instance-of p1, p0, Ljava/math/BigDecimal;

    .line 83
    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    new-instance p1, Ljava/sql/Time;

    .line 87
    .line 88
    check-cast p0, Ljava/math/BigDecimal;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->longValue(Ljava/math/BigDecimal;)J

    .line 91
    .line 92
    .line 93
    move-result-wide p2

    .line 94
    invoke-direct {p1, p2, p3}, Ljava/sql/Time;-><init>(J)V

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    :cond_6
    instance-of p1, p0, Ljava/lang/Number;

    .line 99
    .line 100
    if-eqz p1, :cond_7

    .line 101
    .line 102
    new-instance p1, Ljava/sql/Time;

    .line 103
    .line 104
    check-cast p0, Ljava/lang/Number;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    .line 107
    .line 108
    .line 109
    move-result-wide p2

    .line 110
    invoke-direct {p1, p2, p3}, Ljava/sql/Time;-><init>(J)V

    .line 111
    .line 112
    .line 113
    return-object p1

    .line 114
    :cond_7
    instance-of p1, p0, Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p1, :cond_d

    .line 117
    .line 118
    check-cast p0, Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_8

    .line 125
    .line 126
    return-object p3

    .line 127
    :cond_8
    new-instance p1, Lcom/alibaba/fastjson/parser/JSONScanner;

    .line 128
    .line 129
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    if-eqz p2, :cond_9

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCalendar()Ljava/util/Calendar;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 143
    .line 144
    .line 145
    move-result-wide p2

    .line 146
    goto :goto_2

    .line 147
    :cond_9
    const/4 p2, 0x0

    .line 148
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    if-ge p2, p3, :cond_c

    .line 153
    .line 154
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    .line 155
    .line 156
    .line 157
    move-result p3

    .line 158
    const/16 v0, 0x30

    .line 159
    .line 160
    if-lt p3, v0, :cond_b

    .line 161
    .line 162
    const/16 v0, 0x39

    .line 163
    .line 164
    if-le p3, v0, :cond_a

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_a
    add-int/lit8 p2, p2, 0x1

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_b
    :goto_1
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 171
    .line 172
    .line 173
    invoke-static {p0}, Ljava/sql/Time;->valueOf(Ljava/lang/String;)Ljava/sql/Time;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :cond_c
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 179
    .line 180
    .line 181
    move-result-wide p2

    .line 182
    :goto_2
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 183
    .line 184
    .line 185
    new-instance p0, Ljava/sql/Time;

    .line 186
    .line 187
    invoke-direct {p0, p2, p3}, Ljava/sql/Time;-><init>(J)V

    .line 188
    .line 189
    .line 190
    return-object p0

    .line 191
    :cond_d
    const-string p0, "parse error"

    .line 192
    .line 193
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-object p3
.end method

.method public getFastMatchToken()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method
