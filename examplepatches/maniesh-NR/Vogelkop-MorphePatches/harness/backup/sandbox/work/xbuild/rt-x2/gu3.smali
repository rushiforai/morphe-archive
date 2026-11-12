.class public final Lgu3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgu3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final a(Lq35;)V
    .registers 2
    .annotation runtime Lvkk;
    .end annotation

    sget-object p0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {}, LJ/N;->MNGS_Lnv()V

    return-void
.end method

.method public final b(Lx55;)V
    .registers 6
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Lgu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez p0, :cond_7

    const/4 p0, 0x0

    :cond_7
    iget p1, p0, Lk6l;->n:I

    iget-object v0, p0, Lk6l;->b:Ljava/util/ArrayList;

    if-eqz p1, :cond_6c

    iget-object p1, p0, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_6c

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_2c

    iget-object p1, p0, Lk6l;->v:Lu7k;

    iget-object v2, p0, Lk6l;->o:Lb2l;

    sget-object v3, Lu3l;->a:Ls3l;

    invoke-virtual {p1, v2, v3}, Lu7k;->n(Lb2l;Lu3l;)Lb2l;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, v1}, Lk6l;->C(Lb2l;I)V

    :cond_2c
    :goto_2c
    iget p1, p0, Lk6l;->n:I

    if-lez p1, :cond_4c

    invoke-static {v1, v0}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    iget-object v2, p0, Lk6l;->c:Ljava/util/HashMap;

    move-object v3, p1

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, v1}, Lk6l;->y(Lb2l;Z)V

    goto :goto_2c

    :cond_4c
    iget-object p1, p0, Lk6l;->q:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_52
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj6l;

    :try_start_5e
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    iget v2, p0, Lk6l;->n:I

    invoke-interface {v1, v2}, Lj6l;->d(I)V
    :try_end_66
    .catch Ljava/lang/RuntimeException; {:try_start_5e .. :try_end_66} :catch_67

    goto :goto_52

    :catch_67
    move-exception v1

    invoke-static {v1}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_52

    :cond_6c
    return-void
.end method

.method public final c(Lm35;)V
    .registers 4
    .param p1    # Lm35;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-boolean v0, p1, Lm35;->a:Z

    iget-object p1, p1, Lm35;->b:Ljava/lang/Runnable;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lgu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/BrowserActivity;->l0(ZLjava/lang/Runnable;)V

    return-void
.end method
