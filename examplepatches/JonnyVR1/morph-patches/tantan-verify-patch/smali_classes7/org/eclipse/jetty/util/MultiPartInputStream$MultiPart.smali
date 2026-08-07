.class public Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qg60;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/MultiPartInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MultiPart"
.end annotation


# instance fields
.field protected _bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

.field protected _contentType:Ljava/lang/String;

.field protected _file:Ljava/io/File;

.field protected _filename:Ljava/lang/String;

.field protected _headers:Lorg/eclipse/jetty/util/MultiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jetty/util/MultiMap<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected _name:Ljava/lang/String;

.field protected _out:Ljava/io/OutputStream;

.field protected _size:J

.field protected _temporary:Z

.field final synthetic this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/util/MultiPartInputStream;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_temporary:Z

    .line 12
    .line 13
    iput-object p2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_name:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_filename:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_temporary:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public createFile()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    .line 4
    .line 5
    const-string v1, "MultiPart"

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-static {v1, v2, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 14
    .line 15
    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 16
    .line 17
    iget-boolean v1, v1, Lorg/eclipse/jetty/util/MultiPartInputStream;->_deleteOnExit:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ljava/io/FileOutputStream;

    .line 25
    .line 26
    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 34
    .line 35
    .line 36
    iget-wide v2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 37
    .line 38
    const-wide/16 v4, 0x0

    .line 39
    .line 40
    cmp-long v0, v2, v4

    .line 41
    .line 42
    if-lez v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 63
    .line 64
    :cond_1
    iput-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 65
    .line 66
    return-void
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public getBytes()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getContentDispositionFilename()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_filename:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_contentType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFile()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_headers:Lorg/eclipse/jetty/util/MultiMap;

    .line 6
    .line 7
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/util/MultiMap;->getValue(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public getHeaderNames()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_headers:Lorg/eclipse/jetty/util/MultiMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_headers:Lorg/eclipse/jetty/util/MultiMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/MultiMap;->getValues(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 6
    .line 7
    new-instance v1, Ljava/io/FileInputStream;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 21
    .line 22
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-direct {v0, v1, v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public open()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_filename:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->createFile()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 20
    .line 21
    invoke-direct {v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 25
    .line 26
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 27
    .line 28
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_contentType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHeaders(Lorg/eclipse/jetty/util/MultiMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jetty/util/MultiMap<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_headers:Lorg/eclipse/jetty/util/MultiMap;

    .line 2
    .line 3
    return-void
.end method

.method public write(I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    invoke-virtual {v0}, Ll/lu10;->c()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const-wide/16 v1, 0x1

    if-lez v0, :cond_1

    iget-wide v3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    add-long/2addr v3, v1

    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    invoke-virtual {v0}, Ll/lu10;->c()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-gtz v0, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_name:Ljava/lang/String;

    const-string p1, " exceeds max filesize"

    const-string v0, "Multipart Mime part "

    invoke-static {v0, p0, p1}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 90
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    invoke-virtual {v0}, Ll/lu10;->a()I

    move-result v0

    if-lez v0, :cond_2

    iget-wide v3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    add-long/2addr v3, v1

    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    invoke-virtual {v0}, Ll/lu10;->a()I

    move-result v0

    int-to-long v5, v0

    cmp-long v0, v3, v5

    if-lez v0, :cond_2

    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    if-nez v0, :cond_2

    .line 91
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->createFile()V

    .line 92
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 93
    iget-wide v3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 95
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_temporary:Z

    .line 96
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v1, v1, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    const/4 p1, 0x0

    .line 97
    :try_start_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 98
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 99
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 101
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    return-void

    :catchall_0
    move-exception v1

    goto :goto_0

    :catchall_1
    move-exception v1

    move-object v0, p1

    :goto_0
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 103
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    throw v1

    .line 104
    :cond_1
    iput-boolean v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_temporary:Z

    .line 105
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    iget-object v1, v1, Lorg/eclipse/jetty/util/MultiPartInputStream;->_tmpDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 106
    iget-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 107
    iput-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    :cond_2
    return-void
.end method

.method public write([BII)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lu10;->c()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 16
    .line 17
    int-to-long v2, p3

    .line 18
    add-long/2addr v0, v2

    .line 19
    iget-object v2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 20
    .line 21
    iget-object v2, v2, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/lu10;->c()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    cmp-long v0, v0, v2

    .line 28
    .line 29
    if-gtz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_name:Ljava/lang/String;

    .line 33
    .line 34
    const-string p1, " exceeds max filesize"

    .line 35
    .line 36
    const-string p2, "Multipart Mime part "

    .line 37
    .line 38
    invoke-static {p2, p0, p1}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 43
    .line 44
    iget-object v0, v0, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/lu10;->a()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-lez v0, :cond_2

    .line 51
    .line 52
    iget-wide v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 53
    .line 54
    int-to-long v2, p3

    .line 55
    add-long/2addr v0, v2

    .line 56
    iget-object v2, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 57
    .line 58
    iget-object v2, v2, Lorg/eclipse/jetty/util/MultiPartInputStream;->_config:Ll/lu10;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/lu10;->a()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    int-to-long v2, v2

    .line 65
    cmp-long v0, v0, v2

    .line 66
    .line 67
    if-lez v0, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_file:Ljava/io/File;

    .line 70
    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->createFile()V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_out:Ljava/io/OutputStream;

    .line 77
    .line 78
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 79
    .line 80
    .line 81
    iget-wide p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 82
    .line 83
    int-to-long v0, p3

    .line 84
    add-long/2addr p1, v0

    .line 85
    iput-wide p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$MultiPart;->_size:J

    .line 86
    .line 87
    return-void
.end method
