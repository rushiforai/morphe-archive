.class public final Lm12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr12;


# instance fields
.field public final a:Ld5o;

.field public final synthetic b:Lp12;

.field public final synthetic c:Lu59;

.field public final synthetic d:Lqs5;

.field public final synthetic e:Lorg/chromium/content_public/browser/WebContents;


# direct methods
.method public constructor <init>(Lp12;Lk73;Lu59;Lqs5;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm12;->b:Lp12;

    iput-object p3, p0, Lm12;->c:Lu59;

    iput-object p4, p0, Lm12;->d:Lqs5;

    iput-object p5, p0, Lm12;->e:Lorg/chromium/content_public/browser/WebContents;

    new-instance p3, Ld5o;

    iget-object p4, p1, Lp12;->a:Ljava/lang/Object;

    check-cast p4, Landroid/content/Context;

    iget-object p1, p1, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Lgjm;

    invoke-direct {p3, p4, p1, p2}, Ld5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p3, p0, Lm12;->a:Ld5o;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    new-instance v0, Lds5;

    const/4 v1, 0x0

    iget-object p0, p0, Lm12;->a:Ld5o;

    invoke-direct {v0, p0, v1}, Lds5;-><init>(Ld5o;B)V

    iget-object v1, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v1, Lk73;

    new-instance v2, Lge5;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lk73;->t(Lge5;)V

    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Lm12;->b:Lp12;

    iget-object v0, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v0, Lqsh;

    iget-object v1, p0, Lm12;->d:Lqs5;

    iget-object v1, v1, Lqs5;->e:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Lab;

    const/16 v3, 0xf

    iget-object p0, p0, Lm12;->c:Lu59;

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Lqsh;->c(Landroid/net/Uri;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Lm12;->d:Lqs5;

    iget-object v0, v0, Lqs5;->e:Ljava/lang/String;

    iget-object p0, p0, Lm12;->c:Lu59;

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Ls62;

    iget-object p0, p0, Ls62;->v:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_18

    sget v1, Lzz1;->m:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lzz1;->d(Ljava/lang/String;Z)V

    :cond_18
    return-void
.end method

.method public final d()V
    .registers 5

    new-instance v0, Lds5;

    const/4 v1, 0x2

    iget-object p0, p0, Lm12;->a:Ld5o;

    invoke-direct {v0, p0, v1}, Lds5;-><init>(Ld5o;B)V

    iget-object v1, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v1, Lk73;

    new-instance v2, Lge5;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lk73;->t(Lge5;)V

    return-void
.end method

.method public final e()V
    .registers 5

    iget-object p0, p0, Lm12;->a:Ld5o;

    iget-object v0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v0, Lk73;

    sget-object v1, Lks5;->b:Lks5;

    new-instance v2, Lds5;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lds5;-><init>(Ld5o;B)V

    const/16 p0, 0x800

    invoke-virtual {v0, p0, v1, v2}, Lk73;->v(ILks5;Lls5;)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lm12;->d:Lqs5;

    iget-object v1, v0, Lqs5;->e:Ljava/lang/String;

    iget-object v0, v0, Lqs5;->k:Lsqh;

    if-eqz v0, :cond_b

    iget-object v0, v0, Lsqh;->a:Ljava/lang/String;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_10

    const-string v0, ""

    :cond_10
    iget-object p0, p0, Lm12;->e:Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p0, v1, v0}, LJ/N;->M8vd_RmR(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
