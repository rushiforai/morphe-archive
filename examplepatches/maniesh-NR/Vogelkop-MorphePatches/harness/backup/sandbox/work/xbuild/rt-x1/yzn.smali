.class public final Lyzn;
.super Lol9;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/startup/WelcomeActivity;

.field public final c:Lmcj;

.field public final d:Ltzn;

.field public final e:Lmsl;

.field public final f:Lumi;

.field public final g:Lwv1;

.field public final h:Lwv1;

.field public final i:Lj4c;

.field public final j:Lwv1;

.field public final k:Lvzn;

.field public final l:Lvzn;

.field public final m:Lvzn;

.field public final n:Lwzn;

.field public final o:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Lcom/opera/android/startup/WelcomeActivity;Lmcj;Ltzn;Lmsl;Lumi;Lwv1;Lwv1;Lj4c;Lwv1;Lvzn;Lvzn;Lvzn;Lwzn;Lcom/opera/android/Lazy;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    iput-object p2, p0, Lyzn;->c:Lmcj;

    iput-object p3, p0, Lyzn;->d:Ltzn;

    iput-object p4, p0, Lyzn;->e:Lmsl;

    iput-object p5, p0, Lyzn;->f:Lumi;

    iput-object p6, p0, Lyzn;->g:Lwv1;

    iput-object p7, p0, Lyzn;->h:Lwv1;

    iput-object p8, p0, Lyzn;->i:Lj4c;

    iput-object p9, p0, Lyzn;->j:Lwv1;

    iput-object p10, p0, Lyzn;->k:Lvzn;

    iput-object p11, p0, Lyzn;->l:Lvzn;

    iput-object p12, p0, Lyzn;->m:Lvzn;

    iput-object p13, p0, Lyzn;->n:Lwzn;

    iput-object p14, p0, Lyzn;->o:Lcom/opera/android/Lazy;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 16

    iget-object v0, p0, Lyzn;->j:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    iget-object v1, p0, Lyzn;->g:Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, p2}, Lol9;->c(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Lo9k;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, p0, Lyzn;->c:Lmcj;

    iget-object v6, p0, Lyzn;->d:Ltzn;

    if-eqz v4, :cond_2d

    new-instance p1, Lo9k;

    invoke-virtual {v6}, Ltzn;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Likc;

    iget-object v0, p0, Lyzn;->e:Lmsl;

    iget-object p0, p0, Lyzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p1, p2, v0, p0, v5}, Lo9k;-><init>(Likc;Lmsl;Lcom/opera/android/startup/WelcomeActivity;Lmcj;)V

    return-object p1

    :cond_2d
    const-class v4, Ly8k;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4b

    invoke-virtual {v6}, Ltzn;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Likc;

    iget-object p0, p0, Lyzn;->h:Lwv1;

    iget-object p0, p0, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwsf;

    new-instance p2, Ly8k;

    invoke-direct {p2, v5, p0, p1}, Ly8k;-><init>(Lmcj;Lwsf;Likc;)V

    return-object p2

    :cond_4b
    const-class v4, Lpdf;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7b

    new-instance v5, Lpdf;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v7, p1

    check-cast v7, Lorm;

    iget-object p1, p0, Lyzn;->i:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v8, p1

    check-cast v8, Lmdf;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v9, p1

    check-cast v9, Lr65;

    iget-object p1, p0, Lyzn;->o:Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v10, p1

    check-cast v10, Lyl6;

    iget-object v6, p0, Lyzn;->c:Lmcj;

    invoke-direct/range {v5 .. v10}, Lpdf;-><init>(Lmcj;Lorm;Lmdf;Lr65;Lyl6;)V

    return-object v5

    :cond_7b
    const-class v4, Lx65;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b4

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lr65;

    iget-object p1, p0, Lyzn;->k:Lvzn;

    invoke-virtual {p1}, Lvzn;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Ldll;

    new-instance v7, Lb1i;

    invoke-direct {v7}, Lb1i;-><init>()V

    new-instance v4, Lqfl;

    const/16 p1, 0x1d

    invoke-direct {v4, p0, p1}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lm2n;

    const/16 p1, 0xb

    invoke-direct {v5, p0, p1}, Lm2n;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lx65;

    iget-object v1, p0, Lyzn;->f:Lumi;

    const/4 v6, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v0 .. v12}, Lx65;-><init>(Lumi;Lr65;Ldll;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;ZLp10;ZZZZZ)V

    return-object v0

    :cond_b4
    const-class v0, Lg49;

    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d2

    new-instance p1, Lg49;

    iget-object p2, p0, Lyzn;->n:Lwzn;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lm9k;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    iget-object p0, p0, Lyzn;->f:Lumi;

    invoke-direct {p1, p0, p2, v0}, Lg49;-><init>(Lumi;Lm9k;Lorm;)V

    return-object p1

    :cond_d2
    const-class v0, Locg;

    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e5

    new-instance p0, Locg;

    new-instance p1, Lkotlin/Pair;

    invoke-direct {p1, v2, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Locg;-><init>(Lkotlin/Pair;)V

    return-object p0

    :cond_e5
    invoke-super {p0, p1, p2}, Lol9;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0
.end method
