.class public Ll/tx6;
.super Ll/dy6;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a3()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const-string v1, "-10021"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->qf(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic b3(Ll/tx6;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx6;->d3(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public c3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "DbCheck"

    .line 2
    .line 3
    const-string v1, "deleteAiStory step 1"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 9
    .line 10
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/rx6;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/rx6;-><init>(Ll/tx6;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic d3(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string p1, "DbCheck"

    .line 2
    .line 3
    const-string v0, "deleteAiStory step 2"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    const-string v0, "-10021"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Mo(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 27
    .line 28
    new-instance p1, Ll/sx6;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/sx6;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/fy6;->a(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0
.end method
