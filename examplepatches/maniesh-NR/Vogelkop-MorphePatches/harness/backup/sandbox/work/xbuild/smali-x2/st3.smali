.class public final synthetic Lst3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lst3;->a:B

    iput-object p1, p0, Lst3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lst3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lst3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_f8

    check-cast p1, Lkotlin/Unit;

    invoke-static {p0}, Lw1h;->n(Landroid/content/ContextWrapper;)Lmlm;

    move-result-object p1

    iget-boolean v0, p1, Lmlm;->b:Z

    iget-boolean p1, p1, Lmlm;->a:Z

    const-string v1, "uninstall"

    if-nez p1, :cond_1b

    if-nez v0, :cond_22

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2d

    :cond_1b
    :try_start_1b
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, p1}, Lphj;->q0(Lcom/opera/android/BrowserActivity;Ljava/util/List;)V

    :cond_22
    if-eqz v0, :cond_2b

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, p1}, Lphj;->N(Lcom/opera/android/BrowserActivity;Ljava/util/List;)V
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1b .. :try_end_2b} :catch_2b
    .catch Ljava/lang/IllegalStateException; {:try_start_1b .. :try_end_2b} :catch_2b

    :catch_2b
    :cond_2b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2d
    return-object p0

    :pswitch_2e
    check-cast p1, Ljava/lang/Boolean;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->C1()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38
    check-cast p1, Lr9b;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->j:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltgi;

    iget-object v0, p0, Ltgi;->c:Lr9b;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6c

    iput-object p1, p0, Ltgi;->c:Lr9b;

    iget-object p1, p0, Ltgi;->b:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, v0}, Ltgi;->a(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_5c

    :cond_6c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->S:Lc37;

    if-nez p0, :cond_79

    move-object p0, v1

    :cond_79
    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Lnak;

    invoke-virtual {p0, v1, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_83
    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_a4

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_8c

    move-object v1, p0

    :cond_8c
    invoke-virtual {v1, p1}, Lgbf;->k(Ljava/lang/String;)V

    iget-object p0, v1, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lupm;->g()Lxbf;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x6

    const/4 v0, 0x0

    sget-object v1, Ltkk;->b:Ltkk;

    invoke-static {p0, v1, v0, p1}, Lxbf;->F(Lxbf;Lj7h;II)V

    goto :goto_a6

    :cond_a4
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    :goto_a6
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a9
    check-cast p1, Ljava/lang/Integer;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->e1:Lc1a;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->f0:Lkze;

    if-eqz v0, :cond_cd

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, v0, Lc1a;->g:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object v0, v0, Lks3;->e:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfi7;

    iget v2, v2, Lfi7;->a:I

    new-instance v3, Lfi7;

    invoke-direct {v3, v2, v1}, Lfi7;-><init>(II)V

    invoke-virtual {v0, v3}, Lekc;->r(Ljava/lang/Object;)V

    :cond_cd
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfi7;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget v0, v0, Lfi7;->a:I

    new-instance v1, Lfi7;

    invoke-direct {v1, v0, p1}, Lfi7;-><init>(II)V

    invoke-static {p0, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e4
    check-cast p1, Ljava/lang/Float;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->h1()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ee
    check-cast p1, Lavl;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->h1()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_ee
        :pswitch_e4
        :pswitch_a9
        :pswitch_83
        :pswitch_6f
        :pswitch_38
        :pswitch_2e
    .end packed-switch
.end method
