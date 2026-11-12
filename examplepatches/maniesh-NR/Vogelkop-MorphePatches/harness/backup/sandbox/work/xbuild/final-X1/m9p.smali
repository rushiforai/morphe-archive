.class public final Lm9p;
.super Ljava/io/FilterOutputStream;
.source "SourceFile"


# instance fields
.field public final synthetic a:Leyi;


# direct methods
.method public constructor <init>(Leyi;Ljava/io/FileOutputStream;)V
    .registers 3

    iput-object p1, p0, Lm9p;->a:Leyi;

    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    iget-object p0, p0, Lm9p;->a:Leyi;

    const/4 v0, 0x1

    iput-boolean v0, p0, Leyi;->b:Z

    return-void
.end method

.method public final flush()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    iget-object p0, p0, Lm9p;->a:Leyi;

    const/4 v0, 0x1

    iput-boolean v0, p0, Leyi;->b:Z

    return-void
.end method

.method public final write(I)V
    .registers 3

    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    iget-object p0, p0, Lm9p;->a:Leyi;

    const/4 p1, 0x1

    iput-boolean p1, p0, Leyi;->b:Z

    return-void
.end method

.method public final write([BII)V
    .registers 5

    .line 12
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    iget-object p0, p0, Lm9p;->a:Leyi;

    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Leyi;->b:Z

    return-void
.end method
