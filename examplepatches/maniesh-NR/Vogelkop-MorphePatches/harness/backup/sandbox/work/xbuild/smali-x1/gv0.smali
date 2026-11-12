.class public final synthetic Lgv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhv0;


# direct methods
.method public synthetic constructor <init>(Lhv0;B)V
    .registers 3

    iput-byte p2, p0, Lgv0;->a:B

    iput-object p1, p0, Lgv0;->b:Lhv0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lgv0;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lgv0;->b:Lhv0;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_c6

    iget-object v0, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lhv0;->f:Ld8j;

    const/4 v4, 0x0

    iget-object v5, p0, Lhv0;->g:Lpt3;

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lz5i;->s0(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ld8j;Ljava/lang/String;ZLpt3;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d
    iget-object p0, p0, Lhv0;->h:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    new-instance p1, Ltca;

    sget-object p2, Lsca;->b:Lsca;

    invoke-direct {p1, p2}, Ltca;-><init>(Lsca;)V

    invoke-virtual {p0, p1, v2}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32
    iget-object p1, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lhv0;->g:Lpt3;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p1

    iget-object p1, p1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_60

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Leri;

    instance-of v0, v0, Ll42;

    if-eqz v0, :cond_4e

    goto :goto_61

    :cond_60
    const/4 p2, 0x0

    :goto_61
    check-cast p2, Leri;

    if-eqz p2, :cond_6a

    const-string p1, ""

    invoke-virtual {p0, p2, p1, v1, v2}, Lpt3;->b(Leri;Ljava/lang/String;ZZ)V

    :cond_6a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6d
    invoke-virtual {p0}, Lhv0;->b()Z

    move-result p2

    if-nez p2, :cond_81

    iget-object v3, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    iget-object v4, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v5, p0, Lhv0;->f:Ld8j;

    const/4 v7, 0x0

    iget-object v8, p0, Lhv0;->g:Lpt3;

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lz5i;->s0(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ld8j;Ljava/lang/String;ZLpt3;)V

    goto :goto_b3

    :cond_81
    new-instance p2, Ldd;

    iget-object p0, p0, Lhv0;->c:Lfd;

    new-instance v0, Lzc;

    sget-object v3, Lpc;->s:Lpc;

    invoke-direct {v0, v3}, Lzc;-><init>(Lpc;)V

    new-instance v3, Lzc;

    sget-object v4, Lpc;->t:Lpc;

    invoke-direct {v3, v4}, Lzc;-><init>(Lpc;)V

    new-instance v4, Lzc;

    sget-object v5, Lpc;->p:Lpc;

    invoke-direct {v4, v5}, Lzc;-><init>(Lpc;)V

    const/4 v5, 0x4

    new-array v5, v5, [Lbd;

    aput-object v0, v5, v2

    sget-object v0, Lad;->a:Lad;

    aput-object v0, v5, v1

    const/4 v0, 0x2

    aput-object v3, v5, v0

    const/4 v0, 0x3

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Ldd;-><init>(Lfd;Ljava/util/List;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    :goto_b3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b6
    iget-object v0, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lhv0;->f:Ld8j;

    const/4 v4, 0x0

    iget-object v5, p0, Lhv0;->g:Lpt3;

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lz5i;->s0(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ld8j;Ljava/lang/String;ZLpt3;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_b6
        :pswitch_6d
        :pswitch_32
        :pswitch_1d
    .end packed-switch
.end method
