.class public Ll/q2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/asf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/asf;


# direct methods
.method public constructor <init>(Ll/asf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q2j;->a:Ll/asf;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b([BIIZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Ll/asf;->b([BIIZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c([BII)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/asf;->c([BII)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/asf;->f([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g([BIIZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Ll/asf;->g([BIIZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLength()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/asf;->getLength()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/asf;->getPosition()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/asf;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/asf;->k()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public m(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/asf;->m(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/asf;->o(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(IZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/asf;->p(IZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public read([BII)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/asf;->read([BII)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public readFully([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/asf;->readFully([BII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public skip(I)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q2j;->a:Ll/asf;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/asf;->skip(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
