.class public final Lb7l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ld7l;


# direct methods
.method public constructor <init>(Ld7l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb7l;->a:Ld7l;

    return-void
.end method


# virtual methods
.method public final a(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 6

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    iget-object p0, p0, Lb7l;->a:Ld7l;

    if-eqz v0, :cond_4d

    invoke-virtual {p0}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    check-cast v0, Liuh;

    iget-object v1, v0, Liuh;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v2

    if-lez v2, :cond_4d

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    invoke-virtual {v0, v1}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v0

    iget-object v1, p0, Ld7l;->e:Lw6j;

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result v2

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lw6j;->i(ILjava/lang/String;)Lknf;

    move-result-object v0

    iget-object v2, v1, Lw6j;->d:Ljava/lang/Object;

    check-cast v2, Lknf;

    if-eq v0, v2, :cond_4d

    iput-object v0, v1, Lw6j;->d:Ljava/lang/Object;

    iget-object v1, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Ld7l;

    iget-object v3, v1, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->isActive()Z

    move-result v3

    if-eqz v3, :cond_4d

    if-eqz v2, :cond_45

    invoke-interface {v2}, Lknf;->a()V

    :cond_45
    if-eqz v0, :cond_4a

    invoke-interface {v0}, Lknf;->F()V

    :cond_4a
    invoke-virtual {v1}, Ld7l;->p0()V

    :cond_4d
    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_53
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_63

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0, p1}, La2l;->E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_53

    :cond_63
    invoke-virtual {p0}, Ld7l;->p0()V

    return-void
.end method

.method public final b()V
    .registers 3

    iget-object p0, p0, Lb7l;->a:Ld7l;

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0}, La2l;->v(Lb2l;)V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final c(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-object p0, p0, Lb7l;->a:Ld7l;

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0, p1}, La2l;->Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_8

    :cond_18
    invoke-virtual {p0}, Ld7l;->p0()V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Lb7l;->a:Ld7l;

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0}, La2l;->j(Lb2l;)V

    goto :goto_8

    :cond_18
    return-void
.end method
