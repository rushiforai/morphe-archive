.class public final Ljvc;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Ldue;


# instance fields
.field private final a:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lfqe;

.field public final d:Lfue;

.field public final e:Lx5f;

.field public f:Lnre;

.field public g:Lcue;

.field public h:Lch0;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lfqe;Lfue;Lx5f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxy;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lxy;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ljvc;->a:Lq8j;

    iput-object p1, p0, Ljvc;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ljvc;->c:Lfqe;

    iput-object p3, p0, Ljvc;->d:Lfue;

    iput-object p4, p0, Ljvc;->e:Lx5f;

    return-void
.end method

.method public static bridge synthetic R(Ljvc;)Lq8j;
    .registers 1

    iget-object p0, p0, Ljvc;->a:Lq8j;

    return-object p0
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_newsfeed"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Ljvc;->S()V

    :cond_b
    return-void
.end method

.method public final S()V
    .registers 3

    iget-object v0, p0, Ljvc;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Ljvc;->g:Lcue;

    sget-object v1, Lcue;->c:Lcue;

    if-ne v0, v1, :cond_23

    iget-boolean v0, p0, Ljvc;->i:Z

    if-nez v0, :cond_23

    iget-object v0, p0, Ljvc;->c:Lfqe;

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    iget-object v1, p0, Ljvc;->a:Lq8j;

    invoke-virtual {v0, v1}, Luqe;->g(Lq8j;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljvc;->i:Z

    return-void

    :cond_23
    invoke-virtual {p0}, Ljvc;->T()V

    return-void
.end method

.method public final T()V
    .registers 7

    iget-object v0, p0, Ljvc;->g:Lcue;

    sget-object v1, Lcue;->c:Lcue;

    if-ne v0, v1, :cond_58

    iget-object v0, p0, Ljvc;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ljvc;->f:Lnre;

    if-eqz v0, :cond_55

    iget-object v0, v0, Lnre;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_55

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyqe;

    invoke-virtual {v1}, Lyqe;->a()Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v0, p0, Ljvc;->f:Lnre;

    iget-object v0, v0, Lnre;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_52

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyqe;

    invoke-virtual {v1}, Lyqe;->a()Z

    move-result v1

    if-eqz v1, :cond_34

    iget-object v0, p0, Ljvc;->f:Lnre;

    iget-boolean v0, v0, Lnre;->h:Z

    if-eqz v0, :cond_4f

    sget-object v0, Lch0;->e:Lch0;

    goto :goto_5a

    :cond_4f
    sget-object v0, Lch0;->d:Lch0;

    goto :goto_5a

    :cond_52
    sget-object v0, Lch0;->f:Lch0;

    goto :goto_5a

    :cond_55
    sget-object v0, Lch0;->c:Lch0;

    goto :goto_5a

    :cond_58
    sget-object v0, Lch0;->b:Lch0;

    :goto_5a
    iget-object v1, p0, Ljvc;->h:Lch0;

    if-ne v0, v1, :cond_5f

    return-void

    :cond_5f
    iget-object v1, p0, Ljvc;->e:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_7b

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v4, 0x3b

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    :cond_7b
    iput-object v0, p0, Ljvc;->h:Lch0;

    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Ljvc;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p0, Ljvc;->d:Lfue;

    invoke-virtual {p1}, Lfue;->d()V

    iget-object v0, p1, Lfue;->a:Lcue;

    iput-object v0, p0, Ljvc;->g:Lcue;

    invoke-virtual {p1, p0}, Lfue;->b(Ldue;)V

    invoke-virtual {p0}, Ljvc;->S()V

    return-void
.end method

.method public final b(Lcue;)V
    .registers 2

    iput-object p1, p0, Ljvc;->g:Lcue;

    invoke-virtual {p0}, Ljvc;->S()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Ljvc;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object p1, p0, Ljvc;->d:Lfue;

    invoke-virtual {p1, p0}, Lfue;->e(Ldue;)V

    return-void
.end method
