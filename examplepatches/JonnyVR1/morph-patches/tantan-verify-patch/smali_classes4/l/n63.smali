.class public abstract Ll/n63;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Ll/sa3;

.field public c:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/na3;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/sa3;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/sa3;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/n63;->b:Ll/sa3;

    .line 5
    .line 6
    iput-object p1, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/n63;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/n63;->e()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/n63;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n63;->i(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic b(Ll/n63;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n63;->h(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public c(Ll/na3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n63;->d:Ll/na3;

    .line 2
    .line 3
    return-void
.end method

.method public abstract d()V
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/l63;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/l63;-><init>(Ll/n63;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n63;->f()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/n63;->d()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/m63;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/m63;-><init>(Ll/n63;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n63;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/n63;->c:Ll/pcj;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public abstract k(Ll/pcj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public l(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/n63;->c:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method

.method public abstract m(Landroid/widget/FrameLayout;Landroid/view/View;)V
.end method

.method public abstract n(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract o(Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V
.end method

.method public abstract p(Z)V
.end method
