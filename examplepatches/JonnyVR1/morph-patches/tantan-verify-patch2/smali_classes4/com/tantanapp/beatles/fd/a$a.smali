.class public Lcom/tantanapp/beatles/fd/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/fd/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/fd/a;->a()Ll/ulg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 8
    .line 9
    new-instance v2, Lcom/tantanapp/beatles/fd/FdException;

    .line 10
    .line 11
    invoke-direct {v2}, Lcom/tantanapp/beatles/fd/FdException;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "exception"

    .line 15
    .line 16
    const-string v4, "fdSize"

    .line 17
    .line 18
    invoke-direct {v1, v3, v4, v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "fdinfo"

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ulg;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v2, v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/uu2;->h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {}, Lcom/tantanapp/beatles/fd/a;->b()Ll/tlg;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/tlg;->a()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-static {p0, v0, v1}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
