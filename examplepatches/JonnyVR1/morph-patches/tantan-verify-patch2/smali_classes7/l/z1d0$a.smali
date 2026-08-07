.class public final Ll/z1d0$a;
.super Ll/z1d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z1d0;->create(Ll/e7y;Lokio/ByteString;)Ll/z1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e7y;

.field public final synthetic b:Lokio/ByteString;


# direct methods
.method public constructor <init>(Ll/e7y;Lokio/ByteString;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1d0$a;->a:Ll/e7y;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z1d0$a;->b:Lokio/ByteString;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/z1d0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z1d0$a;->b:Lokio/ByteString;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/ByteString;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1d0$a;->a:Ll/e7y;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z1d0$a;->b:Lokio/ByteString;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 4
    .line 5
    .line 6
    return-void
.end method
