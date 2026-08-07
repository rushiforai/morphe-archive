.class public Lorg/eclipse/jetty/util/QuotedStringTokenizer;
.super Ljava/util/StringTokenizer;
.source "SourceFile"


# static fields
.field private static final __delim:Ljava/lang/String; = "\t\n\r"

.field private static final escapes:[C


# instance fields
.field private _delim:Ljava/lang/String;

.field private _double:Z

.field private _hasToken:Z

.field private _i:I

.field private _lastStart:I

.field private _returnDelimiters:Z

.field private _returnQuotes:Z

.field private _single:Z

.field private _string:Ljava/lang/String;

.field private _token:Ljava/lang/StringBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    sput-object v0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->escapes:[C

    .line 6
    .line 7
    const v1, 0xffff

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    const/16 v2, 0x62

    .line 16
    .line 17
    aput-char v2, v0, v1

    .line 18
    .line 19
    const/16 v1, 0x9

    .line 20
    .line 21
    const/16 v2, 0x74

    .line 22
    .line 23
    aput-char v2, v0, v1

    .line 24
    .line 25
    const/16 v1, 0xa

    .line 26
    .line 27
    const/16 v2, 0x6e

    .line 28
    .line 29
    aput-char v2, v0, v1

    .line 30
    .line 31
    const/16 v1, 0xc

    .line 32
    .line 33
    const/16 v2, 0x66

    .line 34
    .line 35
    aput-char v2, v0, v1

    .line 36
    .line 37
    const/16 v1, 0xd

    .line 38
    .line 39
    const/16 v2, 0x72

    .line 40
    .line 41
    aput-char v2, v0, v1

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 109
    invoke-direct {p0, p1, v0, v1, v1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 108
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 107
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "\t\n\r"

    .line 7
    .line 8
    iput-object v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnDelimiters:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 16
    .line 17
    iput v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 18
    .line 19
    iput v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_lastStart:I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_double:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_single:Z

    .line 25
    .line 26
    iput-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_string:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    iput-object p2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    iput-boolean p3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnDelimiters:Z

    .line 33
    .line 34
    iput-boolean p4, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 35
    .line 36
    iget-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 37
    .line 38
    const/16 p2, 0x27

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-gez p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 47
    .line 48
    const/16 p2, 0x22

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(I)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-gez p1, :cond_2

    .line 55
    .line 56
    new-instance p1, Ljava/lang/StringBuffer;

    .line 57
    .line 58
    iget-object p2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_string:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    const/16 p3, 0x400

    .line 65
    .line 66
    if-le p2, p3, :cond_1

    .line 67
    .line 68
    const/16 p2, 0x200

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object p2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_string:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    div-int/lit8 p2, p2, 0x2

    .line 78
    .line 79
    :goto_0
    invoke-direct {p1, p2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    new-instance p1, Ljava/lang/Error;

    .line 86
    .line 87
    iget-object p0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 88
    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p3, "Can\'t use quotes as delimiters: "

    .line 92
    .line 93
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-direct {p1, p0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw p1
.end method

.method public static quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 96
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 97
    const-string p0, "\"\""

    return-object p0

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x8

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 99
    invoke-static {v0, p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static quote(Ljava/lang/Appendable;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/16 v0, 0x22

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_5

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/16 v3, 0x20

    .line 18
    .line 19
    const/16 v4, 0x5c

    .line 20
    .line 21
    if-lt v2, v3, :cond_2

    .line 22
    .line 23
    if-eq v2, v0, :cond_0

    .line 24
    .line 25
    if-ne v2, v4, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-interface {p0, v2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    sget-object v3, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->escapes:[C

    .line 35
    .line 36
    aget-char v3, v3, v2

    .line 37
    .line 38
    const v5, 0xffff

    .line 39
    .line 40
    .line 41
    if-ne v3, v5, :cond_4

    .line 42
    .line 43
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const/16 v4, 0x75

    .line 48
    .line 49
    invoke-interface {v3, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const/16 v4, 0x30

    .line 54
    .line 55
    invoke-interface {v3, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-interface {v3, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 60
    .line 61
    .line 62
    const/16 v3, 0x10

    .line 63
    .line 64
    if-ge v2, v3, :cond_3

    .line 65
    .line 66
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {p0, v2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    invoke-interface {p0, v4}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {v2, v3}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 82
    .line 83
    .line 84
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    invoke-interface {p0, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :catch_0
    move-exception p0

    .line 92
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static quoteIfNeeded(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string p0, "\"\""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_4

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/16 v2, 0x5c

    .line 26
    .line 27
    if-eq v1, v2, :cond_3

    .line 28
    .line 29
    const/16 v2, 0x22

    .line 30
    .line 31
    if-eq v1, v2, :cond_3

    .line 32
    .line 33
    const/16 v2, 0x27

    .line 34
    .line 35
    if-eq v1, v2, :cond_3

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-ltz v1, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    :goto_1
    new-instance p1, Ljava/lang/StringBuffer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/lit8 v0, v0, 0x8

    .line 60
    .line 61
    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    :cond_4
    return-object p0
.end method

.method public static quoteIfNeeded(Ljava/lang/Appendable;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 72
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 73
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 74
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_0

    .line 75
    invoke-static {p0, p1}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->quote(Ljava/lang/Appendable;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 76
    :cond_1
    :try_start_0
    invoke-interface {p0, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception p0

    .line 77
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return v0
.end method

.method public static unquote(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x2

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x1

    .line 24
    sub-int/2addr v3, v4

    .line 25
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-ne v2, v3, :cond_f

    .line 30
    .line 31
    const/16 v3, 0x22

    .line 32
    .line 33
    if-eq v2, v3, :cond_2

    .line 34
    .line 35
    const/16 v5, 0x27

    .line 36
    .line 37
    if-eq v2, v5, :cond_2

    .line 38
    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    sub-int/2addr v5, v1

    .line 48
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 49
    .line 50
    .line 51
    move v5, v0

    .line 52
    move v1, v4

    .line 53
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    sub-int/2addr v6, v4

    .line 58
    if-ge v1, v6, :cond_e

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    const/16 v7, 0x5c

    .line 65
    .line 66
    if-eqz v5, :cond_c

    .line 67
    .line 68
    if-eq v6, v3, :cond_b

    .line 69
    .line 70
    const/16 v5, 0x2f

    .line 71
    .line 72
    if-eq v6, v5, :cond_a

    .line 73
    .line 74
    if-eq v6, v7, :cond_9

    .line 75
    .line 76
    const/16 v5, 0x62

    .line 77
    .line 78
    const/16 v7, 0x8

    .line 79
    .line 80
    if-eq v6, v5, :cond_8

    .line 81
    .line 82
    const/16 v5, 0x66

    .line 83
    .line 84
    if-eq v6, v5, :cond_7

    .line 85
    .line 86
    const/16 v5, 0x6e

    .line 87
    .line 88
    if-eq v6, v5, :cond_6

    .line 89
    .line 90
    const/16 v5, 0x72

    .line 91
    .line 92
    if-eq v6, v5, :cond_5

    .line 93
    .line 94
    const/16 v5, 0x74

    .line 95
    .line 96
    if-eq v6, v5, :cond_4

    .line 97
    .line 98
    const/16 v5, 0x75

    .line 99
    .line 100
    if-eq v6, v5, :cond_3

    .line 101
    .line 102
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    add-int/lit8 v5, v1, 0x1

    .line 107
    .line 108
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    int-to-byte v6, v6

    .line 113
    invoke-static {v6}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    shl-int/lit8 v6, v6, 0x18

    .line 118
    .line 119
    add-int/lit8 v8, v1, 0x2

    .line 120
    .line 121
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    int-to-byte v5, v5

    .line 126
    invoke-static {v5}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    shl-int/lit8 v5, v5, 0x10

    .line 131
    .line 132
    add-int/2addr v6, v5

    .line 133
    add-int/lit8 v5, v1, 0x3

    .line 134
    .line 135
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    int-to-byte v8, v8

    .line 140
    invoke-static {v8}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    shl-int/lit8 v7, v8, 0x8

    .line 145
    .line 146
    add-int/2addr v6, v7

    .line 147
    add-int/lit8 v1, v1, 0x4

    .line 148
    .line 149
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    int-to-byte v5, v5

    .line 154
    invoke-static {v5}, Lorg/eclipse/jetty/util/TypeUtil;->convertHexDigit(B)B

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    add-int/2addr v6, v5

    .line 159
    int-to-char v5, v6

    .line 160
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    :goto_1
    move v5, v0

    .line 164
    goto :goto_2

    .line 165
    :cond_4
    const/16 v5, 0x9

    .line 166
    .line 167
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_5
    const/16 v5, 0xd

    .line 172
    .line 173
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_6
    const/16 v5, 0xa

    .line 178
    .line 179
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_7
    const/16 v5, 0xc

    .line 184
    .line 185
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_8
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_9
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_a
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_b
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_c
    if-ne v6, v7, :cond_d

    .line 206
    .line 207
    move v5, v4

    .line 208
    goto :goto_2

    .line 209
    :cond_d
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    :goto_2
    add-int/2addr v1, v4

    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    :cond_f
    :goto_3
    return-object p0
.end method


# virtual methods
.method public countTokens()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public getDouble()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_double:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSingle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_single:Z

    .line 2
    .line 3
    return p0
.end method

.method public hasMoreElements()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->hasMoreTokens()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public hasMoreTokens()Z
    .locals 10

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 8
    .line 9
    iput v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_lastStart:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v2, v0

    .line 13
    move v3, v2

    .line 14
    :cond_1
    :goto_0
    iget v4, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 15
    .line 16
    iget-object v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_string:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-ge v4, v5, :cond_17

    .line 23
    .line 24
    iget-object v4, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_string:Ljava/lang/String;

    .line 25
    .line 26
    iget v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 27
    .line 28
    add-int/lit8 v6, v5, 0x1

    .line 29
    .line 30
    iput v6, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    const/16 v5, 0x27

    .line 37
    .line 38
    const/16 v6, 0x22

    .line 39
    .line 40
    const/4 v7, 0x3

    .line 41
    const/4 v8, 0x2

    .line 42
    if-eqz v2, :cond_13

    .line 43
    .line 44
    if-eq v2, v1, :cond_c

    .line 45
    .line 46
    const/16 v9, 0x5c

    .line 47
    .line 48
    if-eq v2, v8, :cond_8

    .line 49
    .line 50
    if-eq v2, v7, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 54
    .line 55
    if-eqz v3, :cond_3

    .line 56
    .line 57
    iget-object v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 60
    .line 61
    .line 62
    :goto_1
    move v3, v0

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    if-ne v4, v6, :cond_5

    .line 65
    .line 66
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 67
    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 71
    .line 72
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 73
    .line 74
    .line 75
    :cond_4
    :goto_2
    move v2, v1

    .line 76
    goto :goto_0

    .line 77
    :cond_5
    if-ne v4, v9, :cond_7

    .line 78
    .line 79
    iget-boolean v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 80
    .line 81
    if-eqz v3, :cond_6

    .line 82
    .line 83
    iget-object v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 84
    .line 85
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 86
    .line 87
    .line 88
    :cond_6
    :goto_3
    move v3, v1

    .line 89
    goto :goto_0

    .line 90
    :cond_7
    iget-object v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 91
    .line 92
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_8
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 97
    .line 98
    if-eqz v3, :cond_9

    .line 99
    .line 100
    iget-object v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 101
    .line 102
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_9
    if-ne v4, v5, :cond_a

    .line 107
    .line 108
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 109
    .line 110
    if-eqz v2, :cond_4

    .line 111
    .line 112
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 113
    .line 114
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 115
    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_a
    if-ne v4, v9, :cond_b

    .line 119
    .line 120
    iget-boolean v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 121
    .line 122
    if-eqz v3, :cond_6

    .line 123
    .line 124
    iget-object v3, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 125
    .line 126
    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 127
    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_b
    iget-object v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 131
    .line 132
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_c
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 137
    .line 138
    iget-object v9, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v9, v4}, Ljava/lang/String;->indexOf(I)I

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    if-ltz v9, :cond_e

    .line 145
    .line 146
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnDelimiters:Z

    .line 147
    .line 148
    if-eqz v0, :cond_d

    .line 149
    .line 150
    iget v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 151
    .line 152
    sub-int/2addr v0, v1

    .line 153
    iput v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 154
    .line 155
    :cond_d
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 156
    .line 157
    return p0

    .line 158
    :cond_e
    if-ne v4, v5, :cond_10

    .line 159
    .line 160
    iget-boolean v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_single:Z

    .line 161
    .line 162
    if-eqz v5, :cond_10

    .line 163
    .line 164
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 165
    .line 166
    if-eqz v2, :cond_f

    .line 167
    .line 168
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 169
    .line 170
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 171
    .line 172
    .line 173
    :cond_f
    :goto_4
    move v2, v8

    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_10
    if-ne v4, v6, :cond_12

    .line 177
    .line 178
    iget-boolean v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_double:Z

    .line 179
    .line 180
    if-eqz v5, :cond_12

    .line 181
    .line 182
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 183
    .line 184
    if-eqz v2, :cond_11

    .line 185
    .line 186
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 187
    .line 188
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 189
    .line 190
    .line 191
    :cond_11
    :goto_5
    move v2, v7

    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_12
    iget-object v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 195
    .line 196
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 197
    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_13
    iget-object v9, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v9, v4}, Ljava/lang/String;->indexOf(I)I

    .line 204
    .line 205
    .line 206
    move-result v9

    .line 207
    if-ltz v9, :cond_14

    .line 208
    .line 209
    iget-boolean v5, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnDelimiters:Z

    .line 210
    .line 211
    if-eqz v5, :cond_1

    .line 212
    .line 213
    iget-object v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 214
    .line 215
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 216
    .line 217
    .line 218
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 219
    .line 220
    return v1

    .line 221
    :cond_14
    if-ne v4, v5, :cond_15

    .line 222
    .line 223
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_single:Z

    .line 224
    .line 225
    if-eqz v2, :cond_15

    .line 226
    .line 227
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 228
    .line 229
    if-eqz v2, :cond_f

    .line 230
    .line 231
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 232
    .line 233
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 234
    .line 235
    .line 236
    goto :goto_4

    .line 237
    :cond_15
    if-ne v4, v6, :cond_16

    .line 238
    .line 239
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_double:Z

    .line 240
    .line 241
    if-eqz v2, :cond_16

    .line 242
    .line 243
    iget-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_returnQuotes:Z

    .line 244
    .line 245
    if-eqz v2, :cond_11

    .line 246
    .line 247
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 248
    .line 249
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 250
    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_16
    iget-object v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 254
    .line 255
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 256
    .line 257
    .line 258
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 259
    .line 260
    goto/16 :goto_2

    .line 261
    .line 262
    :cond_17
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 263
    .line 264
    return p0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->nextToken()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->hasMoreTokens()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 19
    .line 20
    .line 21
    iput-boolean v2, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public nextToken(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 29
    iput-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_delim:Ljava/lang/String;

    .line 30
    iget p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_lastStart:I

    iput p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_i:I

    .line 31
    iget-object p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_token:Ljava/lang/StringBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 32
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_hasToken:Z

    .line 33
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public setDouble(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_double:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSingle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->_single:Z

    .line 2
    .line 3
    return-void
.end method
