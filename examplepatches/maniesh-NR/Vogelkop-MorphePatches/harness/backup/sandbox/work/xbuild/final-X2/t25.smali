.class public final Lt25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B

.field public final g:Ljava/util/ArrayList;

.field public h:Z


# direct methods
.method public constructor <init>(B)V
    .registers 14

    iput-byte p1, p0, Lt25;->f:B

    packed-switch p1, :pswitch_data_46

    new-instance v2, Lrxh;

    const p1, 0x7f14062b

    invoke-direct {v2, p1}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const p1, 0x7f14062c

    invoke-direct {v3, p1}, Lrxh;-><init>(I)V

    const v4, 0x7f080543

    sget-object v5, La35;->d:La35;

    const-string v1, "Downloads"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lt25;->g:Ljava/util/ArrayList;

    return-void

    :pswitch_28
    move-object v0, p0

    new-instance v8, Lrxh;

    const p0, 0x7f1410f8

    invoke-direct {v8, p0}, Lrxh;-><init>(I)V

    const v10, 0x7f0805a4

    sget-object v11, La35;->f:La35;

    const-string v7, "OfflinePages"

    const/4 v9, 0x0

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lt25;->g:Ljava/util/ArrayList;

    return-void

    nop

    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_28
    .end packed-switch
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 7

    iget-byte v0, p0, Lt25;->f:B

    iget-object v1, p0, Lt25;->g:Ljava/util/ArrayList;

    packed-switch v0, :pswitch_data_60

    iget-boolean v0, p0, Lt25;->h:Z

    if-nez v0, :cond_16

    new-instance v0, Lsu;

    const/16 v1, 0xe

    invoke-direct {v0, p0, p1, p2, v1}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lt25;->c(Ls25;Lcom/opera/api/Callback;)V

    goto :goto_28

    :cond_16
    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, v1, p1}, Lglh;->a(Ljava/util/Collection;Z)V

    :goto_28
    return-void

    :pswitch_29
    iget-boolean v0, p0, Lt25;->h:Z

    if-nez v0, :cond_38

    new-instance v0, Lsu;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p1, p2, v1}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lt25;->c(Ls25;Lcom/opera/api/Callback;)V

    goto :goto_5f

    :cond_38
    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v0, 0x0

    :goto_4d
    if-ge v0, p1, :cond_5c

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lre7;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lrf7;->c(Lre7;Lvwh;)V

    goto :goto_4d

    :cond_5c
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :goto_5f
    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 8

    iget-byte v0, p0, Lt25;->f:B

    packed-switch v0, :pswitch_data_7c

    iget-object v0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v0

    new-instance v1, Lsu;

    const/16 v2, 0xd

    invoke-direct {v1, p0, p2, p1, v2}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_1e
    iget-object v0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object v1, p0, Lt25;->g:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v0, v0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3d
    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->l()Z

    move-result v3

    if-nez v3, :cond_54

    iget v3, v2, Lre7;->f:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_3d

    :cond_54
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    :cond_58
    iget-object v0, p1, Ls25;->b:Lumi;

    new-instance v1, Ljl4;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lsu;

    invoke-direct {v3, p0, p2, p1, v2}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Llw0;

    const/4 p2, 0x1

    invoke-direct {p1, v3, p2}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, p1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
