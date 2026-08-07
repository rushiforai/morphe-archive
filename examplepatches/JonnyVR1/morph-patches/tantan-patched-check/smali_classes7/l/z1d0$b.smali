.class public final Ll/z1d0$b;
.super Ll/z1d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z1d0;->create(Ll/e7y;[BII)Ll/z1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e7y;

.field public final synthetic b:I

.field public final synthetic c:[B

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Ll/e7y;I[BI)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1d0$b;->a:Ll/e7y;

    .line 2
    .line 3
    iput p2, p0, Ll/z1d0$b;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/z1d0$b;->c:[B

    .line 6
    .line 7
    iput p4, p0, Ll/z1d0$b;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Ll/z1d0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget p0, p0, Ll/z1d0$b;->b:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1d0$b;->a:Ll/e7y;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z1d0$b;->c:[B

    .line 2
    .line 3
    iget v1, p0, Ll/z1d0$b;->d:I

    .line 4
    .line 5
    iget p0, p0, Ll/z1d0$b;->b:I

    .line 6
    .line 7
    invoke-interface {p1, v0, v1, p0}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 8
    .line 9
    .line 10
    return-void
.end method
