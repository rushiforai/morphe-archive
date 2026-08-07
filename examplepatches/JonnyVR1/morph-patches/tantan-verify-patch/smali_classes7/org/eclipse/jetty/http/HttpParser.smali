.class public Lorg/eclipse/jetty/http/HttpParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/http/HttpParser$EventHandler;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field public static final STATE_CHUNK:I = 0x6

.field public static final STATE_CHUNKED_CONTENT:I = 0x3

.field public static final STATE_CHUNK_PARAMS:I = 0x5

.field public static final STATE_CHUNK_SIZE:I = 0x4

.field public static final STATE_CONTENT:I = 0x2

.field public static final STATE_END:I = 0x0

.field public static final STATE_END0:I = -0x8

.field public static final STATE_END1:I = -0x7

.field public static final STATE_EOF_CONTENT:I = 0x1

.field public static final STATE_FIELD0:I = -0xd

.field public static final STATE_FIELD2:I = -0x6

.field public static final STATE_HEADER:I = -0x5

.field public static final STATE_HEADER_IN_NAME:I = -0x3

.field public static final STATE_HEADER_IN_VALUE:I = -0x1

.field public static final STATE_HEADER_NAME:I = -0x4

.field public static final STATE_HEADER_VALUE:I = -0x2

.field public static final STATE_SEEKING_EOF:I = 0x7

.field public static final STATE_SPACE1:I = -0xc

.field public static final STATE_SPACE2:I = -0x9

.field public static final STATE_START:I = -0xe

.field public static final STATE_STATUS:I = -0xb

.field public static final STATE_URI:I = -0xa


# instance fields
.field private _body:Lorg/eclipse/jetty/io/Buffer;

.field private _buffer:Lorg/eclipse/jetty/io/Buffer;

.field private final _buffers:Lorg/eclipse/jetty/io/Buffers;

.field private _cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

.field protected _chunkLength:I

.field protected _chunkPosition:I

.field protected _contentLength:J

.field protected _contentPosition:J

.field protected final _contentView:Lorg/eclipse/jetty/io/View;

.field private final _endp:Lorg/eclipse/jetty/io/EndPoint;

.field protected _eol:B

.field private _forceContentBuffer:Z

.field private final _handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

.field private _headResponse:Z

.field private _header:Lorg/eclipse/jetty/io/Buffer;

.field protected _length:I

.field private _multiLineValue:Ljava/lang/String;

.field private _persistent:Z

.field private _responseStatus:I

.field protected _state:I

.field private final _tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

.field private final _tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/HttpParser;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/http/HttpParser$EventHandler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/eclipse/jetty/io/View;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/eclipse/jetty/io/View;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 10
    .line 11
    const/16 v0, -0xe

    .line 12
    .line 13
    iput v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 17
    .line 18
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 19
    .line 20
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 23
    .line 24
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    .line 25
    .line 26
    new-instance p1, Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 27
    .line 28
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 29
    .line 30
    invoke-direct {p1, p2}, Lorg/eclipse/jetty/io/View$CaseInsensitive;-><init>(Lorg/eclipse/jetty/io/Buffer;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 34
    .line 35
    new-instance p1, Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 36
    .line 37
    iget-object p2, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 38
    .line 39
    invoke-direct {p1, p2}, Lorg/eclipse/jetty/io/View$CaseInsensitive;-><init>(Lorg/eclipse/jetty/io/Buffer;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/http/HttpParser$EventHandler;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lorg/eclipse/jetty/io/View;

    invoke-direct {v0}, Lorg/eclipse/jetty/io/View;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    const/16 v0, -0xe

    .line 47
    iput v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 48
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 49
    iput-object p2, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 50
    iput-object p3, p0, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    .line 51
    new-instance p1, Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-direct {p1}, Lorg/eclipse/jetty/io/View$CaseInsensitive;-><init>()V

    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 52
    new-instance p1, Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-direct {p1}, Lorg/eclipse/jetty/io/View$CaseInsensitive;-><init>()V

    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    return-void
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 19
    .line 20
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 32
    .line 33
    instance-of v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    check-cast p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;

    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->getInputStream()Ljava/io/InputStream;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-lez p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    return v1

    .line 52
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 56
    .line 57
    if-nez p0, :cond_3

    .line 58
    .line 59
    return v1

    .line 60
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public blockForContent(J)Lorg/eclipse/jetty/io/Buffer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->getState()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-lez v0, :cond_7

    .line 18
    .line 19
    const/4 v0, 0x7

    .line 20
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/http/HttpParser;->isState(I)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    goto :goto_3

    .line 27
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 31
    .line 32
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_5

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/http/HttpParser;->isState(I)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_5

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/http/HttpParser;->isState(I)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_5

    .line 50
    .line 51
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 52
    .line 53
    if-eqz v2, :cond_5

    .line 54
    .line 55
    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_5

    .line 60
    .line 61
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 62
    .line 63
    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_4

    .line 68
    .line 69
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-lez v2, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 77
    .line 78
    invoke-interface {v2, p1, p2}, Lorg/eclipse/jetty/io/EndPoint;->blockReadable(J)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_3

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 86
    .line 87
    invoke-interface {p1}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 88
    .line 89
    .line 90
    new-instance p1, Lorg/eclipse/jetty/io/EofException;

    .line 91
    .line 92
    const-string p2, "timeout"

    .line 93
    .line 94
    invoke-direct {p1, p2}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw p1

    .line 98
    :catch_0
    move-exception p1

    .line 99
    goto :goto_2

    .line 100
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    iget-object p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 105
    .line 106
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-lez p1, :cond_6

    .line 111
    .line 112
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 113
    .line 114
    return-object p0

    .line 115
    :cond_6
    return-object v1

    .line 116
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 117
    .line 118
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 119
    .line 120
    .line 121
    throw p1

    .line 122
    :cond_7
    :goto_3
    return-object v1
.end method

.method public fill()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 40
    .line 41
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 42
    .line 43
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 49
    .line 50
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 51
    .line 52
    if-ne v0, v1, :cond_5

    .line 53
    .line 54
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 55
    .line 56
    if-lez v0, :cond_5

    .line 57
    .line 58
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_5

    .line 63
    .line 64
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_forceContentBuffer:Z

    .line 65
    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iget-wide v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 69
    .line 70
    iget-wide v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 71
    .line 72
    sub-long/2addr v0, v2

    .line 73
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 74
    .line 75
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    int-to-long v2, v2

    .line 80
    cmp-long v0, v0, v2

    .line 81
    .line 82
    if-lez v0, :cond_5

    .line 83
    .line 84
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 85
    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 89
    .line 90
    if-eqz v1, :cond_5

    .line 91
    .line 92
    :cond_3
    if-nez v0, :cond_4

    .line 93
    .line 94
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 95
    .line 96
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffers;->getBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 101
    .line 102
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 103
    .line 104
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 105
    .line 106
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 107
    .line 108
    if-eqz v0, :cond_b

    .line 109
    .line 110
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 111
    .line 112
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 113
    .line 114
    if-eq v0, v1, :cond_6

    .line 115
    .line 116
    iget v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 117
    .line 118
    if-lez v1, :cond_7

    .line 119
    .line 120
    :cond_6
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->compact()V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 124
    .line 125
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 130
    .line 131
    if-nez v0, :cond_9

    .line 132
    .line 133
    sget-object v0, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 134
    .line 135
    const-string v2, "HttpParser Full for {} "

    .line 136
    .line 137
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 145
    .line 146
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 147
    .line 148
    .line 149
    new-instance v0, Lorg/eclipse/jetty/http/HttpException;

    .line 150
    .line 151
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 152
    .line 153
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 154
    .line 155
    if-ne v1, p0, :cond_8

    .line 156
    .line 157
    const-string p0, "body"

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_8
    const-string p0, "head"

    .line 161
    .line 162
    :goto_0
    const-string v1, "FULL "

    .line 163
    .line 164
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const/16 v1, 0x19d

    .line 169
    .line 170
    invoke-direct {v0, v1, p0}, Lorg/eclipse/jetty/http/HttpException;-><init>(ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    throw v0

    .line 174
    :cond_9
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 175
    .line 176
    invoke-interface {v1, p0}, Lorg/eclipse/jetty/io/EndPoint;->fill(Lorg/eclipse/jetty/io/Buffer;)I

    .line 177
    .line 178
    .line 179
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    return p0

    .line 181
    :catch_0
    move-exception p0

    .line 182
    sget-object v0, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 183
    .line 184
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    instance-of v0, p0, Lorg/eclipse/jetty/io/EofException;

    .line 188
    .line 189
    if-eqz v0, :cond_a

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_a
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    .line 193
    .line 194
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    move-object p0, v0

    .line 198
    :goto_1
    throw p0

    .line 199
    :cond_b
    const/4 p0, -0x1

    .line 200
    return p0
.end method

.method public getBodyBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getContentRead()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 26
    .line 27
    return-object p0
.end method

.method public getState()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    return p0
.end method

.method public inContentState()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public inHeaderState()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    if-gez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isChunking()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 2
    .line 3
    const-wide/16 v2, -0x2

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isComplete()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/http/HttpParser;->isState(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public isIdle()Z
    .locals 1

    .line 1
    const/16 v0, -0xe

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/http/HttpParser;->isState(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isMoreInBuffer()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isPersistent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    .line 2
    .line 3
    return p0
.end method

.method public isState(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public parse()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->reset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 9
    .line 10
    const/16 v1, -0xe

    .line 11
    .line 12
    if-ne v0, v1, :cond_3

    .line 13
    .line 14
    :cond_1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gez v0, :cond_1

    .line 23
    .line 24
    :cond_2
    return-void

    .line 25
    :cond_3
    const-string p0, "!START"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public parseAvailable()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-nez v3, :cond_2

    .line 17
    .line 18
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 19
    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-lez v3, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->parseNext()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-lez v3, :cond_1

    .line 33
    .line 34
    move v3, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v3, v1

    .line 37
    :goto_1
    or-int/2addr v0, v3

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return v0
.end method

.method public parseNext()I
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    .line 1
    const-string v2, "chunked"

    const/4 v3, 0x7

    const/4 v4, 0x0

    .line 2
    :try_start_0
    iget v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    if-nez v0, :cond_0

    return v4

    .line 3
    :cond_0
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;
    :try_end_0
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_0 .. :try_end_0} :catch_3

    if-nez v0, :cond_1

    .line 4
    :try_start_1
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v0

    iput-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;
    :try_end_1
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move v6, v4

    goto/16 :goto_3c

    .line 5
    :cond_1
    :goto_0
    :try_start_2
    iget v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I
    :try_end_2
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_2 .. :try_end_2} :catch_3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-ne v0, v5, :cond_2

    :try_start_3
    iget-wide v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    iget-wide v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    cmp-long v0, v7, v9

    if-nez v0, :cond_2

    .line 6
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 7
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0, v7, v8}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V
    :try_end_3
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_3 .. :try_end_3} :catch_0

    return v6

    .line 8
    :cond_2
    :try_start_4
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v0
    :try_end_4
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_4 .. :try_end_4} :catch_3

    const/4 v8, -0x1

    if-nez v0, :cond_c

    .line 9
    :try_start_5
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->fill()I

    move-result v9
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 10
    :try_start_6
    sget-object v0, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    const-string v10, "filled {}/{}"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    iget-object v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v12}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array {v11, v12}, [Ljava/lang/Object;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    const/4 v0, 0x0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    move v9, v8

    .line 11
    :goto_1
    :try_start_7
    sget-object v10, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    if-lez v9, :cond_3

    move v0, v6

    goto/16 :goto_5

    :cond_3
    if-gez v9, :cond_b

    .line 12
    iput-boolean v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    .line 13
    iget v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    if-lez v2, :cond_4

    .line 14
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    if-lez v2, :cond_4

    iget-boolean v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_headResponse:Z

    if-nez v2, :cond_4

    .line 15
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v5

    invoke-interface {v2, v5}, Lorg/eclipse/jetty/io/Buffer;->get(I)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v2

    .line 16
    iget-wide v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v5

    int-to-long v11, v5

    add-long/2addr v9, v11

    iput-wide v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 17
    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    invoke-virtual {v5, v2}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 18
    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v5, v2}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->content(Lorg/eclipse/jetty/io/Buffer;)V

    .line 19
    :cond_4
    iget v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    if-eqz v2, :cond_7

    if-eq v2, v6, :cond_6

    if-eq v2, v3, :cond_7

    .line 20
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 21
    iget-boolean v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_headResponse:Z

    if-nez v2, :cond_5

    .line 22
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v2}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->earlyEOF()V

    .line 23
    :cond_5
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v2, v5, v6}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    goto :goto_3

    .line 24
    :cond_6
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 25
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v2, v5, v6}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    goto :goto_3

    .line 26
    :cond_7
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    :goto_3
    if-nez v0, :cond_a

    .line 27
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->isComplete()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-virtual {v1}, Lorg/eclipse/jetty/http/HttpParser;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_4

    .line 28
    :cond_8
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    invoke-direct {v0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    throw v0

    :cond_9
    :goto_4
    return v8

    .line 29
    :cond_a
    throw v0

    :cond_b
    move v0, v4

    .line 30
    :goto_5
    iget-object v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v9}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v9
    :try_end_7
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_7 .. :try_end_7} :catch_0

    goto :goto_6

    :cond_c
    move v9, v0

    move v0, v4

    .line 31
    :goto_6
    :try_start_8
    iget-object v10, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v10}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    move-result-object v10

    .line 32
    iget v11, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 33
    :goto_7
    iget v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    const/16 v5, 0xd

    const-wide/16 v17, 0x0

    const/16 v13, 0xa

    const/16 v14, 0x20

    if-gez v12, :cond_58

    add-int/lit8 v19, v9, -0x1

    if-lez v9, :cond_58

    if-eq v11, v12, :cond_d

    add-int/lit8 v0, v0, 0x1

    move v11, v12

    .line 34
    :cond_d
    iget-object v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v12}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v12

    .line 35
    iget-byte v15, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B
    :try_end_8
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_8 .. :try_end_8} :catch_3

    if-ne v15, v5, :cond_e

    if-ne v12, v13, :cond_e

    .line 36
    :try_start_9
    iput-byte v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B
    :try_end_9
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_9 .. :try_end_9} :catch_0

    move v4, v8

    goto/16 :goto_26

    .line 37
    :cond_e
    :try_start_a
    iput-byte v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 38
    iget v15, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I
    :try_end_a
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_a .. :try_end_a} :catch_3

    const-wide/16 v22, -0x3

    const-string v4, " "

    move/from16 v24, v6

    const/4 v3, -0x2

    const-string v7, "ISO-8859-1"

    const/16 v6, 0x9

    const/4 v8, -0x5

    packed-switch v15, :pswitch_data_0

    :cond_f
    :goto_8
    :pswitch_0
    const/4 v3, 0x0

    const/4 v4, -0x1

    goto/16 :goto_28

    :pswitch_1
    if-eq v12, v6, :cond_14

    if-eq v12, v13, :cond_10

    if-eq v12, v5, :cond_10

    if-eq v12, v14, :cond_14

    .line 39
    :try_start_b
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    goto :goto_8

    :catch_3
    move-exception v0

    const/4 v6, 0x0

    goto/16 :goto_3c

    .line 40
    :cond_10
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v3, :cond_13

    .line 41
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v3

    if-nez v3, :cond_11

    .line 42
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    goto :goto_9

    .line 43
    :cond_11
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    if-nez v3, :cond_12

    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v7}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    .line 44
    :cond_12
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v6

    iget v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v6, v9

    invoke-virtual {v3, v5, v6}, Lorg/eclipse/jetty/io/View;->update(II)V

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4, v7}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    .line 46
    :cond_13
    :goto_9
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 47
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_8

    .line 48
    :cond_14
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_8

    :pswitch_2
    if-eq v12, v6, :cond_f

    if-eq v12, v13, :cond_16

    if-eq v12, v5, :cond_16

    if-eq v12, v14, :cond_f

    .line 49
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_15

    .line 50
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    .line 51
    :cond_15
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    move-result v3

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    const/4 v4, -0x1

    .line 52
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    .line 53
    :cond_16
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v3, :cond_19

    .line 54
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v3

    if-nez v3, :cond_17

    .line 55
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    goto :goto_a

    .line 56
    :cond_17
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    if-nez v3, :cond_18

    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v7}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    .line 57
    :cond_18
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v6

    iget v9, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v6, v9

    invoke-virtual {v3, v5, v6}, Lorg/eclipse/jetty/io/View;->update(II)V

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4, v7}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    .line 59
    :cond_19
    :goto_a
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 60
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :pswitch_3
    if-eq v12, v6, :cond_1c

    if-eq v12, v13, :cond_1d

    if-eq v12, v5, :cond_1d

    if-eq v12, v14, :cond_1c

    const/16 v4, 0x3a

    if-eq v12, v4, :cond_1a

    const/4 v4, 0x0

    .line 61
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 62
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    goto/16 :goto_8

    .line 63
    :cond_1a
    iget v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v4, :cond_1b

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-nez v4, :cond_1b

    .line 64
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v6

    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jetty/io/View;->update(II)V

    :cond_1b
    const/4 v4, -0x1

    .line 65
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 66
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :cond_1c
    const/4 v3, -0x4

    goto :goto_b

    .line 67
    :cond_1d
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v3, :cond_1e

    .line 68
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    .line 69
    :cond_1e
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 70
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    .line 71
    :goto_b
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :pswitch_4
    if-eq v12, v6, :cond_f

    if-eq v12, v13, :cond_22

    if-eq v12, v5, :cond_22

    if-eq v12, v14, :cond_f

    const/16 v4, 0x3a

    if-eq v12, v4, :cond_20

    const/4 v4, 0x0

    .line 72
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 73
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1f

    .line 74
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    .line 75
    :cond_1f
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    move-result v3

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    const/4 v3, -0x3

    .line 76
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    .line 77
    :cond_20
    iget v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v4, :cond_21

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-nez v4, :cond_21

    .line 78
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v6

    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jetty/io/View;->update(II)V

    :cond_21
    const/4 v4, -0x1

    .line 79
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 80
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    .line 81
    :cond_22
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    if-lez v3, :cond_23

    .line 82
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    .line 83
    :cond_23
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 84
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :pswitch_5
    if-eq v12, v6, :cond_43

    if-eq v12, v14, :cond_43

    const/16 v4, 0x3a

    if-eq v12, v4, :cond_43

    .line 85
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    const/16 v6, 0xcc

    const/16 v8, 0x130

    if-nez v4, :cond_25

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v4

    if-gtz v4, :cond_25

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v4

    if-gtz v4, :cond_25

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    if-eqz v4, :cond_24

    goto :goto_c

    :cond_24
    move v15, v9

    goto/16 :goto_14

    .line 86
    :cond_25
    :goto_c
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-eqz v4, :cond_26

    :goto_d
    const/4 v14, 0x0

    goto :goto_e

    :cond_26
    sget-object v4, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    iget-object v14, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4, v14}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v4

    goto :goto_d

    .line 87
    :goto_e
    iput-object v14, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 88
    iget-object v14, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    if-nez v14, :cond_27

    iget-object v14, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    goto :goto_f

    :cond_27
    new-instance v14, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    iget-object v15, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    invoke-direct {v14, v15}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 89
    :goto_f
    sget-object v15, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    invoke-virtual {v15, v4}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    move-result v15

    if-ltz v15, :cond_35

    move/from16 v3, v24

    if-eq v15, v3, :cond_2f

    move-object/from16 v16, v14

    const/4 v3, 0x5

    if-eq v15, v3, :cond_2b

    const/16 v3, 0xc

    if-eq v15, v3, :cond_29

    :cond_28
    :goto_10
    move v15, v9

    move-object/from16 v14, v16

    goto/16 :goto_13

    :cond_29
    const-wide/16 v20, -0x2

    .line 90
    iget-wide v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    cmp-long v3, v13, v20

    if-eqz v3, :cond_28

    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I
    :try_end_b
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_b .. :try_end_b} :catch_3

    if-eq v3, v8, :cond_28

    if-eq v3, v6, :cond_28

    const/16 v7, 0x64

    if-lt v3, v7, :cond_2a

    const/16 v7, 0xc8

    if-lt v3, v7, :cond_28

    .line 91
    :cond_2a
    :try_start_c
    invoke-static/range {v16 .. v16}, Lorg/eclipse/jetty/io/BufferUtil;->toLong(Lorg/eclipse/jetty/io/Buffer;)J

    move-result-wide v13

    iput-wide v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J
    :try_end_c
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_c} :catch_4
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_c .. :try_end_c} :catch_3

    cmp-long v3, v13, v17

    if-gtz v3, :cond_28

    move-wide/from16 v13, v17

    .line 92
    :try_start_d
    iput-wide v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    goto :goto_10

    :catch_4
    move-exception v0

    .line 93
    sget-object v2, Lorg/eclipse/jetty/http/HttpParser;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-interface {v2, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 94
    new-instance v0, Lorg/eclipse/jetty/http/HttpException;

    const/16 v2, 0x190

    invoke-direct {v0, v2}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    throw v0

    :cond_2b
    const-wide/16 v20, -0x2

    .line 95
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    move-object/from16 v14, v16

    invoke-virtual {v3, v14}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v14

    .line 96
    invoke-virtual {v3, v14}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    move-result v3

    const/4 v13, 0x2

    if-ne v13, v3, :cond_2c

    move v15, v9

    move-wide/from16 v8, v20

    .line 97
    iput-wide v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    goto/16 :goto_13

    :cond_2c
    move v15, v9

    move-wide/from16 v8, v20

    .line 98
    invoke-interface {v14, v7}, Lorg/eclipse/jetty/io/Buffer;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 99
    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2d

    .line 100
    iput-wide v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    goto :goto_13

    .line 101
    :cond_2d
    invoke-virtual {v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_2e

    goto :goto_13

    .line 102
    :cond_2e
    new-instance v0, Lorg/eclipse/jetty/http/HttpException;

    const/16 v2, 0x190

    const/4 v4, 0x0

    invoke-direct {v0, v2, v4}, Lorg/eclipse/jetty/http/HttpException;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_2f
    move v15, v9

    .line 103
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    invoke-virtual {v3, v14}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    move-result v3

    const/4 v7, -0x1

    if-eq v3, v7, :cond_32

    const/4 v7, 0x1

    if-eq v3, v7, :cond_31

    const/4 v8, 0x5

    if-eq v3, v8, :cond_30

    goto :goto_13

    .line 104
    :cond_30
    iput-boolean v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    goto :goto_13

    :cond_31
    const/4 v3, 0x0

    .line 105
    iput-boolean v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    goto :goto_13

    .line 106
    :cond_32
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, ","

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v7, v3

    const/4 v8, 0x0

    :goto_11
    if-ge v8, v7, :cond_36

    aget-object v9, v3, v8

    .line 107
    sget-object v13, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v13, v9}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Ljava/lang/String;)I

    move-result v9

    const/4 v13, 0x1

    if-eq v9, v13, :cond_34

    const/4 v6, 0x5

    if-eq v9, v6, :cond_33

    goto :goto_12

    .line 108
    :cond_33
    iput-boolean v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    goto :goto_12

    :cond_34
    const/4 v6, 0x0

    .line 109
    iput-boolean v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    :goto_12
    add-int/lit8 v8, v8, 0x1

    const/16 v6, 0xcc

    goto :goto_11

    :cond_35
    move v15, v9

    .line 110
    :cond_36
    :goto_13
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v3, v4, v14}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->parsedHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 111
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 112
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    const/4 v4, 0x0

    .line 113
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    .line 114
    :goto_14
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    const/4 v4, -0x1

    invoke-interface {v3, v4}, Lorg/eclipse/jetty/io/Buffer;->setMarkIndex(I)V

    if-eq v12, v5, :cond_38

    const/16 v3, 0xa

    if-ne v12, v3, :cond_37

    goto :goto_15

    :cond_37
    const/4 v7, 0x1

    .line 115
    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 116
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    const/4 v3, -0x4

    .line 117
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    if-eqz v10, :cond_f

    .line 118
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    invoke-virtual {v3, v10, v4, v15}, Lorg/eclipse/jetty/io/BufferCache;->getBest([BII)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    move-result-object v3

    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-eqz v3, :cond_f

    .line 119
    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    move-result v3

    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 120
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    add-int/2addr v4, v5

    invoke-interface {v3, v4}, Lorg/eclipse/jetty/io/Buffer;->setGetIndex(I)V

    .line 121
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v3

    move v9, v3

    const/4 v3, 0x0

    const/4 v4, -0x1

    goto/16 :goto_29

    .line 122
    :cond_38
    :goto_15
    iget-wide v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    cmp-long v0, v6, v22

    if-nez v0, :cond_3b

    .line 123
    iget v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    if-eqz v0, :cond_39

    const/16 v2, 0x130

    if-eq v0, v2, :cond_39

    const/16 v2, 0xcc

    if-eq v0, v2, :cond_39

    const/16 v7, 0xc8

    if-ge v0, v7, :cond_3a

    :cond_39
    const-wide/16 v13, 0x0

    goto :goto_16

    :cond_3a
    const-wide/16 v6, -0x1

    .line 124
    iput-wide v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    :cond_3b
    const-wide/16 v13, 0x0

    goto :goto_17

    .line 125
    :goto_16
    iput-wide v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 126
    :goto_17
    iput-wide v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 127
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    if-ne v12, v5, :cond_3c

    .line 128
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    move-result v0

    const/16 v3, 0xa

    if-ne v0, v3, :cond_3c

    .line 129
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v0

    iput-byte v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 130
    :cond_3c
    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    const-wide/32 v4, 0x7fffffff

    cmp-long v0, v2, v4

    if-lez v0, :cond_3d

    const v0, 0x7fffffff

    :goto_18
    const/4 v2, -0x2

    goto :goto_19

    :cond_3d
    long-to-int v0, v2

    goto :goto_18

    :goto_19
    if-eq v0, v2, :cond_42

    const/4 v4, -0x1

    if-eq v0, v4, :cond_41

    if-eqz v0, :cond_3e

    const/4 v13, 0x2

    .line 131
    iput v13, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 132
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    :goto_1a
    const/16 v24, 0x1

    goto :goto_1d

    .line 133
    :cond_3e
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    .line 134
    iget-boolean v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-nez v0, :cond_40

    iget v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    const/16 v7, 0x64

    if-lt v0, v7, :cond_3f

    const/16 v7, 0xc8

    if-ge v0, v7, :cond_3f

    goto :goto_1b

    :cond_3f
    const/4 v0, 0x7

    goto :goto_1c

    :cond_40
    :goto_1b
    const/4 v0, 0x0

    :goto_1c
    iput v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 135
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    :cond_41
    const/4 v7, 0x1

    .line 136
    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 137
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    goto :goto_1a

    :cond_42
    const/4 v0, 0x3

    .line 138
    iput v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 139
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    goto :goto_1a

    :goto_1d
    return v24

    :cond_43
    const/4 v4, -0x1

    .line 140
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    const/4 v3, -0x2

    .line 141
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :pswitch_6
    if-eq v12, v5, :cond_44

    const/16 v3, 0xa

    if-ne v12, v3, :cond_f

    .line 142
    :cond_44
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I
    :try_end_d
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_d .. :try_end_d} :catch_3

    .line 143
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    if-lez v3, :cond_45

    .line 144
    :try_start_e
    sget-object v3, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v5}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v3

    iget v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->sliceFromMark()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v6

    invoke-virtual {v4, v3, v5, v6}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startResponse(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    goto :goto_1e

    .line 145
    :cond_45
    sget-object v3, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v5}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v3

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    sget-object v6, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v7}, Lorg/eclipse/jetty/io/Buffer;->sliceFromMark()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v6

    invoke-virtual {v4, v3, v5, v6}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    move-object v3, v6

    .line 146
    :goto_1e
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 147
    sget-object v4, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    invoke-virtual {v4, v3}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    move-result v3

    const/16 v4, 0xb

    if-lt v3, v4, :cond_46

    const/4 v3, 0x1

    goto :goto_1f

    :cond_46
    const/4 v3, 0x0

    :goto_1f
    iput-boolean v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    .line 148
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 149
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 150
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    const/4 v4, 0x0

    .line 151
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    :goto_20
    const/4 v4, -0x1

    goto/16 :goto_26

    :pswitch_7
    if-gt v12, v14, :cond_49

    if-gez v12, :cond_47

    goto :goto_21

    :cond_47
    if-ge v12, v14, :cond_f

    .line 152
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I
    :try_end_e
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_e .. :try_end_e} :catch_3

    .line 153
    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    if-lez v3, :cond_48

    .line 154
    :try_start_f
    sget-object v3, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v5}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v3

    iget v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    const/4 v14, 0x0

    invoke-virtual {v4, v3, v5, v14}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startResponse(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 155
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 156
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 157
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 158
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    const/4 v4, 0x0

    .line 159
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    goto/16 :goto_8

    .line 160
    :cond_48
    sget-object v0, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v0

    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    const/4 v14, 0x0

    invoke-virtual {v4, v0, v2, v14}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    const/4 v3, 0x0

    .line 161
    iput-boolean v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    const/4 v2, 0x7

    .line 162
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 163
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    .line 164
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    .line 165
    :cond_49
    :goto_21
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    const/4 v3, -0x6

    .line 166
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_8

    :pswitch_8
    if-ne v12, v14, :cond_4a

    .line 167
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    move-result v5

    const/16 v24, 0x1

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    const/16 v3, -0x9

    .line 168
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_20

    :cond_4a
    if-ge v12, v14, :cond_f

    if-ltz v12, :cond_f

    .line 169
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    sget-object v2, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v2

    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->sliceFromMark()Lorg/eclipse/jetty/io/Buffer;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    const/4 v3, 0x0

    .line 170
    iput-boolean v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    const/4 v2, 0x7

    .line 171
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 172
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->headerComplete()V

    .line 173
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    :pswitch_9
    if-ne v12, v14, :cond_4b

    .line 174
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v4}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v4

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    move-result v5

    const/16 v24, 0x1

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jetty/io/View;->update(II)V

    const/16 v3, -0x9

    .line 175
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto/16 :goto_20

    :cond_4b
    const/16 v4, 0x30

    if-lt v12, v4, :cond_4c

    const/16 v4, 0x39

    if-gt v12, v4, :cond_4c

    .line 176
    iget v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    const/16 v3, 0xa

    mul-int/2addr v4, v3

    add-int/lit8 v12, v12, -0x30

    add-int/2addr v4, v12

    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    goto/16 :goto_20

    :cond_4c
    if-ge v12, v14, :cond_4d

    if-ltz v12, :cond_4d

    .line 177
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    sget-object v4, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v4, v5}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v4

    iget v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    const/4 v14, 0x0

    invoke-virtual {v3, v4, v5, v14}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->startResponse(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 178
    iput-byte v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 179
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 180
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 181
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok1:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    const/4 v4, 0x0

    .line 182
    iput-object v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_multiLineValue:Ljava/lang/String;

    goto/16 :goto_20

    :cond_4d
    const/16 v3, -0xa

    .line 183
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    const/4 v4, -0x1

    .line 184
    iput v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    :cond_4e
    :goto_22
    const/4 v3, 0x0

    goto/16 :goto_28

    :pswitch_a
    const/4 v4, -0x1

    if-gt v12, v14, :cond_51

    if-gez v12, :cond_4f

    goto :goto_24

    :cond_4f
    if-lt v12, v14, :cond_50

    :goto_23
    goto :goto_22

    .line 185
    :cond_50
    new-instance v0, Lorg/eclipse/jetty/http/HttpException;

    const/16 v2, 0x190

    invoke-direct {v0, v2}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    throw v0

    .line 186
    :cond_51
    :goto_24
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v3}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    .line 187
    iget v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    if-ltz v3, :cond_52

    const/16 v3, -0xb

    .line 188
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    add-int/lit8 v12, v12, -0x30

    .line 189
    iput v12, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    goto :goto_22

    :cond_52
    const/16 v3, -0xa

    .line 190
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_22

    :pswitch_b
    const/4 v4, -0x1

    if-ne v12, v14, :cond_54

    .line 191
    iget-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    move-result v5

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    move-result v6

    const/16 v24, 0x1

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v5, v6}, Lorg/eclipse/jetty/io/View;->update(II)V

    .line 192
    sget-object v3, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_tok0:Lorg/eclipse/jetty/io/View$CaseInsensitive;

    invoke-virtual {v3, v5}, Lorg/eclipse/jetty/io/BufferCache;->get(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    move-result-object v3

    if-nez v3, :cond_53

    move v3, v4

    goto :goto_25

    :cond_53
    const/4 v3, 0x0

    :goto_25
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    const/16 v3, -0xc

    .line 193
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    :goto_26
    move v8, v4

    move/from16 v9, v19

    :goto_27
    const/4 v3, 0x7

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    goto/16 :goto_7

    :cond_54
    if-ge v12, v14, :cond_4e

    if-gez v12, :cond_55

    goto :goto_23

    .line 194
    :cond_55
    new-instance v0, Lorg/eclipse/jetty/http/HttpException;

    const/16 v2, 0x190

    invoke-direct {v0, v2}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    throw v0

    :pswitch_c
    move-wide/from16 v5, v22

    const/4 v4, -0x1

    .line 195
    iput-wide v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    const/4 v3, 0x0

    .line 196
    iput-object v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_cached:Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    if-gt v12, v14, :cond_56

    if-gez v12, :cond_57

    .line 197
    :cond_56
    iget-object v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v5}, Lorg/eclipse/jetty/io/Buffer;->mark()V

    const/16 v5, -0xd

    .line 198
    iput v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    :cond_57
    :goto_28
    move/from16 v9, v19

    :goto_29
    move v8, v4

    goto :goto_27

    .line 199
    :cond_58
    iget v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    if-lez v2, :cond_5b

    iget-boolean v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_headResponse:Z

    if-eqz v4, :cond_5b

    .line 200
    iget-boolean v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-nez v4, :cond_5a

    const/16 v7, 0x64

    if-lt v2, v7, :cond_59

    const/16 v7, 0xc8

    if-ge v2, v7, :cond_59

    goto :goto_2a

    :cond_59
    const/4 v2, 0x7

    goto :goto_2b

    :cond_5a
    :goto_2a
    const/4 v2, 0x0

    :goto_2b
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 201
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    invoke-virtual {v2, v6, v7}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    .line 202
    :cond_5b
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    .line 203
    iget v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 204
    :goto_2c
    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    if-lez v6, :cond_79

    if-lez v2, :cond_79

    if-eq v4, v6, :cond_5c

    add-int/lit8 v0, v0, 0x1

    move v4, v6

    .line 205
    :cond_5c
    iget-byte v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    if-ne v6, v5, :cond_5d

    iget-object v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v6}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    move-result v6

    const/16 v3, 0xa

    if-ne v6, v3, :cond_5d

    .line 206
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v2

    iput-byte v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 207
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    goto :goto_2c

    :cond_5d
    const/4 v6, 0x0

    .line 208
    iput-byte v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 209
    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    const/4 v7, 0x6

    packed-switch v6, :pswitch_data_1

    const/16 v3, 0xa

    const/16 v6, 0x30

    const/4 v8, 0x3

    const/16 v9, 0x39

    const/4 v10, 0x5

    const/4 v13, 0x2

    goto/16 :goto_39

    .line 210
    :pswitch_d
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    const/4 v13, 0x2

    if-le v2, v13, :cond_5e

    const/4 v6, 0x0

    .line 211
    iput v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 212
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    goto :goto_2e

    .line 213
    :cond_5e
    :goto_2d
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    if-lez v2, :cond_5f

    .line 214
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v2

    if-nez v2, :cond_5e

    const/4 v6, 0x0

    .line 215
    iput v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 216
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 217
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    goto :goto_2d

    .line 218
    :cond_5f
    :goto_2e
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    const/16 v3, 0xa

    const/16 v6, 0x30

    const/4 v8, 0x3

    :goto_2f
    const/16 v9, 0x39

    :goto_30
    const/4 v10, 0x5

    goto/16 :goto_39

    :pswitch_e
    const/4 v13, 0x2

    .line 219
    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkPosition:I

    sub-int/2addr v6, v7

    if-nez v6, :cond_61

    const/4 v8, 0x3

    .line 220
    iput v8, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    :cond_60
    :goto_31
    const/16 v3, 0xa

    const/16 v6, 0x30

    goto :goto_2f

    :cond_61
    if-le v2, v6, :cond_62

    move v2, v6

    .line 221
    :cond_62
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->get(I)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v0

    .line 222
    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 223
    iget v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkPosition:I

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkPosition:I

    .line 224
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 225
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->content(Lorg/eclipse/jetty/io/Buffer;)V

    const/16 v24, 0x1

    return v24

    :pswitch_f
    const/4 v8, 0x3

    const/4 v13, 0x2

    .line 226
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v2

    if-eq v2, v5, :cond_63

    const/16 v3, 0xa

    if-ne v2, v3, :cond_60

    .line 227
    :cond_63
    iput-byte v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 228
    iget v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    if-nez v6, :cond_66

    if-ne v2, v5, :cond_64

    .line 229
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_64

    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    move-result v0

    const/16 v3, 0xa

    if-ne v0, v3, :cond_64

    .line 230
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v0

    iput-byte v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 231
    :cond_64
    iget-boolean v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-eqz v0, :cond_65

    const/4 v0, 0x0

    goto :goto_32

    :cond_65
    const/4 v0, 0x7

    :goto_32
    iput v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 232
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    .line 233
    :cond_66
    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_31

    :pswitch_10
    const/4 v8, 0x3

    const/4 v13, 0x2

    .line 234
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v2

    if-eq v2, v5, :cond_67

    const/16 v3, 0xa

    if-ne v2, v3, :cond_68

    :cond_67
    const/16 v6, 0x30

    const/16 v9, 0x39

    const/4 v10, 0x5

    goto :goto_36

    :cond_68
    if-le v2, v14, :cond_69

    const/16 v6, 0x3b

    if-ne v2, v6, :cond_6a

    :cond_69
    const/16 v6, 0x30

    const/16 v9, 0x39

    const/4 v10, 0x5

    goto :goto_34

    :cond_6a
    const/16 v6, 0x30

    const/16 v9, 0x39

    if-lt v2, v6, :cond_6b

    if-gt v2, v9, :cond_6b

    .line 235
    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    mul-int/lit8 v7, v7, 0x10

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v7, v2

    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    :goto_33
    const/16 v3, 0xa

    goto/16 :goto_30

    :cond_6b
    const/16 v7, 0x61

    if-lt v2, v7, :cond_6c

    const/16 v7, 0x66

    if-gt v2, v7, :cond_6c

    .line 236
    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    mul-int/lit8 v7, v7, 0x10

    add-int/lit8 v2, v2, -0x57

    add-int/2addr v7, v2

    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    goto :goto_33

    :cond_6c
    const/16 v7, 0x41

    if-lt v2, v7, :cond_6d

    const/16 v7, 0x46

    if-gt v2, v7, :cond_6d

    .line 237
    iget v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    mul-int/lit8 v7, v7, 0x10

    add-int/lit8 v2, v2, -0x37

    add-int/2addr v7, v2

    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    goto :goto_33

    .line 238
    :cond_6d
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad chunk char: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :goto_34
    iput v10, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    :goto_35
    const/16 v3, 0xa

    goto :goto_39

    .line 240
    :goto_36
    iput-byte v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 241
    iget v11, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    if-nez v11, :cond_70

    if-ne v2, v5, :cond_6e

    .line 242
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_6e

    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    move-result v0

    const/16 v3, 0xa

    if-ne v0, v3, :cond_6e

    .line 243
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v0

    iput-byte v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 244
    :cond_6e
    iget-boolean v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-eqz v0, :cond_6f

    const/4 v0, 0x0

    goto :goto_37

    :cond_6f
    const/4 v0, 0x7

    :goto_37
    iput v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 245
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    .line 246
    :cond_70
    iput v7, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_35

    :pswitch_11
    const/16 v6, 0x30

    const/4 v8, 0x3

    const/16 v9, 0x39

    const/4 v10, 0x5

    const/4 v13, 0x2

    .line 247
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    move-result v2

    const/16 v3, 0xa

    if-eq v2, v5, :cond_73

    if-ne v2, v3, :cond_71

    goto :goto_38

    :cond_71
    if-gt v2, v14, :cond_72

    .line 248
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    goto :goto_39

    :cond_72
    const/4 v2, 0x0

    .line 249
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkLength:I

    .line 250
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_chunkPosition:I

    const/4 v2, 0x4

    .line 251
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    goto :goto_39

    .line 252
    :cond_73
    :goto_38
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->get()B

    move-result v2

    iput-byte v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 253
    :goto_39
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    goto/16 :goto_2c

    .line 254
    :pswitch_12
    iget-wide v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    iget-wide v5, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    sub-long/2addr v3, v5

    const-wide/16 v17, 0x0

    cmp-long v0, v3, v17

    if-nez v0, :cond_75

    .line 255
    iget-boolean v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-eqz v0, :cond_74

    const/4 v3, 0x0

    goto :goto_3a

    :cond_74
    const/4 v3, 0x7

    :goto_3a
    iput v3, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 256
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0, v5, v6}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    const/16 v24, 0x1

    return v24

    :cond_75
    int-to-long v5, v2

    cmp-long v0, v5, v3

    if-lez v0, :cond_76

    long-to-int v2, v3

    .line 257
    :cond_76
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->get(I)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v0

    .line 258
    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 259
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 260
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->content(Lorg/eclipse/jetty/io/Buffer;)V

    .line 261
    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    iget-wide v4, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_78

    .line 262
    iget-boolean v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    if-eqz v0, :cond_77

    const/4 v0, 0x0

    goto :goto_3b

    :cond_77
    const/4 v0, 0x7

    :goto_3b
    iput v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 263
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->messageComplete(J)V

    :cond_78
    const/16 v24, 0x1

    return v24

    .line 264
    :pswitch_13
    iget-object v0, v1, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v2

    invoke-interface {v0, v2}, Lorg/eclipse/jetty/io/Buffer;->get(I)Lorg/eclipse/jetty/io/Buffer;

    move-result-object v0

    .line 265
    iget-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 266
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/io/View;->update(Lorg/eclipse/jetty/io/Buffer;)V

    .line 267
    iget-object v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_handler:Lorg/eclipse/jetty/http/HttpParser$EventHandler;

    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;->content(Lorg/eclipse/jetty/io/Buffer;)V
    :try_end_f
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_f .. :try_end_f} :catch_3

    const/16 v24, 0x1

    return v24

    :cond_79
    return v0

    .line 268
    :goto_3c
    iput-boolean v6, v1, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    const/4 v2, 0x7

    .line 269
    iput v2, v1, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 270
    throw v0

    :pswitch_data_0
    .packed-switch -0xe
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
    .end packed-switch
.end method

.method public reset()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentView:Lorg/eclipse/jetty/io/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, -0xe

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 19
    .line 20
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isInputShutdown()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move v0, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 v0, 0x7

    .line 29
    :goto_0
    iput v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 30
    .line 31
    const-wide/16 v2, -0x3

    .line 32
    .line 33
    iput-wide v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    iput-wide v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentPosition:J

    .line 38
    .line 39
    iput v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 40
    .line 41
    iput v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_responseStatus:I

    .line 42
    .line 43
    iget-byte v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 44
    .line 45
    const/16 v1, 0xd

    .line 46
    .line 47
    if-ne v0, v1, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 60
    .line 61
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->peek()B

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/16 v1, 0xa

    .line 66
    .line 67
    if-ne v0, v1, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 70
    .line 71
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->get()B

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-byte v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_eol:B

    .line 76
    .line 77
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 78
    .line 79
    const/4 v1, -0x1

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 89
    .line 90
    if-nez v0, :cond_3

    .line 91
    .line 92
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/io/Buffer;->setMarkIndex(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 100
    .line 101
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->compact()V

    .line 102
    .line 103
    .line 104
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 105
    .line 106
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 111
    .line 112
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-le v0, v2, :cond_4

    .line 117
    .line 118
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 119
    .line 120
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    :cond_4
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 125
    .line 126
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    invoke-interface {v2, v3, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 134
    .line 135
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 136
    .line 137
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    invoke-interface {v2, v4, v0}, Lorg/eclipse/jetty/io/Buffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-interface {v3, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/io/Buffer;->skip(I)I

    .line 150
    .line 151
    .line 152
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 153
    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/io/Buffer;->setMarkIndex(I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 160
    .line 161
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->compact()V

    .line 162
    .line 163
    .line 164
    :cond_6
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 165
    .line 166
    if-eqz v0, :cond_7

    .line 167
    .line 168
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/io/Buffer;->setMarkIndex(I)V

    .line 169
    .line 170
    .line 171
    :cond_7
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 172
    .line 173
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 174
    .line 175
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->returnBuffers()V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public returnBuffers()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 26
    .line 27
    iget-object v4, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 28
    .line 29
    if-ne v3, v4, :cond_0

    .line 30
    .line 31
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 32
    .line 33
    iput-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 34
    .line 35
    :cond_0
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-interface {v0, v4}, Lorg/eclipse/jetty/io/Buffers;->returnBuffer(Lorg/eclipse/jetty/io/Buffer;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iput-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_body:Lorg/eclipse/jetty/io/Buffer;

    .line 41
    .line 42
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_4

    .line 51
    .line 52
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 53
    .line 54
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->markIndex()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ne v0, v1, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffers:Lorg/eclipse/jetty/io/Buffers;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 65
    .line 66
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 67
    .line 68
    if-ne v1, v3, :cond_3

    .line 69
    .line 70
    iput-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 71
    .line 72
    :cond_3
    invoke-interface {v0, v3}, Lorg/eclipse/jetty/io/Buffers;->returnBuffer(Lorg/eclipse/jetty/io/Buffer;)V

    .line 73
    .line 74
    .line 75
    iput-object v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 76
    .line 77
    :cond_4
    return-void
.end method

.method public setForceContentBuffer(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_forceContentBuffer:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHeadResponse(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_headResponse:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPersistent(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_persistent:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/16 v0, -0xe

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x7

    .line 14
    iput p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public setState(I)V
    .locals 2

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 2
    .line 3
    const-wide/16 v0, -0x3

    .line 4
    .line 5
    iput-wide v0, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    .line 6
    .line 7
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-wide v3, p0, Lorg/eclipse/jetty/http/HttpParser;->_contentLength:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "%s{s=%d,l=%d,c=%d}"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "state="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lorg/eclipse/jetty/http/HttpParser;->_state:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " length="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lorg/eclipse/jetty/http/HttpParser;->_length:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, " buf="

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
