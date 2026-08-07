.class public Lorg/eclipse/jetty/http/EncodedHttpURI;
.super Lorg/eclipse/jetty/http/HttpURI;
.source "SourceFile"


# instance fields
.field private final _encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpURI;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public decodeQueryTo(Lorg/eclipse/jetty/util/MultiMap;)V
    .locals 4

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 9
    .line 10
    add-int/lit8 v3, v0, 0x1

    .line 11
    .line 12
    sub-int/2addr v1, v0

    .line 13
    add-int/lit8 v1, v1, -0x1

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2, v3, v1, v0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p1, p0}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public decodeQueryTo(Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 27
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    if-nez p2, :cond_1

    .line 28
    iget-object p2, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 29
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    add-int/lit8 v2, v0, 0x1

    sub-int/2addr v1, v0

    add-int/lit8 v1, v1, -0x1

    invoke-static {p0, v2, v1, p2}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V

    return-void
.end method

.method public getAuthority()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getCompletePath()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getDecodedPath()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    invoke-static {p0, v0, v1}, Lorg/eclipse/jetty/util/URIUtil;->decodePath([BII)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getFragment()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    add-int/lit8 v3, v0, 0x1

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v2, v3, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getHost()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_host:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getParam()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    add-int/lit8 v3, v0, 0x1

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v2, v3, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_param:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getPathAndParam()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    sub-int/2addr v1, v0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getPort()I
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_port:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_path:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    add-int/lit8 v2, v0, 0x1

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    const/16 v0, 0xa

    .line 17
    .line 18
    invoke-static {p0, v2, v1, v0}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 10
    .line 11
    add-int/lit8 v3, v0, 0x1

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v2, v3, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 8

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_authority:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sub-int v2, v1, v0

    .line 10
    .line 11
    const/4 v3, 0x5

    .line 12
    const/16 v4, 0x70

    .line 13
    .line 14
    const/16 v5, 0x68

    .line 15
    .line 16
    const/16 v6, 0x74

    .line 17
    .line 18
    if-ne v2, v3, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 21
    .line 22
    aget-byte v7, v3, v0

    .line 23
    .line 24
    if-ne v7, v5, :cond_1

    .line 25
    .line 26
    add-int/lit8 v7, v0, 0x1

    .line 27
    .line 28
    aget-byte v7, v3, v7

    .line 29
    .line 30
    if-ne v7, v6, :cond_1

    .line 31
    .line 32
    add-int/lit8 v7, v0, 0x2

    .line 33
    .line 34
    aget-byte v7, v3, v7

    .line 35
    .line 36
    if-ne v7, v6, :cond_1

    .line 37
    .line 38
    add-int/lit8 v7, v0, 0x3

    .line 39
    .line 40
    aget-byte v3, v3, v7

    .line 41
    .line 42
    if-ne v3, v4, :cond_1

    .line 43
    .line 44
    const-string p0, "http"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    const/4 v3, 0x6

    .line 48
    if-ne v2, v3, :cond_2

    .line 49
    .line 50
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 51
    .line 52
    aget-byte v3, v2, v0

    .line 53
    .line 54
    if-ne v3, v5, :cond_2

    .line 55
    .line 56
    add-int/lit8 v3, v0, 0x1

    .line 57
    .line 58
    aget-byte v3, v2, v3

    .line 59
    .line 60
    if-ne v3, v6, :cond_2

    .line 61
    .line 62
    add-int/lit8 v3, v0, 0x2

    .line 63
    .line 64
    aget-byte v3, v2, v3

    .line 65
    .line 66
    if-ne v3, v6, :cond_2

    .line 67
    .line 68
    add-int/lit8 v3, v0, 0x3

    .line 69
    .line 70
    aget-byte v3, v2, v3

    .line 71
    .line 72
    if-ne v3, v4, :cond_2

    .line 73
    .line 74
    add-int/lit8 v3, v0, 0x4

    .line 75
    .line 76
    aget-byte v2, v2, v3

    .line 77
    .line 78
    const/16 v3, 0x73

    .line 79
    .line 80
    if-ne v2, v3, :cond_2

    .line 81
    .line 82
    const-string p0, "https"

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 86
    .line 87
    sub-int/2addr v1, v0

    .line 88
    add-int/lit8 v1, v1, -0x1

    .line 89
    .line 90
    iget-object p0, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2, v0, v1, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method

.method public hasQuery()Z
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_fragment:I

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_query:I

    .line 4
    .line 5
    if-le v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_raw:[B

    .line 6
    .line 7
    iget v1, p0, Lorg/eclipse/jetty/http/HttpURI;->_scheme:I

    .line 8
    .line 9
    iget v2, p0, Lorg/eclipse/jetty/http/HttpURI;->_end:I

    .line 10
    .line 11
    sub-int/2addr v2, v1

    .line 12
    iget-object v3, p0, Lorg/eclipse/jetty/http/EncodedHttpURI;->_encoding:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpURI;->_rawString:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public writeTo(Lorg/eclipse/jetty/util/Utf8StringBuffer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/Utf8StringBuffer;->getStringBuffer()Ljava/lang/StringBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/EncodedHttpURI;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 10
    .line 11
    .line 12
    return-void
.end method
