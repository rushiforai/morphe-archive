.class public Ll/nsv;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Ll/pyl;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 5
    .line 6
    instance-of v0, p1, Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iput-object p1, p0, Ll/nsv;->b:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static f(Ljava/lang/Object;)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/nsv;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/nsv;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nsv;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/nsv;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 5
    .line 6
    return-object p0
.end method

.method public c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            "Z)",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l6o0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p3}, Ll/l6o0;-><init>(Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ll/l6o0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/l6o0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/nsv;->d(Ll/pyl;)Ll/nsv;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public d(Ll/pyl;)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pyl;",
            ")",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/nsv;->c:Ll/pyl;

    .line 5
    .line 6
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ")",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e3t;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/e3t;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nsv;->d(Ll/pyl;)Ll/nsv;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public g()Ll/pyl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->c:Ll/pyl;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-object p0
.end method
