.class public final Ll/bml$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "f"
.end annotation


# instance fields
.field public final a:Lokio/ForwardingTimeout;

.field public b:Z

.field public final synthetic c:Ll/bml;


# direct methods
.method public constructor <init>(Ll/bml;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/bml$f;->c:Ll/bml;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lokio/ForwardingTimeout;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bml;->i(Ll/bml;)Lokio/BufferedSink;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lokio/Sink;->timeout()Lokio/Timeout;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v0, p1}, Lokio/ForwardingTimeout;-><init>(Lokio/Timeout;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/bml$f;->a:Lokio/ForwardingTimeout;

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Ll/bml;Ll/bml$a;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Ll/bml$f;-><init>(Ll/bml;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/bml$f;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/bml$f;->b:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/bml$f;->c:Ll/bml;

    .line 10
    .line 11
    iget-object v1, p0, Ll/bml$f;->a:Lokio/ForwardingTimeout;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bml;->j(Ll/bml;Lokio/ForwardingTimeout;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/bml$f;->c:Ll/bml;

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    invoke-static {p0, v0}, Ll/bml;->l(Ll/bml;I)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/bml$f;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/bml$f;->c:Ll/bml;

    .line 7
    .line 8
    invoke-static {p0}, Ll/bml;->i(Ll/bml;)Lokio/BufferedSink;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lokio/BufferedSink;->flush()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml$f;->a:Lokio/ForwardingTimeout;

    .line 2
    .line 3
    return-object p0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/bml$f;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    move-wide v5, p2

    .line 12
    invoke-static/range {v1 .. v6}, Ll/zlk0;->f(JJJ)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/bml$f;->c:Ll/bml;

    .line 16
    .line 17
    invoke-static {p0}, Ll/bml;->i(Ll/bml;)Lokio/BufferedSink;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0, p1, v5, v6}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "closed"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
