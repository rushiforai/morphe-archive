.class public final Lp0c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbqe;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Li7f;

.field public d:Ll0c;

.field public final e:Lud7;

.field public final f:Ls9;


# direct methods
.method public constructor <init>(Lbqe;Lcom/opera/android/settings/SettingsManager;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lp0c;->c:Li7f;

    new-instance v0, Lud7;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lud7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lp0c;->e:Lud7;

    new-instance v1, Ls9;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lp0c;->f:Ls9;

    iput-object p1, p0, Lp0c;->a:Lbqe;

    iput-object p2, p0, Lp0c;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lno7;->g(Lmo7;)V

    invoke-virtual {p2, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lp0c;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->v()Ll0c;

    move-result-object v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lp0c;->a:Lbqe;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcqe;

    iget-object v0, v0, Lcqe;->a:Ll0c;

    :cond_12
    iget-object v1, p0, Lp0c;->d:Ll0c;

    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    iput-object v0, p0, Lp0c;->d:Ll0c;

    iget-object v0, p0, Lp0c;->c:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_22
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo0c;

    iget-object v2, p0, Lp0c;->d:Ll0c;

    invoke-interface {v1, v2}, Lo0c;->p(Ll0c;)V

    goto :goto_22

    :cond_34
    return-void
.end method
