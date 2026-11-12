.class public final Lk68;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final a:Lorg/chromium/content_public/browser/WebContents;

.field public final b:Ldx3;

.field public final c:Lydn;

.field public final d:Lufn;

.field public final e:Lgjm;

.field public final f:Lx5f;

.field public g:Li68;

.field public h:Lkm5;

.field public i:Z


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Ldx3;Lydn;Lufn;Lgjm;Lx5f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk68;->a:Lorg/chromium/content_public/browser/WebContents;

    iput-object p2, p0, Lk68;->b:Ldx3;

    iput-object p3, p0, Lk68;->c:Lydn;

    iput-object p4, p0, Lk68;->d:Lufn;

    iput-object p5, p0, Lk68;->e:Lgjm;

    iput-object p6, p0, Lk68;->f:Lx5f;

    new-instance p2, Lf53;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p1, p3}, Lf53;-><init>(Ljava/lang/Object;Lorg/chromium/content_public/browser/WebContents;B)V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 1

    invoke-virtual {p0}, Lk68;->b()V

    return-void
.end method

.method public final N()V
    .registers 1

    invoke-virtual {p0}, Lk68;->b()V

    return-void
.end method

.method public final a()Lpcn;
    .registers 6

    new-instance v0, Lpcn;

    invoke-direct {v0}, Lpcn;-><init>()V

    iget-object v1, p0, Lk68;->d:Lufn;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltfn;

    iget-wide v1, v1, Ltfn;->a:J

    const-wide/16 v3, 0x40

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_90

    iget-object v1, p0, Lk68;->a:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v1

    iget-object v2, p0, Lk68;->c:Lydn;

    if-eqz v1, :cond_2b

    iget-object v1, v2, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    invoke-virtual {v2}, Lydn;->q()I

    move-result v3

    goto :goto_35

    :cond_2b
    iget-object v1, v2, Lydn;->d:Lvdn;

    invoke-virtual {v1}, Lvdn;->a()Z

    move-result v1

    invoke-virtual {v2}, Lydn;->r()I

    move-result v3

    :goto_35
    invoke-virtual {v2}, Lydn;->p()Lwdn;

    move-result-object v4

    iget-boolean v4, v4, Lwdn;->a:Z

    iput-boolean v4, v0, Lpcn;->b:Z

    iget-object v2, v2, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    iget-object p0, p0, Lk68;->b:Ldx3;

    if-eqz v2, :cond_4f

    const v2, 0x7f1413ee

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_56

    :cond_4f
    const v2, 0x7f141408

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_56
    iput-object v2, v0, Lpcn;->c:Ljava/lang/String;

    invoke-static {v3}, Lvep;->A(I)I

    move-result v2

    if-eqz v2, :cond_84

    const/4 v3, 0x1

    if-eq v2, v3, :cond_7c

    const/4 v3, 0x2

    if-eq v2, v3, :cond_74

    const/4 v3, 0x3

    if-ne v2, v3, :cond_6f

    const v2, 0x7f141403

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_8b

    :cond_6f
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_74
    const v2, 0x7f14117e

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_8b

    :cond_7c
    const v2, 0x7f1413ff

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_8b

    :cond_84
    const v2, 0x7f1413fe

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_8b
    iput-object p0, v0, Lpcn;->d:Ljava/lang/String;

    iput-boolean v1, v0, Lpcn;->e:Z

    return-object v0

    :cond_90
    const/4 p0, 0x0

    iput-boolean p0, v0, Lpcn;->b:Z

    const-string v1, ""

    iput-object v1, v0, Lpcn;->c:Ljava/lang/String;

    iput-object v1, v0, Lpcn;->d:Ljava/lang/String;

    iput-boolean p0, v0, Lpcn;->e:Z

    return-object v0
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lk68;->g:Li68;

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lk68;->a()Lpcn;

    move-result-object v1

    invoke-virtual {v0, v1}, Li68;->l(Lpcn;)V

    iget-object p0, p0, Lk68;->h:Lkm5;

    if-eqz p0, :cond_26

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkm5;->b:Z

    iget-object v0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast v0, Loml;

    if-eqz v0, :cond_26

    iget-boolean v0, p0, Lkm5;->a:Z

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    iput-object v0, p0, Lkm5;->d:Ljava/lang/Object;

    iget-object p0, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast p0, Lbn7;

    invoke-virtual {p0}, Lbn7;->run()V

    :cond_26
    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Lk68;->b()V

    return-void
.end method

.method public final t()V
    .registers 1

    invoke-virtual {p0}, Lk68;->b()V

    return-void
.end method
