.class Lorg/eclipse/jetty/util/IO$Job;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/IO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Job"
.end annotation


# instance fields
.field in:Ljava/io/InputStream;

.field out:Ljava/io/OutputStream;

.field read:Ljava/io/Reader;

.field write:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/IO$Job;->in:Ljava/io/InputStream;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/util/IO$Job;->out:Ljava/io/OutputStream;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/util/IO$Job;->read:Ljava/io/Reader;

    .line 10
    .line 11
    iput-object p1, p0, Lorg/eclipse/jetty/util/IO$Job;->write:Ljava/io/Writer;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/io/Writer;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lorg/eclipse/jetty/util/IO$Job;->in:Ljava/io/InputStream;

    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/util/IO$Job;->out:Ljava/io/OutputStream;

    .line 17
    iput-object p1, p0, Lorg/eclipse/jetty/util/IO$Job;->read:Ljava/io/Reader;

    .line 18
    iput-object p2, p0, Lorg/eclipse/jetty/util/IO$Job;->write:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/IO$Job;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v3, p0, Lorg/eclipse/jetty/util/IO$Job;->out:Ljava/io/OutputStream;

    .line 8
    .line 9
    invoke-static {v0, v3, v1, v2}, Lorg/eclipse/jetty/util/IO;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/IO$Job;->read:Ljava/io/Reader;

    .line 16
    .line 17
    iget-object v3, p0, Lorg/eclipse/jetty/util/IO$Job;->write:Ljava/io/Writer;

    .line 18
    .line 19
    invoke-static {v0, v3, v1, v2}, Lorg/eclipse/jetty/util/IO;->copy(Ljava/io/Reader;Ljava/io/Writer;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :goto_0
    invoke-static {}, Lorg/eclipse/jetty/util/IO;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jetty/util/IO$Job;->out:Ljava/io/OutputStream;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/util/IO$Job;->write:Ljava/io/Writer;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/io/Writer;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catch_1
    move-exception p0

    .line 46
    invoke-static {}, Lorg/eclipse/jetty/util/IO;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    :goto_1
    return-void
.end method
