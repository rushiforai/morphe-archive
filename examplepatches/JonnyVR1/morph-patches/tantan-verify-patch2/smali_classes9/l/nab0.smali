.class public Ll/nab0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nab0$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/x3m;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Ll/oab0;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ll/nab0;-><init>()V

    return-void
.end method

.method public static a()Ll/nab0;
    .locals 1

    .line 1
    invoke-static {}, Ll/nab0$a;->a()Ll/nab0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/nab0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public c(Landroid/app/Dialog;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->PURCHASE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->setDialogShown(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/x3m;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/x3m;->a(Landroid/app/Dialog;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-boolean v1, p0, Ll/nab0;->b:Z

    .line 30
    .line 31
    return-void
.end method

.method public d(Landroid/app/Dialog;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->PURCHASE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->setDialogShown(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/x3m;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/x3m;->b(Landroid/app/Dialog;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-boolean v1, p0, Ll/nab0;->b:Z

    .line 30
    .line 31
    return-void
.end method

.method public e(Ll/x3m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/x3m;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/nab0;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
