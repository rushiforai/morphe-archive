.class public final Lep3;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lpp3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lpp3;Lw6j;)V
    .registers 5

    invoke-direct {p0, p1, p2, p4}, Lr22;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;)V

    iput-object p3, p0, Lep3;->e:Lpp3;

    return-void
.end method


# virtual methods
.method public final M(I)V
    .registers 4

    invoke-super {p0, p1}, Lr22;->M(I)V

    iget-object p0, p0, Lep3;->e:Lpp3;

    iget-object v0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast v0, Lgbf;

    iget-object v0, v0, Lgbf;->p:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz3;

    invoke-interface {v1}, Lcz3;->a()V

    goto :goto_f

    :cond_1f
    int-to-float p1, p1

    iget-object p0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_28
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, p1}, Ly43;->p(F)V

    goto :goto_28

    :cond_38
    return-void
.end method
