.class public final Lqyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lczj;


# instance fields
.field public final a:Lndc;

.field public final b:Lkze;

.field public final c:Lg22;

.field public final d:Lk62;

.field public final e:Lcom/opera/android/Lazy;

.field public final f:Lyv3;

.field public final g:Ll62;

.field public h:I

.field public final i:Lode;

.field public final j:Lode;

.field public final k:Lkze;

.field public l:Labn;

.field public m:Luyj;

.field public n:Lrzh;

.field public o:Ld22;


# direct methods
.method public constructor <init>(Lndc;Lekc;Lkze;Lg22;Lk62;Lcom/opera/android/Lazy;Lyv3;Ll62;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqyj;->a:Lndc;

    iput-object p3, p0, Lqyj;->b:Lkze;

    iput-object p4, p0, Lqyj;->c:Lg22;

    iput-object p5, p0, Lqyj;->d:Lk62;

    iput-object p6, p0, Lqyj;->e:Lcom/opera/android/Lazy;

    iput-object p7, p0, Lqyj;->f:Lyv3;

    iput-object p8, p0, Lqyj;->g:Ll62;

    new-instance p4, Lode;

    const/4 p5, 0x0

    invoke-direct {p4, p5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lqyj;->i:Lode;

    new-instance p4, Lode;

    invoke-direct {p4, p5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lqyj;->j:Lode;

    new-instance p4, Lkze;

    sget-object p5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p4, p5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lqyj;->k:Lkze;

    new-instance p4, Lnyj;

    const/4 p5, 0x1

    invoke-direct {p4, p0, p5}, Lnyj;-><init>(Lqyj;B)V

    new-instance p5, Lt7d;

    const/16 p6, 0xd

    invoke-direct {p5, p4, p6}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Lnyj;

    const/4 p4, 0x2

    invoke-direct {p2, p0, p4}, Lnyj;-><init>(Lqyj;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p2, p6}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p3, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 5

    invoke-virtual {p0}, Lqyj;->m()V

    iget-object v0, p0, Lqyj;->e:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbn;

    iget-object v1, p0, Lqyj;->f:Lyv3;

    invoke-virtual {v1}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    new-instance v2, Lmw0;

    invoke-direct {v2, v1}, Lmw0;-><init>(Lru9;)V

    new-instance v1, Lnyj;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lnyj;-><init>(Lqyj;B)V

    invoke-virtual {v0, v2, v1}, Ljbn;->e(Lmw0;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final d()Ljava/util/Locale;
    .registers 1

    iget-object p0, p0, Lqyj;->e:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljbn;

    invoke-virtual {p0}, Ljbn;->a()Lekc;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method public final f()V
    .registers 2

    iget-object v0, p0, Lqyj;->l:Labn;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Labn;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lqyj;->l:Labn;

    iget-object p0, p0, Lqyj;->i:Lode;

    invoke-static {p0, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    return-void
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)V
    .registers 14

    iget-object v2, p0, Lqyj;->m:Luyj;

    iget-object v3, p0, Lqyj;->j:Lode;

    if-nez v2, :cond_27

    iget-object v2, p0, Lqyj;->d:Lk62;

    invoke-virtual {v2}, Lk62;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luyj;

    iput-object v2, p0, Lqyj;->m:Luyj;

    const/4 v5, 0x0

    invoke-static {v3, v5}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    iget-object v5, v2, Luyj;->b:Lkze;

    new-instance v6, Lvvf;

    const/16 v7, 0x1c

    invoke-direct {v6, p0, v2, v7}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v7, Lt7d;

    const/16 v8, 0xd

    invoke-direct {v7, v6, v8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v5, v7}, Lekc;->k(Lf7f;)V

    :cond_27
    iget-object v5, p0, Lqyj;->n:Lrzh;

    if-eqz v5, :cond_2f

    invoke-interface {v5, p2}, Lrzh;->l(Ljava/lang/String;)V

    goto :goto_3c

    :cond_2f
    new-instance v5, Loyj;

    const/4 v6, 0x0

    invoke-direct {v5, p0, p4, v6}, Loyj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lvi2;

    invoke-direct {v6, p2, v3, p4, v5}, Lvi2;-><init>(Ljava/lang/String;Lode;Lkotlin/jvm/functions/Function1;Loyj;)V

    iput-object v6, p0, Lqyj;->n:Lrzh;

    :goto_3c
    invoke-virtual {p0}, Lqyj;->d()Ljava/util/Locale;

    move-result-object v3

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, v2, Luyj;->j:F

    new-instance v0, Ld6e;

    move-object v4, p2

    move v5, p3

    move-object v1, v2

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Ld6e;-><init>(Luyj;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V

    iget-object v2, v1, Luyj;->b:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lwyj;->a:Lwyj;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_65

    new-instance v2, Lnx0;

    const/16 v3, 0x8

    invoke-direct {v2, v0, v3}, Lnx0;-><init>(Lkotlin/jvm/functions/Function0;B)V

    iput-object v2, v1, Luyj;->e:Lkotlin/jvm/functions/Function0;

    return-void

    :cond_65
    invoke-virtual {v0}, Ld6e;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final m()V
    .registers 6

    iget-object v0, p0, Lqyj;->o:Ld22;

    if-eqz v0, :cond_b

    iget-object v0, v0, Ld22;->c:Lkze;

    iget-object v1, p0, Lqyj;->a:Lndc;

    invoke-virtual {v0, v1}, Lekc;->q(Lndc;)V

    :cond_b
    iget-object v0, p0, Lqyj;->o:Ld22;

    if-eqz v0, :cond_12

    const/4 v1, 0x1

    iput-boolean v1, v0, Ld22;->d:Z

    :cond_12
    const/4 v0, 0x0

    iput-object v0, p0, Lqyj;->o:Ld22;

    iget-object v1, p0, Lqyj;->m:Luyj;

    if-eqz v1, :cond_3a

    new-instance v2, Ldnj;

    const/4 v3, 0x2

    invoke-direct {v2, v1, v3}, Ldnj;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v1, Luyj;->b:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lwyj;->a:Lwyj;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    new-instance v3, Lnx0;

    const/16 v4, 0x8

    invoke-direct {v3, v2, v4}, Lnx0;-><init>(Lkotlin/jvm/functions/Function0;B)V

    iput-object v3, v1, Luyj;->e:Lkotlin/jvm/functions/Function0;

    goto :goto_3a

    :cond_37
    invoke-virtual {v2}, Ldnj;->invoke()Ljava/lang/Object;

    :cond_3a
    :goto_3a
    iget-object v1, p0, Lqyj;->n:Lrzh;

    if-eqz v1, :cond_41

    invoke-interface {v1}, Lhh4;->cancel()V

    :cond_41
    iput-object v0, p0, Lqyj;->n:Lrzh;

    return-void
.end method
