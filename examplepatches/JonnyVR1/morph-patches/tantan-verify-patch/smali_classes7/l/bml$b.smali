.class public abstract Ll/bml$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "b"
.end annotation


# instance fields
.field public final a:Lokio/ForwardingTimeout;

.field public b:Z

.field public final synthetic c:Ll/bml;


# direct methods
.method public constructor <init>(Ll/bml;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/bml$b;->c:Ll/bml;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lokio/ForwardingTimeout;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bml;->m(Ll/bml;)Lokio/BufferedSource;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {v0, p1}, Lokio/ForwardingTimeout;-><init>(Lokio/Timeout;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/bml$b;->a:Lokio/ForwardingTimeout;

    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Ll/bml;Ll/bml$a;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Ll/bml$b;-><init>(Ll/bml;)V

    return-void
.end method


# virtual methods
.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bml$b;->c:Ll/bml;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bml;->k(Ll/bml;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x6

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/bml$b;->c:Ll/bml;

    .line 12
    .line 13
    invoke-static {v0}, Ll/bml;->k(Ll/bml;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v2, p0, Ll/bml$b;->c:Ll/bml;

    .line 18
    .line 19
    const/4 v3, 0x5

    .line 20
    if-ne v0, v3, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/bml$b;->a:Lokio/ForwardingTimeout;

    .line 23
    .line 24
    invoke-static {v2, v0}, Ll/bml;->j(Ll/bml;Lokio/ForwardingTimeout;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/bml$b;->c:Ll/bml;

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/bml;->l(Ll/bml;I)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p0, "state: "

    .line 34
    .line 35
    invoke-static {v2}, Ll/bml;->k(Ll/bml;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {p0, v0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public read(Lokio/Buffer;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/bml$b;->c:Ll/bml;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bml;->m(Ll/bml;)Lokio/BufferedSource;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-wide p0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    iget-object p2, p0, Ll/bml$b;->c:Ll/bml;

    .line 14
    .line 15
    invoke-static {p2}, Ll/bml;->n(Ll/bml;)Ll/imc0;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ll/imc0;->t()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/bml$b;->k()V

    .line 23
    .line 24
    .line 25
    throw p1
.end method

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml$b;->a:Lokio/ForwardingTimeout;

    .line 2
    .line 3
    return-object p0
.end method
