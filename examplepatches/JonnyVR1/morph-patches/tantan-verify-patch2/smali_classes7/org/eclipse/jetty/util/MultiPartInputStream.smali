.class public Lorg/eclipse/jetty/util/MultiPartInputStream;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;,
        Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;
    }
.end annotation


# static fields
.field public static final __DEFAULT_MULTIPART_CONFIG:Ll/lu10;


# instance fields
.field protected _config:Ll/lu10;

.field protected _contentType:Ljava/lang/String;

.field protected _contextTmpDir:Ljava/io/File;

.field protected _deleteOnExit:Z

.field protected _in:Ljava/io/InputStream;

.field protected _parts:Lorg/eclipse/jetty/util/MultiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jetty/util/MultiMap<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected _tmpDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lu10;

    .line 2
    .line 3
    const-string v1, "java.io.tmpdir"

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ll/lu10;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->__DEFAULT_MULTIPART_CONFIG:Ll/lu10;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ll/lu10;Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 10
    .line 11
    iput-object p2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contentType:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 14
    .line 15
    iput-object p4, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 16
    .line 17
    if-nez p4, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/io/File;

    .line 20
    .line 21
    const-string p2, "java.io.tmpdir"

    .line 22
    .line 23
    invoke-static {p2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    new-instance p1, Ll/lu10;

    .line 37
    .line 38
    iget-object p2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-direct {p1, p2}, Ll/lu10;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method private value(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 p0, 0x3d

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    add-int/2addr p0, v0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 p1, 0x3b

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v1, 0x0

    .line 24
    if-lez p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_0
    const-string p1, "\""

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    const/16 p1, 0x22

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(II)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    if-eqz p2, :cond_2

    .line 50
    .line 51
    const/16 p1, 0x20

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-lez p1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :cond_2
    return-object p0
.end method


# virtual methods
.method public deleteParts()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jetty/util/MultiException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream;->getParsedParts()Ljava/util/Collection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lorg/eclipse/jetty/util/MultiException;

    .line 6
    .line 7
    invoke-direct {v1}, Lorg/eclipse/jetty/util/MultiException;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/qg60;

    .line 25
    .line 26
    :try_start_0
    check-cast v2, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;

    .line 27
    .line 28
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->cleanUp()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v2

    .line 33
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/util/MultiException;->add(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiMap;->clear()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/MultiException;->ifExceptionThrowMulti()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public getParsedParts()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ll/qg60;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiMap;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/LazyList;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v0
.end method

.method public getPart(Ljava/lang/String;)Ll/qg60;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream;->parse()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/util/MultiMap;->getValue(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/qg60;

    .line 12
    .line 13
    return-object p0
.end method

.method public getParts()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ll/qg60;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream;->parse()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/LazyList;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v0
.end method

.method public isDeleteOnExit()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_deleteOnExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public parse()V
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_19

    .line 8
    .line 9
    :cond_0
    new-instance v1, Lorg/eclipse/jetty/util/MultiMap;

    .line 10
    .line 11
    invoke-direct {v1}, Lorg/eclipse/jetty/util/MultiMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 15
    .line 16
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contentType:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v1, :cond_33

    .line 19
    .line 20
    const-string v2, "multipart/form-data"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    goto/16 :goto_19

    .line 29
    .line 30
    :cond_1
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/lu10;->b()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 39
    .line 40
    iput-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/lu10;->b()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, ""

    .line 50
    .line 51
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 58
    .line 59
    iput-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    new-instance v1, Ljava/io/File;

    .line 63
    .line 64
    iget-object v2, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 65
    .line 66
    invoke-virtual {v2}, Ll/lu10;->b()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/io/File;->isAbsolute()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    iput-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    new-instance v1, Ljava/io/File;

    .line 83
    .line 84
    iget-object v2, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contextTmpDir:Ljava/io/File;

    .line 85
    .line 86
    iget-object v3, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 87
    .line 88
    invoke-virtual {v3}, Ll/lu10;->b()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iput-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 96
    .line 97
    :goto_0
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 108
    .line 109
    .line 110
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v2, "--"

    .line 113
    .line 114
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v3, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_contentType:Ljava/lang/String;

    .line 118
    .line 119
    const-string v4, "boundary="

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    const/4 v4, 0x1

    .line 130
    invoke-direct {v0, v3, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream;->value(Ljava/lang/String;Z)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-static {v3}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->unquote(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    const-string v3, "ISO-8859-1"

    .line 154
    .line 155
    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    iget-object v3, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 160
    .line 161
    invoke-static {v3}, Lorg/eclipse/jetty/util/TypeUtil;->readLine(Ljava/io/InputStream;)[B

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    const-string v5, "UTF-8"

    .line 166
    .line 167
    if-nez v3, :cond_6

    .line 168
    .line 169
    const/4 v7, 0x0

    .line 170
    goto :goto_1

    .line 171
    :cond_6
    new-instance v7, Ljava/lang/String;

    .line 172
    .line 173
    invoke-direct {v7, v3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :goto_1
    if-eqz v7, :cond_32

    .line 177
    .line 178
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_32

    .line 183
    .line 184
    const/4 v3, 0x0

    .line 185
    const-wide/16 v9, 0x0

    .line 186
    .line 187
    const/4 v11, 0x0

    .line 188
    const/4 v12, 0x0

    .line 189
    const/4 v13, 0x0

    .line 190
    :goto_2
    if-nez v3, :cond_7

    .line 191
    .line 192
    new-instance v14, Lorg/eclipse/jetty/util/MultiMap;

    .line 193
    .line 194
    invoke-direct {v14}, Lorg/eclipse/jetty/util/MultiMap;-><init>()V

    .line 195
    .line 196
    .line 197
    :goto_3
    iget-object v15, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 198
    .line 199
    invoke-static {v15}, Lorg/eclipse/jetty/util/TypeUtil;->readLine(Ljava/io/InputStream;)[B

    .line 200
    .line 201
    .line 202
    move-result-object v15

    .line 203
    if-nez v15, :cond_8

    .line 204
    .line 205
    :cond_7
    move/from16 v21, v3

    .line 206
    .line 207
    goto/16 :goto_18

    .line 208
    .line 209
    :cond_8
    array-length v6, v15

    .line 210
    const-wide/16 v16, 0x0

    .line 211
    .line 212
    const-string v7, ")"

    .line 213
    .line 214
    const-string v8, "Request exceeds maxRequestSize ("

    .line 215
    .line 216
    if-nez v6, :cond_2b

    .line 217
    .line 218
    if-eqz v11, :cond_2a

    .line 219
    .line 220
    new-instance v6, Lorg/eclipse/jetty/util/QuotedStringTokenizer;

    .line 221
    .line 222
    const-string v15, ";"

    .line 223
    .line 224
    invoke-direct {v6, v11, v15}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    const/4 v15, 0x0

    .line 228
    const/16 v18, 0x0

    .line 229
    .line 230
    const/16 v19, 0x0

    .line 231
    .line 232
    :goto_4
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->hasMoreTokens()Z

    .line 233
    .line 234
    .line 235
    move-result v20

    .line 236
    if-eqz v20, :cond_c

    .line 237
    .line 238
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->nextToken()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v20

    .line 242
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 247
    .line 248
    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    move/from16 v21, v3

    .line 253
    .line 254
    const-string v3, "form-data"

    .line 255
    .line 256
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    if-eqz v3, :cond_9

    .line 261
    .line 262
    const/4 v15, 0x1

    .line 263
    goto :goto_5

    .line 264
    :cond_9
    const-string v3, "name="

    .line 265
    .line 266
    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    if-eqz v3, :cond_a

    .line 271
    .line 272
    const/4 v3, 0x1

    .line 273
    invoke-direct {v0, v1, v3}, Lorg/eclipse/jetty/util/MultiPartInputStream;->value(Ljava/lang/String;Z)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v18

    .line 277
    goto :goto_5

    .line 278
    :cond_a
    const-string v3, "filename="

    .line 279
    .line 280
    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_b

    .line 285
    .line 286
    const/4 v3, 0x0

    .line 287
    invoke-direct {v0, v1, v3}, Lorg/eclipse/jetty/util/MultiPartInputStream;->value(Ljava/lang/String;Z)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v19

    .line 291
    :cond_b
    :goto_5
    move/from16 v3, v21

    .line 292
    .line 293
    const/4 v4, 0x1

    .line 294
    goto :goto_4

    .line 295
    :cond_c
    move/from16 v21, v3

    .line 296
    .line 297
    if-nez v15, :cond_d

    .line 298
    .line 299
    goto :goto_6

    .line 300
    :cond_d
    move-object/from16 v1, v18

    .line 301
    .line 302
    if-nez v1, :cond_e

    .line 303
    .line 304
    :goto_6
    move/from16 v3, v21

    .line 305
    .line 306
    const/4 v4, 0x1

    .line 307
    goto :goto_2

    .line 308
    :cond_e
    const-string v3, "base64"

    .line 309
    .line 310
    invoke-virtual {v3, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-eqz v3, :cond_f

    .line 315
    .line 316
    new-instance v3, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;

    .line 317
    .line 318
    iget-object v4, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 319
    .line 320
    invoke-direct {v3, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;-><init>(Ljava/io/InputStream;)V

    .line 321
    .line 322
    .line 323
    iput-object v3, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 324
    .line 325
    goto :goto_7

    .line 326
    :cond_f
    const-string v3, "quoted-printable"

    .line 327
    .line 328
    invoke-virtual {v3, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    if-eqz v3, :cond_10

    .line 333
    .line 334
    new-instance v3, Lorg/eclipse/jetty/util/MultiPartInputStream$1;

    .line 335
    .line 336
    iget-object v4, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 337
    .line 338
    invoke-direct {v3, v0, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream$1;-><init>(Lorg/eclipse/jetty/util/MultiPartInputStream;Ljava/io/InputStream;)V

    .line 339
    .line 340
    .line 341
    iput-object v3, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 342
    .line 343
    :cond_10
    :goto_7
    new-instance v3, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;

    .line 344
    .line 345
    move-object/from16 v4, v19

    .line 346
    .line 347
    invoke-direct {v3, v0, v1, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;-><init>(Lorg/eclipse/jetty/util/MultiPartInputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v3, v14}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->setHeaders(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v3, v13}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->setContentType(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iget-object v4, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_parts:Lorg/eclipse/jetty/util/MultiMap;

    .line 357
    .line 358
    invoke-virtual {v4, v1, v3}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->open()V

    .line 362
    .line 363
    .line 364
    const/4 v1, -0x2

    .line 365
    move v14, v1

    .line 366
    const/4 v4, 0x0

    .line 367
    const/4 v6, 0x0

    .line 368
    :goto_8
    move-wide/from16 v25, v9

    .line 369
    .line 370
    move v10, v14

    .line 371
    move-wide/from16 v14, v25

    .line 372
    .line 373
    move v9, v6

    .line 374
    move v6, v4

    .line 375
    const/4 v4, 0x0

    .line 376
    :goto_9
    if-eq v10, v1, :cond_11

    .line 377
    .line 378
    move v1, v10

    .line 379
    :goto_a
    move/from16 v19, v6

    .line 380
    .line 381
    goto :goto_b

    .line 382
    :cond_11
    :try_start_0
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    goto :goto_a

    .line 389
    :goto_b
    const/4 v6, -0x1

    .line 390
    move/from16 v22, v9

    .line 391
    .line 392
    const/16 v9, 0xa

    .line 393
    .line 394
    if-eq v1, v6, :cond_1b

    .line 395
    .line 396
    const-wide/16 v23, 0x1

    .line 397
    .line 398
    add-long v14, v14, v23

    .line 399
    .line 400
    iget-object v10, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 401
    .line 402
    invoke-virtual {v10}, Ll/lu10;->d()J

    .line 403
    .line 404
    .line 405
    move-result-wide v23

    .line 406
    cmp-long v10, v23, v16

    .line 407
    .line 408
    if-lez v10, :cond_12

    .line 409
    .line 410
    iget-object v10, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 411
    .line 412
    invoke-virtual {v10}, Ll/lu10;->d()J

    .line 413
    .line 414
    .line 415
    move-result-wide v23

    .line 416
    cmp-long v10, v14, v23

    .line 417
    .line 418
    if-gtz v10, :cond_13

    .line 419
    .line 420
    :cond_12
    const/16 v10, 0xd

    .line 421
    .line 422
    goto :goto_c

    .line 423
    :cond_13
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 424
    .line 425
    new-instance v2, Ljava/lang/StringBuilder;

    .line 426
    .line 427
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 434
    .line 435
    invoke-virtual {v0}, Ll/lu10;->d()J

    .line 436
    .line 437
    .line 438
    move-result-wide v4

    .line 439
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    throw v1

    .line 453
    :catchall_0
    move-exception v0

    .line 454
    goto/16 :goto_16

    .line 455
    .line 456
    :goto_c
    if-eq v1, v10, :cond_19

    .line 457
    .line 458
    if-ne v1, v9, :cond_14

    .line 459
    .line 460
    const/16 v10, 0xd

    .line 461
    .line 462
    goto :goto_e

    .line 463
    :cond_14
    if-ltz v4, :cond_15

    .line 464
    .line 465
    array-length v10, v2

    .line 466
    if-ge v4, v10, :cond_15

    .line 467
    .line 468
    aget-byte v10, v2, v4

    .line 469
    .line 470
    if-ne v1, v10, :cond_15

    .line 471
    .line 472
    add-int/lit8 v4, v4, 0x1

    .line 473
    .line 474
    move/from16 v6, v19

    .line 475
    .line 476
    move/from16 v9, v22

    .line 477
    .line 478
    const/4 v1, -0x2

    .line 479
    :goto_d
    const/4 v10, -0x2

    .line 480
    goto :goto_9

    .line 481
    :cond_15
    if-eqz v19, :cond_16

    .line 482
    .line 483
    const/16 v10, 0xd

    .line 484
    .line 485
    invoke-virtual {v3, v10}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 486
    .line 487
    .line 488
    :cond_16
    if-eqz v22, :cond_17

    .line 489
    .line 490
    invoke-virtual {v3, v9}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 491
    .line 492
    .line 493
    :cond_17
    if-lez v4, :cond_18

    .line 494
    .line 495
    const/4 v9, 0x0

    .line 496
    invoke-virtual {v3, v2, v9, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write([BII)V

    .line 497
    .line 498
    .line 499
    :cond_18
    invoke-virtual {v3, v1}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 500
    .line 501
    .line 502
    move v4, v6

    .line 503
    const/4 v1, -0x2

    .line 504
    const/4 v6, 0x0

    .line 505
    const/4 v9, 0x0

    .line 506
    goto :goto_d

    .line 507
    :cond_19
    :goto_e
    if-ne v1, v10, :cond_1a

    .line 508
    .line 509
    iget-object v10, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_in:Ljava/io/InputStream;

    .line 510
    .line 511
    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    .line 512
    .line 513
    .line 514
    move-result v10

    .line 515
    goto :goto_f

    .line 516
    :cond_1a
    const/4 v10, -0x2

    .line 517
    :cond_1b
    :goto_f
    if-lez v4, :cond_1d

    .line 518
    .line 519
    array-length v6, v2

    .line 520
    add-int/lit8 v6, v6, -0x2

    .line 521
    .line 522
    if-lt v4, v6, :cond_1c

    .line 523
    .line 524
    goto :goto_10

    .line 525
    :cond_1c
    const/16 v20, 0x1

    .line 526
    .line 527
    goto :goto_11

    .line 528
    :cond_1d
    :goto_10
    array-length v6, v2

    .line 529
    const/16 v20, 0x1

    .line 530
    .line 531
    add-int/lit8 v6, v6, -0x1

    .line 532
    .line 533
    if-ne v4, v6, :cond_20

    .line 534
    .line 535
    :goto_11
    if-eqz v19, :cond_1e

    .line 536
    .line 537
    const/16 v6, 0xd

    .line 538
    .line 539
    invoke-virtual {v3, v6}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 540
    .line 541
    .line 542
    :cond_1e
    if-eqz v22, :cond_1f

    .line 543
    .line 544
    invoke-virtual {v3, v9}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 545
    .line 546
    .line 547
    :cond_1f
    const/4 v6, 0x0

    .line 548
    invoke-virtual {v3, v2, v6, v4}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write([BII)V

    .line 549
    .line 550
    .line 551
    const/4 v4, -0x1

    .line 552
    const/16 v19, 0x0

    .line 553
    .line 554
    const/16 v22, 0x0

    .line 555
    .line 556
    :cond_20
    if-gtz v4, :cond_28

    .line 557
    .line 558
    const/4 v6, -0x1

    .line 559
    if-ne v1, v6, :cond_21

    .line 560
    .line 561
    goto :goto_15

    .line 562
    :cond_21
    if-eqz v19, :cond_22

    .line 563
    .line 564
    const/16 v6, 0xd

    .line 565
    .line 566
    invoke-virtual {v3, v6}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 567
    .line 568
    .line 569
    :cond_22
    if-eqz v22, :cond_23

    .line 570
    .line 571
    invoke-virtual {v3, v9}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->write(I)V

    .line 572
    .line 573
    .line 574
    :cond_23
    const/16 v6, 0xd

    .line 575
    .line 576
    if-ne v1, v6, :cond_24

    .line 577
    .line 578
    move/from16 v4, v20

    .line 579
    .line 580
    goto :goto_12

    .line 581
    :cond_24
    const/4 v4, 0x0

    .line 582
    :goto_12
    if-eq v1, v9, :cond_26

    .line 583
    .line 584
    if-ne v10, v9, :cond_25

    .line 585
    .line 586
    goto :goto_13

    .line 587
    :cond_25
    const/4 v6, 0x0

    .line 588
    goto :goto_14

    .line 589
    :cond_26
    :goto_13
    move/from16 v6, v20

    .line 590
    .line 591
    :goto_14
    if-ne v10, v9, :cond_27

    .line 592
    .line 593
    const/4 v10, -0x2

    .line 594
    :cond_27
    move-wide/from16 v25, v14

    .line 595
    .line 596
    move v14, v10

    .line 597
    move-wide/from16 v9, v25

    .line 598
    .line 599
    const/4 v1, -0x2

    .line 600
    goto/16 :goto_8

    .line 601
    .line 602
    :cond_28
    :goto_15
    array-length v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 603
    if-ne v4, v1, :cond_29

    .line 604
    .line 605
    move/from16 v21, v20

    .line 606
    .line 607
    :cond_29
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->close()V

    .line 608
    .line 609
    .line 610
    move-wide v9, v14

    .line 611
    move/from16 v4, v20

    .line 612
    .line 613
    move/from16 v3, v21

    .line 614
    .line 615
    goto/16 :goto_2

    .line 616
    .line 617
    :goto_16
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->close()V

    .line 618
    .line 619
    .line 620
    throw v0

    .line 621
    :cond_2a
    const-string v0, "Missing content-disposition"

    .line 622
    .line 623
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 624
    .line 625
    .line 626
    return-void

    .line 627
    :cond_2b
    move/from16 v21, v3

    .line 628
    .line 629
    move/from16 v20, v4

    .line 630
    .line 631
    array-length v1, v15

    .line 632
    int-to-long v3, v1

    .line 633
    add-long/2addr v9, v3

    .line 634
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 635
    .line 636
    invoke-virtual {v1}, Ll/lu10;->d()J

    .line 637
    .line 638
    .line 639
    move-result-wide v3

    .line 640
    cmp-long v1, v3, v16

    .line 641
    .line 642
    if-lez v1, :cond_2d

    .line 643
    .line 644
    iget-object v1, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 645
    .line 646
    invoke-virtual {v1}, Ll/lu10;->d()J

    .line 647
    .line 648
    .line 649
    move-result-wide v3

    .line 650
    cmp-long v1, v9, v3

    .line 651
    .line 652
    if-gtz v1, :cond_2c

    .line 653
    .line 654
    goto :goto_17

    .line 655
    :cond_2c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 656
    .line 657
    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 658
    .line 659
    invoke-virtual {v0}, Ll/lu10;->d()J

    .line 660
    .line 661
    .line 662
    move-result-wide v2

    .line 663
    new-instance v0, Ljava/lang/StringBuilder;

    .line 664
    .line 665
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 666
    .line 667
    .line 668
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 672
    .line 673
    .line 674
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 679
    .line 680
    .line 681
    throw v1

    .line 682
    :cond_2d
    :goto_17
    new-instance v1, Ljava/lang/String;

    .line 683
    .line 684
    invoke-direct {v1, v15, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 685
    .line 686
    .line 687
    const/16 v3, 0x3a

    .line 688
    .line 689
    const/4 v6, 0x0

    .line 690
    invoke-virtual {v1, v3, v6}, Ljava/lang/String;->indexOf(II)I

    .line 691
    .line 692
    .line 693
    move-result v3

    .line 694
    if-lez v3, :cond_30

    .line 695
    .line 696
    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v4

    .line 700
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v4

    .line 704
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 705
    .line 706
    invoke-virtual {v4, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v4

    .line 710
    add-int/lit8 v3, v3, 0x1

    .line 711
    .line 712
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 713
    .line 714
    .line 715
    move-result v7

    .line 716
    invoke-virtual {v1, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 717
    .line 718
    .line 719
    move-result-object v1

    .line 720
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object v1

    .line 724
    invoke-virtual {v14, v4, v1}, Lorg/eclipse/jetty/util/MultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    .line 726
    .line 727
    const-string v3, "content-disposition"

    .line 728
    .line 729
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 730
    .line 731
    .line 732
    move-result v3

    .line 733
    if-eqz v3, :cond_2e

    .line 734
    .line 735
    move-object v11, v1

    .line 736
    :cond_2e
    const-string v3, "content-type"

    .line 737
    .line 738
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 739
    .line 740
    .line 741
    move-result v3

    .line 742
    if-eqz v3, :cond_2f

    .line 743
    .line 744
    move-object v13, v1

    .line 745
    :cond_2f
    const-string v3, "content-transfer-encoding"

    .line 746
    .line 747
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 748
    .line 749
    .line 750
    move-result v3

    .line 751
    if-eqz v3, :cond_30

    .line 752
    .line 753
    move-object v12, v1

    .line 754
    :cond_30
    move/from16 v4, v20

    .line 755
    .line 756
    move/from16 v3, v21

    .line 757
    .line 758
    goto/16 :goto_3

    .line 759
    .line 760
    :goto_18
    if-eqz v21, :cond_31

    .line 761
    .line 762
    goto :goto_19

    .line 763
    :cond_31
    const-string v0, "Incomplete parts"

    .line 764
    .line 765
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 766
    .line 767
    .line 768
    return-void

    .line 769
    :cond_32
    const-string v0, "Missing initial multi part boundary"

    .line 770
    .line 771
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 772
    .line 773
    .line 774
    :cond_33
    :goto_19
    return-void
.end method

.method public setDeleteOnExit(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_deleteOnExit:Z

    .line 2
    .line 3
    return-void
.end method
