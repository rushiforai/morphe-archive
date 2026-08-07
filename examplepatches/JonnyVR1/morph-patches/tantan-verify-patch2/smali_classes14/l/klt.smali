.class public Ll/klt;
.super Ll/l6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/l6t<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/imt;


# direct methods
.method public constructor <init>(Ll/ner;Ll/imt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l6t;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/klt;->e:Ll/imt;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/klt;->e:Ll/imt;

    .line 2
    .line 3
    iget-object p0, p0, Ll/imt;->a:Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 4
    .line 5
    return-object p0
.end method

.method public E2()Ll/imt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/klt;->e:Ll/imt;

    .line 2
    .line 3
    return-object p0
.end method

.method public F2()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/uwl;

    .line 27
    .line 28
    instance-of v1, v0, Ll/mus;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    :try_start_0
    check-cast v0, Ll/mus;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/mus;->M2()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/klt;->e:Ll/imt;

    .line 2
    .line 3
    iget-object p0, p0, Ll/imt;->b:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
