.class public Ll/nod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u4f;


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
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0
    .param p1    # Lcom/tantanapp/beatles/v2/data/MonitorEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->needSendSync()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/a5f;->r(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Ll/a5f;->q(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public b(Ljava/lang/String;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5f;->s(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public c(Lcom/tantanapp/beatles/v2/data/MonitorEvent;Ll/k5f;)V
    .locals 0
    .param p1    # Lcom/tantanapp/beatles/v2/data/MonitorEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/k5f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5f;->k()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->addProcessors(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->addProcessor(Ll/k5f;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isNeedLogcatProcessor()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ll/ozv;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ll/ozv;-><init>(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->addProcessor(Ll/k5f;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getThrowable()Ljava/lang/Throwable;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/h6f;->c()Ll/h6f;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->addProcessor(Ll/k5f;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method
