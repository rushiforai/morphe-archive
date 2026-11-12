.class public final Lynj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhh4;


# instance fields
.field public final a:Ldoj;

.field public final b:Ldeg;

.field public final c:Lqfl;

.field public final d:Lqnl;

.field public final e:Lhoj;

.field public f:Lhh4;

.field public g:Lhh4;

.field public h:Lcom/opera/android/browser/SimpleUrlLoader;

.field public i:Lnwa;

.field public j:Z

.field public final synthetic k:Leoj;


# direct methods
.method public constructor <init>(Leoj;Ldoj;Ldeg;Lqfl;ZLqnl;)V
    .registers 9

    iget-object v0, p2, Ldoj;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lynj;->k:Leoj;

    iput-object p2, p0, Lynj;->a:Ldoj;

    iput-object p3, p0, Lynj;->b:Ldeg;

    iput-object p4, p0, Lynj;->c:Lqfl;

    iput-object p6, p0, Lynj;->d:Lqnl;

    iget-object p2, p2, Ldoj;->b:Lp6l;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    const/4 p4, 0x0

    const/4 p6, 0x1

    if-eqz p3, :cond_22

    if-ne p3, p6, :cond_1e

    iget-object p3, p1, Leoj;->d:Lhoj;

    goto :goto_24

    :cond_1e
    invoke-static {}, Lh9o;->p()V

    throw p4

    :cond_22
    iget-object p3, p1, Leoj;->c:Livg;

    :goto_24
    iput-object p3, p0, Lynj;->e:Lhoj;

    iget-object p3, p1, Leoj;->e:Ljava/util/ArrayList;

    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p3, p1, Leoj;->b:La5l;

    if-eqz p5, :cond_af

    new-instance p5, Lhda;

    const/16 v1, 0x1d

    invoke-direct {p5, p0, p1, v1}, Lhda;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, La5l;->l:Lgpk;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_7a

    if-ne v0, p6, :cond_76

    iget-object p4, p3, La5l;->d:Ln9h;

    iget-object p4, p4, Ln9h;->c:Ljava/lang/Object;

    check-cast p4, Ljava/util/LinkedHashMap;

    new-instance p6, Ly4l;

    invoke-direct {p6, p1}, Ly4l;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lz4l;

    goto :goto_8b

    :cond_76
    invoke-static {}, Lh9o;->p()V

    throw p4

    :cond_7a
    iget-object p4, p3, La5l;->c:Ln9h;

    iget-object p4, p4, Ln9h;->c:Ljava/lang/Object;

    check-cast p4, Ljava/util/LinkedHashMap;

    new-instance p6, Ly4l;

    invoke-direct {p6, p1}, Ly4l;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lz4l;

    :goto_8b
    if-eqz p4, :cond_9f

    iget p1, p4, Lz4l;->a:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget p2, p4, Lz4l;->b:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p5, p1, p2}, Lhda;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, La5l;->l:Lgpk;

    goto :goto_ac

    :cond_9f
    new-instance p4, Lhd;

    new-instance p6, Ln6k;

    const/16 v0, 0x13

    invoke-direct {p6, p5, v0}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p4, p3, p1, p2, p6}, Lhd;-><init>(La5l;Ljava/lang/String;Lp6l;Ln6k;)V

    move-object p1, p4

    :goto_ac
    iput-object p1, p0, Lynj;->f:Lhh4;

    return-void

    :cond_af
    new-instance p1, Lxnj;

    const/4 p5, 0x0

    invoke-direct {p1, p0, p5}, Lxnj;-><init>(Lynj;B)V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p5

    if-eqz p5, :cond_d1

    if-ne p5, p6, :cond_cd

    iget-object p4, p3, La5l;->d:Ln9h;

    iget-object p4, p4, Ln9h;->b:Ljava/lang/Object;

    check-cast p4, Ljava/util/LinkedHashMap;

    invoke-virtual {p4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lx4l;

    goto :goto_dd

    :cond_cd
    invoke-static {}, Lh9o;->p()V

    throw p4

    :cond_d1
    iget-object p4, p3, La5l;->c:Ln9h;

    iget-object p4, p4, Ln9h;->b:Ljava/lang/Object;

    check-cast p4, Ljava/util/LinkedHashMap;

    invoke-virtual {p4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lx4l;

    :goto_dd
    if-eqz p4, :cond_eb

    invoke-virtual {p4}, Lx4l;->b()Z

    move-result p5

    if-nez p5, :cond_eb

    invoke-virtual {p1, p4}, Lxnj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, La5l;->l:Lgpk;

    goto :goto_f1

    :cond_eb
    new-instance p4, Li9c;

    invoke-direct {p4, p3, v0, p2, p1}, Li9c;-><init>(La5l;Ljava/lang/String;Lp6l;Lkotlin/jvm/functions/Function1;)V

    move-object p1, p4

    :goto_f1
    iput-object p1, p0, Lynj;->g:Lhh4;

    return-void
.end method


# virtual methods
.method public final a(Lcoj;)V
    .registers 3

    iget-boolean v0, p0, Lynj;->j:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lynj;->j:Z

    iget-object v0, p0, Lynj;->k:Leoj;

    iget-object v0, v0, Leoj;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lynj;->d:Lqnl;

    invoke-virtual {p0, p1}, Lqnl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final cancel()V
    .registers 7

    iget-boolean v0, p0, Lynj;->j:Z

    if-nez v0, :cond_36

    const/4 v0, 0x1

    iput-boolean v0, p0, Lynj;->j:Z

    iget-object v0, p0, Lynj;->k:Leoj;

    iget-object v0, v0, Leoj;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lynj;->f:Lhh4;

    if-eqz v0, :cond_15

    invoke-interface {v0}, Lhh4;->cancel()V

    :cond_15
    iget-object v0, p0, Lynj;->g:Lhh4;

    if-eqz v0, :cond_1c

    invoke-interface {v0}, Lhh4;->cancel()V

    :cond_1c
    iget-object v0, p0, Lynj;->h:Lcom/opera/android/browser/SimpleUrlLoader;

    if-eqz v0, :cond_2d

    iget-wide v1, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2d

    invoke-static {v1, v2}, LJ/N;->Mnq_7cIN(J)V

    iput-wide v3, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    :cond_2d
    iget-object v0, p0, Lynj;->i:Lnwa;

    if-eqz v0, :cond_36

    iget-object p0, p0, Lynj;->b:Ldeg;

    invoke-virtual {p0, v0}, Ldeg;->a(Ljava/lang/Object;)V

    :cond_36
    return-void
.end method
