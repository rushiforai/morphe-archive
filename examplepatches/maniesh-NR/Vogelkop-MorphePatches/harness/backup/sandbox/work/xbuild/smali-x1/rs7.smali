.class public final synthetic Lrs7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lss7;


# direct methods
.method public synthetic constructor <init>(Lss7;B)V
    .registers 3

    iput-byte p2, p0, Lrs7;->a:B

    iput-object p1, p0, Lrs7;->b:Lss7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lrs7;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v0, v0, Lrs7;->b:Lss7;

    packed-switch v1, :pswitch_data_106

    invoke-virtual {v0}, Lryl;->g0()V

    return-void

    :pswitch_f
    invoke-virtual {v0}, Lss7;->J0()Z

    move-result v1

    if-eqz v1, :cond_9f

    iget-object v1, v0, Lss7;->B:Lml3;

    if-nez v1, :cond_23

    iget-object v1, v0, Lss7;->C:Lqm3;

    iget-object v4, v0, Lss7;->A:Li53;

    invoke-virtual {v1, v4}, Lqm3;->b(Li53;)Lml3;

    move-result-object v1

    iput-object v1, v0, Lss7;->B:Lml3;

    :cond_23
    iget-object v1, v0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iget-object v4, v0, Lss7;->v:Lal3;

    invoke-virtual {v0, v4, v1}, Lss7;->G0(Lal3;Ljava/lang/String;)Lal3;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljkj;

    iget-boolean v4, v4, Ljkj;->c:Z

    if-nez v4, :cond_61

    iget-object v4, v0, Lss7;->A:Li53;

    iget-object v5, v0, Lss7;->B:Lml3;

    check-cast v4, Lcom/opera/android/bookmarks/h;

    iget-object v4, v4, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v6, "last_folder"

    invoke-interface {v5}, Lal3;->getId()J

    move-result-wide v7

    invoke-interface {v4, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_61
    iget-object v4, v0, Lss7;->v:Lal3;

    if-nez v4, :cond_66

    move v2, v3

    :cond_66
    iget-object v3, v0, Lss7;->A:Li53;

    iget-object v4, v0, Lss7;->B:Lml3;

    if-eqz v2, :cond_94

    check-cast v3, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1, v4}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    iget-boolean v1, v0, Lss7;->y:Z

    if-eqz v1, :cond_97

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    check-cast v1, Ldx3;

    iget-object v1, v1, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->e:Lysj;

    const v2, 0x7f14037c

    const/16 v3, 0x9c4

    invoke-static {v2, v3, v1}, Lam2;->i(IILysj;)Lglj;

    move-result-object v2

    sget-object v3, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_97

    :cond_94
    invoke-virtual {v3, v1, v4}, Li53;->g(Lal3;Lml3;)V

    :cond_97
    :goto_97
    sget-object v1, Lvb0;->b:Lvb0;

    invoke-virtual {v0, v1}, Lss7;->M0(Lvb0;)V

    invoke-virtual {v0}, Lryl;->g0()V

    :cond_9f
    return-void

    :pswitch_a0
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    sget-object v4, Lq9n;->c:Ll5b;

    invoke-virtual {v1}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_b3

    invoke-virtual {v4}, Landroid/view/View;->clearFocus()V

    :cond_b3
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lq9n;->u(Landroid/view/View;)Z

    iget-object v1, v0, Lss7;->B:Lml3;

    if-nez v1, :cond_c6

    iget-object v1, v0, Lss7;->A:Li53;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    :cond_c6
    iget-object v4, v0, Lss7;->v:Lal3;

    if-eqz v4, :cond_cf

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto :goto_d1

    :cond_cf
    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_d1
    new-instance v5, Lfl3;

    iget-object v6, v0, Lss7;->A:Li53;

    new-instance v7, Ldg7;

    const/4 v8, 0x4

    invoke-direct {v7, v0, v8}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v5, v6, v7}, Lfl3;-><init>(Li53;Lcom/opera/api/Callback;)V

    invoke-static {v4, v1, v3}, Lfl3;->G0(Ljava/util/List;Lml3;I)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    new-array v1, v2, [Ln6h;

    new-instance v10, Lwzg;

    const-class v2, Lfl3;

    invoke-direct {v10, v5, v2, v8}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    new-instance v9, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v16

    const/4 v11, 0x0

    const/4 v12, 0x2

    const/16 v13, 0x1001

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v9 .. v16}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v9, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    nop

    :pswitch_data_106
    .packed-switch 0x0
        :pswitch_a0
        :pswitch_f
    .end packed-switch
.end method
