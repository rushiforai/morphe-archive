.class public final Ll/tfs$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tfs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tfs$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/tfs$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/tfs$a;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/tfs$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/tfs$a;->e:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Ll/tfs$a;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/tfs$a;->g:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/tfs$a;->h:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Ll/tfs$a;->i:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Ll/rfs;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ll/tfs$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ll/tfs;
    .locals 2

    .line 1
    new-instance v0, Ll/tfs;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tfs;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/tfs$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/tfs;->e(Ll/tfs;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/tfs$a;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/tfs;->g(Ll/tfs;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/tfs$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/tfs;->b(Ll/tfs;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/tfs$a;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/tfs;->c(Ll/tfs;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/tfs$a;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/tfs;->i(Ll/tfs;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/tfs$a;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/tfs;->h(Ll/tfs;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/tfs$a;->i:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/tfs;->a(Ll/tfs;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/tfs$a;->f:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/tfs;->d(Ll/tfs;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/tfs$a;->g:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, p0}, Ll/tfs;->f(Ll/tfs;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public b(Ll/oo2;Z)Ll/tfs$a;
    .locals 3

    .line 1
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v0, ""

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0, v0}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 40
    .line 41
    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)Ll/tfs$a;
    .locals 1

    .line 1
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "liveMessage"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, "NA"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p2}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 50
    .line 51
    .line 52
    :cond_1
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/tfs$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/tfs$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/tfs$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;
    .locals 1

    .line 1
    const-string v0, "onlive"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "onLive"

    .line 10
    .line 11
    iput-object p1, p0, Ll/tfs$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p1, "endLive"

    .line 15
    .line 16
    iput-object p1, p0, Ll/tfs$a;->f:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/tfs$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/tfs$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tfs$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
