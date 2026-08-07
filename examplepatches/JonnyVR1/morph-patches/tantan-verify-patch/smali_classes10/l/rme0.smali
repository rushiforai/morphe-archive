.class public abstract Ll/rme0;
.super Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;
.source "SourceFile"


# instance fields
.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rme0;->d:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d()Ll/yc60;
    .locals 2

    .line 1
    new-instance v0, Ll/eh3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eh3;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->c()Ll/smc0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/smc0;->h()Ll/ndm;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/ndm;->a()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/yc60;->f(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/rme0;->d:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Ll/rme0;->g(Ll/eh3;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public e()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/smc0;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/umc0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/umc0;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    move-object v5, p0

    .line 34
    invoke-virtual/range {v0 .. v5}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p0, v0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public abstract g(Ll/eh3;Ljava/lang/Object;)V
.end method
