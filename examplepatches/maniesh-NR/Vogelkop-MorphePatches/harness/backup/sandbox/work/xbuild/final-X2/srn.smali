.class public final Lsrn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lnw3;

.field public final c:Lnw3;

.field public final d:Lkze;

.field public final e:Lzv3;

.field public final f:Lsw3;

.field public final g:Lsw3;

.field public final h:Lcom/opera/android/Lazy;

.field public final i:Lsw3;

.field public final j:Lj4c;

.field public final k:Lrw3;

.field public final l:Lrw3;

.field public final m:Lsw3;

.field public final n:Lzv3;

.field public final o:Lcom/opera/android/Lazy;

.field public final p:Lzv3;

.field public final q:Lnw3;

.field public final r:Lnw3;

.field public final s:Lzyk;

.field public final t:Lzyk;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnw3;Lnw3;Lkze;Lzv3;Lsw3;Lsw3;Lcom/opera/android/Lazy;Lsw3;Lj4c;Lrw3;Lrw3;Lsw3;Lzv3;Lcom/opera/android/Lazy;Lzv3;Lnw3;Lnw3;)V
    .registers 19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lsrn;->b:Lnw3;

    iput-object p3, p0, Lsrn;->c:Lnw3;

    iput-object p4, p0, Lsrn;->d:Lkze;

    iput-object p5, p0, Lsrn;->e:Lzv3;

    iput-object p6, p0, Lsrn;->f:Lsw3;

    iput-object p7, p0, Lsrn;->g:Lsw3;

    iput-object p8, p0, Lsrn;->h:Lcom/opera/android/Lazy;

    iput-object p9, p0, Lsrn;->i:Lsw3;

    iput-object p10, p0, Lsrn;->j:Lj4c;

    iput-object p11, p0, Lsrn;->k:Lrw3;

    iput-object p12, p0, Lsrn;->l:Lrw3;

    iput-object p13, p0, Lsrn;->m:Lsw3;

    iput-object p14, p0, Lsrn;->n:Lzv3;

    iput-object p15, p0, Lsrn;->o:Lcom/opera/android/Lazy;

    move-object/from16 p1, p16

    iput-object p1, p0, Lsrn;->p:Lzv3;

    move-object/from16 p1, p17

    iput-object p1, p0, Lsrn;->q:Lnw3;

    move-object/from16 p1, p18

    iput-object p1, p0, Lsrn;->r:Lnw3;

    new-instance p1, Lrrn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lrrn;-><init>(Lsrn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lsrn;->s:Lzyk;

    new-instance p1, Lrrn;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lrrn;-><init>(Lsrn;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lsrn;->t:Lzyk;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 23

    move-object/from16 v0, p0

    const-class v1, Lmqn;

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_f0

    iget-object v1, v0, Lsrn;->s:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le62;

    iget-object v4, v0, Lsrn;->d:Lkze;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-object v5, v1, Le62;->e:Lhq3;

    if-eqz v5, :cond_3e

    invoke-virtual {v5}, Ls62;->l()Z

    move-result v6

    if-eqz v6, :cond_2e

    iput-object v2, v1, Le62;->e:Lhq3;

    goto :goto_3c

    :cond_2e
    iget-object v5, v5, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v5}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    invoke-interface {v5}, Lorg/chromium/content_public/browser/WebContents;->m()Z

    move-result v5

    if-eq v5, v3, :cond_3c

    iput-object v2, v1, Le62;->e:Lhq3;

    :cond_3c
    :goto_3c
    iget-object v2, v1, Le62;->e:Lhq3;

    :cond_3e
    const/4 v5, 0x0

    if-eqz v2, :cond_43

    :goto_41
    move-object v6, v2

    goto :goto_5a

    :cond_43
    iget-object v2, v1, Le62;->a:Lj62;

    iget-object v6, v1, Le62;->c:Lqfl;

    iget-object v7, v1, Le62;->d:Ld12;

    invoke-virtual {v2, v3, v6, v7}, Lj62;->a(ZLkotlin/jvm/functions/Function1;Ld12;)Lhq3;

    move-result-object v2

    iput-object v2, v1, Le62;->e:Lhq3;

    iget-object v3, v2, Ls62;->o:Lqdc;

    new-instance v6, Ld62;

    invoke-direct {v6, v1, v2, v5}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v6}, Lqdc;->a(Lmdc;)V

    goto :goto_41

    :goto_5a
    new-instance v1, Lmqn;

    iget-object v2, v0, Lsrn;->f:Lsw3;

    invoke-virtual {v2}, Lsw3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lru9;

    iget-object v3, v0, Lsrn;->g:Lsw3;

    invoke-virtual {v3}, Lsw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lpjn;

    iget-object v3, v0, Lsrn;->c:Lnw3;

    invoke-virtual {v3}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lorm;

    new-instance v3, Lvsn;

    iget-object v7, v0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v7}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v7

    move v8, v7

    new-instance v7, Lprn;

    invoke-direct {v7, v0, v6, v5}, Lprn;-><init>(Lsrn;Lhq3;B)V

    move v9, v8

    new-instance v8, Lprn;

    const/4 v10, 0x1

    invoke-direct {v8, v0, v6, v10}, Lprn;-><init>(Lsrn;Lhq3;B)V

    move v10, v9

    new-instance v9, Lqrn;

    invoke-direct {v9, v0, v5}, Lqrn;-><init>(Lsrn;B)V

    iget-object v5, v0, Lsrn;->j:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lyk6;

    iget-object v5, v5, Lyk6;->k:Lkze;

    new-instance v11, Ly1n;

    const/16 v12, 0x1b

    invoke-direct {v11, v0, v12}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iget-object v12, v0, Lsrn;->k:Lrw3;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lurn;

    iget-object v13, v0, Lsrn;->m:Lsw3;

    move/from16 v20, v10

    move-object v10, v5

    move/from16 v5, v20

    invoke-direct/range {v3 .. v13}, Lvsn;-><init>(Lize;ZLs62;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lesk;Lkze;Ljava/lang/Runnable;Lurn;Lesk;)V

    iget-object v4, v0, Lsrn;->t:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lwll;

    iget-object v5, v0, Lsrn;->r:Lnw3;

    iget-object v5, v5, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v5

    new-instance v7, Ld7h;

    const/16 v8, 0xd

    invoke-direct {v7, v6, v0, v8}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v8, v0, Lsrn;->o:Lcom/opera/android/Lazy;

    iget-object v9, v0, Lsrn;->q:Lnw3;

    iget-object v10, v0, Lsrn;->h:Lcom/opera/android/Lazy;

    iget-object v0, v0, Lsrn;->i:Lsw3;

    move-object/from16 v17, v0

    move-object v13, v3

    move-object v12, v6

    move-object/from16 v16, v7

    move-object/from16 v18, v8

    move-object/from16 v19, v9

    move-object v9, v14

    move-object v11, v15

    move-object v7, v1

    move-object v8, v2

    move-object v14, v4

    move-object v15, v5

    invoke-direct/range {v7 .. v19}, Lmqn;-><init>(Lru9;Lpjn;Lcom/opera/android/Lazy;Lorm;Lhq3;Lvsn;Lwll;Lqwe;Ld7h;Lsw3;Lcom/opera/android/Lazy;Lnw3;)V

    iget-object v0, v6, Ls62;->m:Lz;

    invoke-virtual {v7}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v0, v1}, Lz;->t(Ltcc;)V

    return-object v7

    :cond_f0
    return-object v2
.end method
