.class Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/MultiPartInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Base64InputStream"
.end annotation


# instance fields
.field _buffer:[B

.field _in:Ljava/io/BufferedReader;

.field _line:Ljava/lang/String;

.field _pos:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/BufferedReader;

    .line 5
    .line 6
    new-instance v1, Ljava/io/InputStreamReader;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_in:Ljava/io/BufferedReader;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_buffer:[B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_pos:I

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    if-lt v1, v0, :cond_4

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_in:Ljava/io/BufferedReader;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_line:Ljava/lang/String;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const/4 p0, -0x1

    .line 21
    return p0

    .line 22
    :cond_1
    const-string v1, "--"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_line:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "\r\n"

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_buffer:[B

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_buffer:[B

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_line:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0}, Lorg/eclipse/jetty/util/B64Code;->decode(Ljava/lang/String;)[B

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_buffer:[B

    .line 76
    .line 77
    :goto_0
    const/4 v0, 0x0

    .line 78
    iput v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_pos:I

    .line 79
    .line 80
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_buffer:[B

    .line 81
    .line 82
    iget v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_pos:I

    .line 83
    .line 84
    add-int/lit8 v2, v1, 0x1

    .line 85
    .line 86
    iput v2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$Base64InputStream;->_pos:I

    .line 87
    .line 88
    aget-byte p0, v0, v1

    .line 89
    .line 90
    return p0
.end method
