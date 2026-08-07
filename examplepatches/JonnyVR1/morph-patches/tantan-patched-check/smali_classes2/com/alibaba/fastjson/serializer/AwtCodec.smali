.class public Lcom/alibaba/fastjson/serializer/AwtCodec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/AwtCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/AwtCodec;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/AwtCodec;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

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

.method private parseRef(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getLexer()Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-interface {p0, v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1, v1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 18
    .line 19
    .line 20
    new-instance p2, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {p2, v1, v0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;-><init>(Lcom/alibaba/fastjson/parser/ParseContext;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->addResolveTask(Lcom/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->popContext()V

    .line 33
    .line 34
    .line 35
    const/4 p2, 0x1

    .line 36
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setResolveStatus(I)V

    .line 37
    .line 38
    .line 39
    const/16 p2, 0xd

    .line 40
    .line 41
    invoke-interface {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0
.end method

.method public static support(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    const-class v0, Ljava/awt/Point;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ljava/awt/Rectangle;

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const-class v0, Ljava/awt/Font;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const-class v0, Ljava/awt/Color;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
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
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/16 v4, 0x10

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 15
    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/16 v2, 0xc

    .line 23
    .line 24
    if-eq v1, v2, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ne v1, v4, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string p0, "syntax error"

    .line 34
    .line 35
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v3

    .line 39
    :cond_2
    :goto_0
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 40
    .line 41
    .line 42
    const-class v0, Ljava/awt/Point;

    .line 43
    .line 44
    if-ne p2, v0, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0, p1, p3}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parsePoint(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;)Ljava/awt/Point;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    goto :goto_1

    .line 51
    :cond_3
    const-class v0, Ljava/awt/Rectangle;

    .line 52
    .line 53
    if-ne p2, v0, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseRectangle(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Rectangle;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    goto :goto_1

    .line 60
    :cond_4
    const-class v0, Ljava/awt/Color;

    .line 61
    .line 62
    if-ne p2, v0, :cond_5

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseColor(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Color;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_1

    .line 69
    :cond_5
    const-class v0, Ljava/awt/Font;

    .line 70
    .line 71
    if-ne p2, v0, :cond_6

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseFont(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Font;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :goto_1
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getContext()Lcom/alibaba/fastjson/parser/ParseContext;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p0, p3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Ljava/lang/Object;Ljava/lang/Object;)Lcom/alibaba/fastjson/parser/ParseContext;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->setContext(Lcom/alibaba/fastjson/parser/ParseContext;)V

    .line 85
    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_6
    const-string p0, "not support awt class : "

    .line 89
    .line 90
    invoke-static {p0, p2}, Ll/rkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-object v3
.end method

.method public getFastMatchToken()I
    .locals 0

    const/16 p0, 0xc

    return p0
.end method

.method public parseColor(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Color;
    .locals 9

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    move v0, p1

    .line 5
    move v1, v0

    .line 6
    move v2, v1

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/16 v4, 0xd

    .line 12
    .line 13
    if-ne v3, v4, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/awt/Color;

    .line 19
    .line 20
    invoke-direct {p0, p1, v0, v1, v2}, Ljava/awt/Color;-><init>(IIII)V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    const-string v5, "syntax error"

    .line 30
    .line 31
    const/4 v6, 0x4

    .line 32
    if-ne v3, v6, :cond_7

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v7, 0x2

    .line 39
    invoke-interface {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    if-ne v8, v7, :cond_6

    .line 47
    .line 48
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 53
    .line 54
    .line 55
    const-string v7, "r"

    .line 56
    .line 57
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    if-eqz v7, :cond_2

    .line 62
    .line 63
    move p1, v5

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const-string v7, "g"

    .line 66
    .line 67
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    if-eqz v7, :cond_3

    .line 72
    .line 73
    move v0, v5

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    const-string v7, "b"

    .line 76
    .line 77
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-eqz v7, :cond_4

    .line 82
    .line 83
    move v1, v5

    .line 84
    goto :goto_1

    .line 85
    :cond_4
    const-string v2, "alpha"

    .line 86
    .line 87
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_5

    .line 92
    .line 93
    move v2, v5

    .line 94
    :goto_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    const/16 v4, 0x10

    .line 99
    .line 100
    if-ne v3, v4, :cond_0

    .line 101
    .line 102
    invoke-interface {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    const-string p0, "syntax error, "

    .line 107
    .line 108
    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-object v4

    .line 116
    :cond_6
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-object v4

    .line 120
    :cond_7
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-object v4
.end method

.method public parseFont(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Font;
    .locals 8

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, p1

    .line 6
    move-object v2, v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/16 v4, 0xd

    .line 12
    .line 13
    if-ne v3, v4, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/awt/Font;

    .line 19
    .line 20
    invoke-direct {p0, v2, p1, v1}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x4

    .line 29
    const-string v5, "syntax error"

    .line 30
    .line 31
    if-ne v3, v4, :cond_8

    .line 32
    .line 33
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v6, 0x2

    .line 38
    invoke-interface {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 39
    .line 40
    .line 41
    const-string v7, "name"

    .line 42
    .line 43
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_3

    .line 48
    .line 49
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-ne v2, v4, :cond_2

    .line 54
    .line 55
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_3
    const-string v7, "style"

    .line 68
    .line 69
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_5

    .line 74
    .line 75
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-ne p1, v6, :cond_4

    .line 80
    .line 81
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :cond_5
    const-string v1, "size"

    .line 94
    .line 95
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-ne v1, v6, :cond_6

    .line 106
    .line 107
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 112
    .line 113
    .line 114
    :goto_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const/16 v5, 0x10

    .line 119
    .line 120
    if-ne v3, v5, :cond_0

    .line 121
    .line 122
    invoke-interface {p0, v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_6
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-object v0

    .line 130
    :cond_7
    const-string p0, "syntax error, "

    .line 131
    .line 132
    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-object v0

    .line 140
    :cond_8
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-object v0
.end method

.method public parsePoint(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;)Ljava/awt/Point;
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/16 v4, 0xd

    .line 10
    .line 11
    if-ne v3, v4, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/awt/Point;

    .line 17
    .line 18
    invoke-direct {p0, v1, v2}, Ljava/awt/Point;-><init>(II)V

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v5, 0x4

    .line 28
    if-ne v3, v5, :cond_8

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget-object v6, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_2

    .line 41
    .line 42
    const-string v3, "java.awt.Point"

    .line 43
    .line 44
    invoke-virtual {p1, v3}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->acceptType(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const-string v6, "$ref"

    .line 49
    .line 50
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_3

    .line 55
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseRef(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/awt/Point;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    const/4 v6, 0x2

    .line 64
    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    if-ne v7, v6, :cond_4

    .line 72
    .line 73
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    const/4 v6, 0x3

    .line 82
    if-ne v7, v6, :cond_7

    .line 83
    .line 84
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->floatValue()F

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    float-to-int v6, v6

    .line 89
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 90
    .line 91
    .line 92
    :goto_1
    const-string v7, "x"

    .line 93
    .line 94
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_5

    .line 99
    .line 100
    move v1, v6

    .line 101
    goto :goto_2

    .line 102
    :cond_5
    const-string v2, "y"

    .line 103
    .line 104
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_6

    .line 109
    .line 110
    move v2, v6

    .line 111
    :goto_2
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    const/16 v4, 0x10

    .line 116
    .line 117
    if-ne v3, v4, :cond_0

    .line 118
    .line 119
    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_6
    const-string p0, "syntax error, "

    .line 124
    .line 125
    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-object v4

    .line 133
    :cond_7
    const-string p0, "syntax error : "

    .line 134
    .line 135
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {p0, p1}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-object v4

    .line 143
    :cond_8
    const-string p0, "syntax error"

    .line 144
    .line 145
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v4
.end method

.method public parseRectangle(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Rectangle;
    .locals 9

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    move v0, p1

    .line 5
    move v1, v0

    .line 6
    move v2, v1

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/16 v4, 0xd

    .line 12
    .line 13
    if-ne v3, v4, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/awt/Rectangle;

    .line 19
    .line 20
    invoke-direct {p0, p1, v0, v1, v2}, Ljava/awt/Rectangle;-><init>(IIII)V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    const-string v5, "syntax error"

    .line 30
    .line 31
    const/4 v6, 0x4

    .line 32
    if-ne v3, v6, :cond_8

    .line 33
    .line 34
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v7, 0x2

    .line 39
    invoke-interface {p0, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    if-ne v8, v7, :cond_2

    .line 47
    .line 48
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const/4 v7, 0x3

    .line 57
    if-ne v8, v7, :cond_7

    .line 58
    .line 59
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->floatValue()F

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    float-to-int v5, v5

    .line 64
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 65
    .line 66
    .line 67
    :goto_1
    const-string v7, "x"

    .line 68
    .line 69
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_3

    .line 74
    .line 75
    move p1, v5

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    const-string v7, "y"

    .line 78
    .line 79
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-eqz v7, :cond_4

    .line 84
    .line 85
    move v0, v5

    .line 86
    goto :goto_2

    .line 87
    :cond_4
    const-string v7, "width"

    .line 88
    .line 89
    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    if-eqz v7, :cond_5

    .line 94
    .line 95
    move v1, v5

    .line 96
    goto :goto_2

    .line 97
    :cond_5
    const-string v2, "height"

    .line 98
    .line 99
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_6

    .line 104
    .line 105
    move v2, v5

    .line 106
    :goto_2
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    const/16 v4, 0x10

    .line 111
    .line 112
    if-ne v3, v4, :cond_0

    .line 113
    .line 114
    invoke-interface {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_6
    const-string p0, "syntax error, "

    .line 119
    .line 120
    invoke-virtual {p0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-object v4

    .line 128
    :cond_7
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-object v4

    .line 132
    :cond_8
    invoke-static {v5}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object v4
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    instance-of p3, p2, Ljava/awt/Point;

    .line 10
    .line 11
    const-string p4, "y"

    .line 12
    .line 13
    const-string p5, "x"

    .line 14
    .line 15
    const/16 v0, 0x2c

    .line 16
    .line 17
    const/16 v1, 0x7b

    .line 18
    .line 19
    if-eqz p3, :cond_1

    .line 20
    .line 21
    check-cast p2, Ljava/awt/Point;

    .line 22
    .line 23
    const-class p3, Ljava/awt/Point;

    .line 24
    .line 25
    invoke-virtual {p0, p1, p3, v1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    iget p3, p2, Ljava/awt/Point;->x:I

    .line 30
    .line 31
    invoke-virtual {p1, p0, p5, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iget p0, p2, Ljava/awt/Point;->y:I

    .line 35
    .line 36
    invoke-virtual {p1, v0, p4, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_1
    instance-of p3, p2, Ljava/awt/Font;

    .line 42
    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    check-cast p2, Ljava/awt/Font;

    .line 46
    .line 47
    const-class p3, Ljava/awt/Font;

    .line 48
    .line 49
    invoke-virtual {p0, p1, p3, v1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    const-string p3, "name"

    .line 54
    .line 55
    invoke-virtual {p2}, Ljava/awt/Font;->getName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    invoke-virtual {p1, p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-string p0, "style"

    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/awt/Font;->getStyle()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    invoke-virtual {p1, v0, p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    const-string p0, "size"

    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/awt/Font;->getSize()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-virtual {p1, v0, p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    instance-of p3, p2, Ljava/awt/Rectangle;

    .line 82
    .line 83
    if-eqz p3, :cond_3

    .line 84
    .line 85
    check-cast p2, Ljava/awt/Rectangle;

    .line 86
    .line 87
    const-class p3, Ljava/awt/Rectangle;

    .line 88
    .line 89
    invoke-virtual {p0, p1, p3, v1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    iget p3, p2, Ljava/awt/Rectangle;->x:I

    .line 94
    .line 95
    invoke-virtual {p1, p0, p5, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    iget p0, p2, Ljava/awt/Rectangle;->y:I

    .line 99
    .line 100
    invoke-virtual {p1, v0, p4, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 101
    .line 102
    .line 103
    const-string p0, "width"

    .line 104
    .line 105
    iget p3, p2, Ljava/awt/Rectangle;->width:I

    .line 106
    .line 107
    invoke-virtual {p1, v0, p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    const-string p0, "height"

    .line 111
    .line 112
    iget p2, p2, Ljava/awt/Rectangle;->height:I

    .line 113
    .line 114
    invoke-virtual {p1, v0, p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    instance-of p3, p2, Ljava/awt/Color;

    .line 119
    .line 120
    if-eqz p3, :cond_5

    .line 121
    .line 122
    check-cast p2, Ljava/awt/Color;

    .line 123
    .line 124
    const-class p3, Ljava/awt/Color;

    .line 125
    .line 126
    invoke-virtual {p0, p1, p3, v1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    const-string p3, "r"

    .line 131
    .line 132
    invoke-virtual {p2}, Ljava/awt/Color;->getRed()I

    .line 133
    .line 134
    .line 135
    move-result p4

    .line 136
    invoke-virtual {p1, p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 137
    .line 138
    .line 139
    const-string p0, "g"

    .line 140
    .line 141
    invoke-virtual {p2}, Ljava/awt/Color;->getGreen()I

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    invoke-virtual {p1, v0, p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    const-string p0, "b"

    .line 149
    .line 150
    invoke-virtual {p2}, Ljava/awt/Color;->getBlue()I

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    invoke-virtual {p1, v0, p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Ljava/awt/Color;->getAlpha()I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-lez p0, :cond_4

    .line 162
    .line 163
    const-string p0, "alpha"

    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/awt/Color;->getAlpha()I

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    invoke-virtual {p1, v0, p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 170
    .line 171
    .line 172
    :cond_4
    :goto_0
    const/16 p0, 0x7d

    .line 173
    .line 174
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_5
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    const-string p1, "not support awt class : "

    .line 187
    .line 188
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/serializer/SerializeWriter;",
            "Ljava/lang/Class<",
            "*>;C)C"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x7b

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 p0, 0x2c

    .line 27
    .line 28
    return p0

    .line 29
    :cond_0
    return p3
.end method
