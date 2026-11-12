.class public final synthetic Lglk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhlk;


# direct methods
.method public synthetic constructor <init>(Lhlk;B)V
    .registers 3

    iput-byte p2, p0, Lglk;->a:B

    iput-object p1, p0, Lglk;->b:Lhlk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 12

    iget-byte v0, p0, Lglk;->a:B

    iget-object p0, p0, Lglk;->b:Lhlk;

    packed-switch v0, :pswitch_data_10c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lhlk;->k:Lo4g;

    iget-object v1, p0, Lo4g;->f:Landroid/view/View;

    move-object v2, v1

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->c:Landroid/view/View;

    move-object v3, v1

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->g:Landroid/view/View;

    move-object v4, v1

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->e:Landroid/view/View;

    move-object v5, v1

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->h:Landroid/view/View;

    move-object v6, v1

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->k:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p0, Lo4g;->l:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p0, Lo4g;->i:Landroid/view/View;

    move-object v9, p0

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    filled-new-array/range {v2 .. v9}, [Lcom/opera/android/ui/catalog/widget/OperaListItem;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_42
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v2, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {v2}, Lbpd;->D()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    invoke-virtual {v1}, Lbpd;->D()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_42

    :cond_6b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Li4d;

    new-instance v1, Lu5f;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-direct {v0, v1}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Lghf;

    invoke-direct {p0, v0}, Lghf;-><init>(Li4d;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void

    :pswitch_88
    iget-object v0, p0, Lhlk;->j:Lru9;

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn_pro.kill_switch.on"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_a4

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    goto :goto_10b

    :cond_a4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lhlk;->d:Lslk;

    iget-object v0, v0, Lslk;->i:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwvg;

    invoke-virtual {v0}, Lwvg;->a()Z

    move-result v1

    if-eqz v1, :cond_c2

    invoke-virtual {v0}, Lwvg;->b()Z

    move-result v0

    if-nez v0, :cond_c2

    const v0, 0x7f140584

    goto :goto_c5

    :cond_c2
    const v0, 0x7f140583

    :goto_c5
    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v1, Lrxh;

    invoke-direct {v1, v0}, Lrxh;-><init>(I)V

    new-instance v0, Ltxi;

    const/16 v2, 0x13

    invoke-direct {v0, p0, v2}, Ltxi;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lgkj;

    invoke-direct {p0, v3, v3}, Lnz0;-><init>(ZZ)V

    const/4 v2, 0x0

    iput-object v2, p0, Lgkj;->a:Ljava/lang/String;

    iput-object v2, p0, Lgkj;->b:Ljava/lang/String;

    iput-object v2, p0, Lgkj;->c:Ljava/lang/String;

    iput-object v2, p0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v2, p0, Lgkj;->e:Lekj;

    iput-object v2, p0, Lgkj;->f:Lfkj;

    iput-object v2, p0, Lgkj;->g:Lqp2;

    iput-object v0, p0, Lgkj;->h:Ldkj;

    iput-object v2, p0, Lgkj;->i:Ldkj;

    iput-object v2, p0, Lgkj;->j:Lql;

    const v0, 0x7f141372

    iput v0, p0, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, p0, Lgkj;->l:I

    const v0, 0x7f140585

    iput v0, p0, Lgkj;->m:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lgkj;->n:Z

    iput-object v1, p0, Lgkj;->o:Lpxh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    :goto_10b
    return-void

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_88
    .end packed-switch
.end method
