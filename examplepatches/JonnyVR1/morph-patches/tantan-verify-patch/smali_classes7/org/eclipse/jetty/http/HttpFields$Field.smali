.class public final Lorg/eclipse/jetty/http/HttpFields$Field;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpFields;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Field"
.end annotation


# instance fields
.field private _name:Lorg/eclipse/jetty/io/Buffer;

.field private _next:Lorg/eclipse/jetty/http/HttpFields$Field;

.field private _value:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_next:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/http/HttpFields$1;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields$Field;-><init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public static synthetic access$500(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_next:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lorg/eclipse/jetty/http/HttpFields$Field;Lorg/eclipse/jetty/http/HttpFields$Field;)Lorg/eclipse/jetty/http/HttpFields$Field;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_next:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public getIntValue()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getLongValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public getLongValue()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/BufferUtil;->toLong(Lorg/eclipse/jetty/io/Buffer;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/BufferUtil;->to8859_1_String(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getNameBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameOrdinal()I
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/BufferUtil;->to8859_1_String(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getValueBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValueOrdinal()I
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public putTo(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    instance-of v1, v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v2

    .line 16
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 17
    .line 18
    const/16 v3, 0x3a

    .line 19
    .line 20
    const/16 v4, 0xd

    .line 21
    .line 22
    const/16 v5, 0xa

    .line 23
    .line 24
    if-ltz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p1, v1}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 27
    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 35
    .line 36
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    :goto_1
    if-ge v0, v1, :cond_3

    .line 41
    .line 42
    iget-object v6, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_name:Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    add-int/lit8 v7, v0, 0x1

    .line 45
    .line 46
    invoke-interface {v6, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eq v0, v5, :cond_2

    .line 51
    .line 52
    if-eq v0, v4, :cond_2

    .line 53
    .line 54
    if-eq v0, v3, :cond_2

    .line 55
    .line 56
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 57
    .line 58
    .line 59
    :cond_2
    move v0, v7

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    :goto_2
    invoke-interface {p1, v3}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 62
    .line 63
    .line 64
    const/16 v0, 0x20

    .line 65
    .line 66
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 70
    .line 71
    instance-of v1, v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    check-cast v0, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 76
    .line 77
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 82
    .line 83
    if-ltz v2, :cond_5

    .line 84
    .line 85
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 86
    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_5
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 94
    .line 95
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    :goto_3
    if-ge v0, v1, :cond_7

    .line 100
    .line 101
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 102
    .line 103
    add-int/lit8 v3, v0, 0x1

    .line 104
    .line 105
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(I)B

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eq v0, v5, :cond_6

    .line 110
    .line 111
    if-eq v0, v4, :cond_6

    .line 112
    .line 113
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(B)V

    .line 114
    .line 115
    .line 116
    :cond_6
    move v0, v3

    .line 117
    goto :goto_3

    .line 118
    :cond_7
    :goto_4
    invoke-static {p1}, Lorg/eclipse/jetty/io/BufferUtil;->putCRLF(Lorg/eclipse/jetty/io/Buffer;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpFields$Field;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_value:Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpFields$Field;->_next:Lorg/eclipse/jetty/http/HttpFields$Field;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, ""

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p0, "->"

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, "]"

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method
