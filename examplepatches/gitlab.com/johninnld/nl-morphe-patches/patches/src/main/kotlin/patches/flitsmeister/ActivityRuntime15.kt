package patches.flitsmeister

/** Genuine secondary activity lifecycles, reconstructed against the publisher 15.0
 * DEX, native member records and complete ordered synthetic-accessor delegates.
 * Preserve UI bindings, observer callbacks, lifecycle behavior and handlers.
 */
internal const val hudActivityOnCreateRegisterCount15 = 13

internal val hudActivityOnCreate15 = """
    invoke-super {p0, p1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->onCreate(Landroid/os/Bundle;)V
    sget-object p1, Landroidx/activity/SystemBarStyle;->Companion:Landroidx/activity/SystemBarStyle${'$'}Companion;
    const/high16 v0, -0x1000000
    invoke-virtual {p1, v0}, Landroidx/activity/SystemBarStyle${'$'}Companion;->dark(I)Landroidx/activity/SystemBarStyle;
    move-result-object p1
    invoke-static {p0, p1, p1}, Landroidx/activity/EdgeToEdge;->enable(Landroidx/activity/ComponentActivity;Landroidx/activity/SystemBarStyle;Landroidx/activity/SystemBarStyle;)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lxf;
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->x1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lfk0;
    const/4 v2, 0x1
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Lfk0;-><init>(Ljava/lang/Object;I)V
    new-instance v3, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v3, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v3}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->E1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Luw4;
    const/4 v3, 0x0
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Luw4;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->M1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lvw4;
    const/16 v10, 0x2
    invoke-direct {v1, p0, v10}, Lvw4;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->I1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Leo;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Leo;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->K1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lsk8;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Lsk8;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->Z:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lxw4;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Lxw4;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->A1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Leg9;
    const/16 v10, 0x0
    invoke-direct {v1, p1, v10}, Leg9;-><init>(Ljava/lang/Object;I)V
    new-instance p1, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {p1, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, p1}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object p1
    iget-object v6, p1, Lii9;->X:Li6f;
    new-instance v9, Lrg9;
    const/4 p1, 0x0
    invoke-direct {v9, p0, p1}, Lrg9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;Lsn4;)V
    sget-object v7, Landroidx/lifecycle/Lifecycle${'$'}Event;->ON_START:Landroidx/lifecycle/Lifecycle${'$'}Event;
    sget-object v8, Landroidx/lifecycle/Lifecycle${'$'}Event;->ON_STOP:Landroidx/lifecycle/Lifecycle${'$'}Event;
    new-instance v4, Ldr8;
    invoke-interface {p0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
    move-result-object v5
    invoke-direct/range {v4 .. v9}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->s1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lfg9;
    const/16 v10, 0x0
    invoke-direct {v1, p0, v10}, Lfg9;-><init>(Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->u1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lmi3;
    const/16 v10, 0x4
    invoke-direct {v1, p0, v10}, Lmi3;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->O1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lax4;
    const/16 v10, 0x2
    invoke-direct {v1, p0, v10}, Lax4;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->w1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Ltn;
    const/16 v10, 0x3
    invoke-direct {v1, p0, v10}, Ltn;-><init>(Ljava/lang/Object;I)V
    new-instance v4, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v4, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v4}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->q1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lbg9;
    const/4 v4, 0x2
    const/16 v10, 0x0
    invoke-direct {v1, p0, v10}, Lbg9;-><init>(Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;I)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->C1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lnk8;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Lnk8;-><init>(Ljava/lang/Object;I)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->G1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lcg9;
    invoke-direct {v1, p0}, Lcg9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->z1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Lew4;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Lew4;-><init>(Ljava/lang/Object;I)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->Q1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Ldg9;
    const/16 v10, 0x0
    invoke-direct {v1, p0, v10}, Ldg9;-><init>(Ljava/lang/Object;I)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->z()Lii9;
    move-result-object v0
    iget-object v0, v0, Lii9;->S1:Landroidx/lifecycle/MutableLiveData;
    new-instance v1, Ltw4;
    const/16 v10, 0x1
    invoke-direct {v1, p0, v10}, Ltw4;-><init>(Ljava/lang/Object;I)V
    new-instance v5, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;
    invoke-direct {v5, v1}, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}c;-><init>(Lu39;)V
    invoke-virtual {v0, p0, v5}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lxf;
    iget-object v1, v0, Lxf;->s:Landroid/widget/TextView;
    new-instance v5, Lsf9;
    invoke-direct {v5, p0}, Lsf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->y:Landroid/widget/TextView;
    new-instance v5, Lqj0;
    const/16 v10, 0x1
    invoke-direct {v5, p0, v10}, Lqj0;-><init>(Landroid/view/KeyEvent${'$'}Callback;I)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->r1:Landroid/widget/TextView;
    new-instance v5, Lrj0;
    const/16 v10, 0x1
    invoke-direct {v5, p0, v10}, Lrj0;-><init>(Landroid/view/KeyEvent${'$'}Callback;I)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->Y:Landroid/widget/TextView;
    new-instance v5, Lsj0;
    const/16 v10, 0x1
    invoke-direct {v5, p0, v10}, Lsj0;-><init>(Landroid/view/KeyEvent${'$'}Callback;I)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->I:Landroid/widget/TextView;
    new-instance v5, Luf9;
    invoke-direct {v5, p0}, Luf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->X:Landroid/widget/TextView;
    new-instance v5, Lwf9;
    invoke-direct {v5, p0}, Lwf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->x:Lcjk;
    iget-object v5, v1, Lcjk;->y:Landroid/widget/ImageButton;
    new-instance v6, Lxf9;
    invoke-direct {v6, p0}, Lxf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v5, v1, Lcjk;->I:Landroid/widget/ImageButton;
    new-instance v6, Lyf9;
    const/16 v10, 0x0
    invoke-direct {v6, p0, v10}, Lyf9;-><init>(Landroid/view/KeyEvent${'$'}Callback;I)V
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v1, Lcjk;->d:Lnl/flitsmeister/fmcore/views/button/MultiButton;
    new-instance v5, Lzf9;
    invoke-direct {v5, p0}, Lzf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v1, v0, Lxf;->q1:Lnl/flitsmeister/features/hud/views/custom/HUDToastView;
    new-instance v5, Lag9;
    const/16 v10, 0x0
    invoke-direct {v5, v0, p0, v10}, Lag9;-><init>(Landroidx/viewbinding/ViewBinding;Landroid/content/Context;I)V
    iput-object v5, v1, Lnl/flitsmeister/features/hud/views/custom/HUDToastView;->I:Lag9;
    iget-object v0, v0, Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;
    new-instance v1, Ltf9;
    invoke-direct {v1, p0}, Ltf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    sget v0, Lvug;->p:I
    add-int/2addr v0, v2
    sput v0, Lvug;->p:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    sput-wide v0, Lvug;->q:J
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0
    if-eqz v0, :cond_0
    const-string v1, "extra_open_reason"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    goto :goto_0
    :cond_0
    move-object v0, p1
    :goto_0
    const-class v1, Lyxf;
    invoke-static {p0, v1}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lyxf;
    invoke-interface {v1}, Lyxf;->v()Lkyf;
    move-result-object v1
    invoke-interface {v1}, Lkyf;->isStarted()Z
    move-result v1
    new-instance v2, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const-string v5, "withActiveRoute"
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
    move-result-object v1
    invoke-direct {v2, v5, v1}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    new-instance v1, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const-string v5, "source"
    invoke-direct {v1, v5, v0}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v2, v1}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v1
    const-string v2, "focus_mode_started"
    invoke-static {p0, v2, v1}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    const-string v1, "manual"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :cond_1
    goto :goto_2
    :cond_1
    const-string v1, "openWhenDriving"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_3
    const-string v1, "openWhenAppStarts"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_3
    const-string v1, "openWhenConnectedToFmDevice"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_3
    const-string v1, "openWhenConnectedToAndroidAuto"
    invoke-static {v0, v1}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_2
    goto :goto_1
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;
    const-string v1, "No valid reason found in intent for opening HUD"
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    const-string v1, "EXTRA_OPEN_REASON is null or invalid"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v2
    invoke-static {v2, v1, v0}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v1
    invoke-virtual {v1, v0}, Lfb8;->c(Ljava/lang/Throwable;)V
    const-string v1, "unknown"
    goto :goto_2
    :cond_3
    :goto_1
    const-string v1, "automatic"
    :goto_2
    iget-object v0, p0, Lnl/flitsmeister/features/hud/views/activities/HUDActivity;->u1:Llob;
    if-eqz v0, :cond_4
    new-instance p1, Lek0;
    const/16 v10, 0x2
    invoke-direct {p1, v1, v10}, Lek0;-><init>(Ljava/lang/Object;I)V
    invoke-interface {v0, p1}, Llob;->b(Lek0;)V
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object p1
    const/16 v0, 0x1006
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lxf;
    iget-object p1, p1, Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;
    new-instance v0, Lof9;
    invoke-direct {v0, p0}, Lof9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    const-wide/16 v1, 0x1f4
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lxf;
    iget-object p1, p1, Lxf;->a:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    new-instance v0, Lvf9;
    invoke-direct {v0, p0}, Lvf9;-><init>(Lnl/flitsmeister/features/hud/views/activities/HUDActivity;)V
    invoke-static {p1, v0}, Lcmk;->e(Landroid/view/View;Ls39;)V
    return-void
    :cond_4
    const-string p0, "marketingPlatform"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw p1
""".trimIndent()

internal const val cropImageActivityOnCreateRegisterCount15 = 15

internal val cropImageActivityOnCreate15 = """
    invoke-super {p0, p1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->onCreate(Landroid/os/Bundle;)V
    const p1, 0x7f060031
    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I
    move-result p1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual {v0, p1}, Landroid/view/Window;->setStatusBarColor(I)V
    const p1, 0x7f0600a0
    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I
    move-result p1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    const/16 v1, 0xff
    invoke-static {p1, v1}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I
    move-result p1
    invoke-virtual {v0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    const/4 v1, 0x1
    invoke-static {p1, v1}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-static {p1, v0}, Landroidx/core/view/WindowCompat;->getInsetsController(Landroid/view/Window;Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;
    move-result-object p1
    const/4 v2, 0x0
    invoke-virtual {p1, v2}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object p1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-static {p1, v0}, Landroidx/core/view/WindowCompat;->getInsetsController(Landroid/view/Window;Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;
    move-result-object p1
    invoke-virtual {p1, v2}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lfjk;
    iget-object p1, p1, Lfjk;->b:Landroid/widget/LinearLayout;
    const/16 v0, 0x9
    const/4 v3, 0x0
    invoke-static {p0, v3, p1, v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->v(Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;Landroid/view/ViewGroup;Landroid/widget/LinearLayout;I)V
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
    const-string v0, "mData"
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object p1
    check-cast p1, Landroid/content/Intent;
    if-eqz p1, :cond_2
    const-string v0, "data"
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p1
    if-eqz p1, :cond_0
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p1
    goto :goto_0
    :cond_0
    move-object p1, v3
    :goto_0
    instance-of v0, p1, Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2
    move-object v3, p1
    check-cast v3, Landroid/graphics/Bitmap;
    goto :goto_1
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v0
    if-eqz v0, :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object p1
    invoke-static {v0, p1}, Landroid/provider/MediaStore${'$'}Images${'$'}Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    goto :goto_1
    :catch_0
    move-exception v0
    move-object p1, v0
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :cond_2
    :goto_1
    if-eqz v3, :cond_7
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lfjk;
    iget-object v5, p1, Lfjk;->c:Lcom/isseiaoki/simplecropview/CropImageView;
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    iget p1, v5, Lcom/isseiaoki/simplecropview/CropImageView;->n2:I
    sget-object v0, Lcom/isseiaoki/simplecropview/CropImageView${'$'}a;->d:Lcom/isseiaoki/simplecropview/CropImageView${'$'}a;
    iput-object v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->T1:Lcom/isseiaoki/simplecropview/CropImageView${'$'}a;
    new-instance v0, Landroid/graphics/PointF;
    const/high16 v2, 0x3f800000    # 1.0f
    invoke-direct {v0, v2, v2}, Landroid/graphics/PointF;-><init>(FF)V
    iput-object v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->d2:Landroid/graphics/PointF;
    iget-object v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;
    if-nez v0, :cond_3
    goto :goto_3
    :cond_3
    iget-boolean v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->x1:Z
    if-eqz v0, :cond_4
    invoke-virtual {v5}, Lcom/isseiaoki/simplecropview/CropImageView;->g()Lkek;
    move-result-object v0
    iget-object v0, v0, Lkek;->a:Landroid/animation/ValueAnimator;
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V
    :cond_4
    new-instance v6, Landroid/graphics/RectF;
    iget-object v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->r1:Landroid/graphics/RectF;
    invoke-direct {v6, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V
    iget-object v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;
    invoke-virtual {v5, v0}, Lcom/isseiaoki/simplecropview/CropImageView;->b(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    move-result-object v11
    iget v0, v11, Landroid/graphics/RectF;->left:F
    iget v2, v6, Landroid/graphics/RectF;->left:F
    sub-float v7, v0, v2
    iget v0, v11, Landroid/graphics/RectF;->top:F
    iget v2, v6, Landroid/graphics/RectF;->top:F
    sub-float v8, v0, v2
    iget v0, v11, Landroid/graphics/RectF;->right:F
    iget v2, v6, Landroid/graphics/RectF;->right:F
    sub-float v9, v0, v2
    iget v0, v11, Landroid/graphics/RectF;->bottom:F
    iget v2, v6, Landroid/graphics/RectF;->bottom:F
    sub-float v10, v0, v2
    iget-boolean v0, v5, Lcom/isseiaoki/simplecropview/CropImageView;->m2:Z
    if-eqz v0, :cond_6
    invoke-virtual {v5}, Lcom/isseiaoki/simplecropview/CropImageView;->g()Lkek;
    move-result-object v0
    new-instance v4, Llb5;
    invoke-direct/range {v4 .. v11}, Llb5;-><init>(Lcom/isseiaoki/simplecropview/CropImageView;Landroid/graphics/RectF;FFFFLandroid/graphics/RectF;)V
    iput-object v4, v0, Lkek;->b:Li2i;
    int-to-long v2, p1
    const-wide/16 v4, 0x0
    cmp-long p1, v2, v4
    iget-object v0, v0, Lkek;->a:Landroid/animation/ValueAnimator;
    if-ltz p1, :cond_5
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    goto :goto_2
    :cond_5
    const-wide/16 v2, 0x96
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    :goto_2
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V
    goto :goto_3
    :cond_6
    iget-object p1, v5, Lcom/isseiaoki/simplecropview/CropImageView;->s1:Landroid/graphics/RectF;
    invoke-virtual {v5, p1}, Lcom/isseiaoki/simplecropview/CropImageView;->b(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    move-result-object p1
    iput-object p1, v5, Lcom/isseiaoki/simplecropview/CropImageView;->r1:Landroid/graphics/RectF;
    invoke-virtual {v5}, Landroid/view/View;->invalidate()V
    :goto_3
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lfjk;
    iget-object p1, p1, Lfjk;->q:Landroid/widget/ImageButton;
    new-instance v0, Lgb5;
    const/16 v12, 0x0
    invoke-direct {v0, p0, v12}, Lgb5;-><init>(Ljava/lang/Object;I)V
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p1
    check-cast p1, Lfjk;
    iget-object p1, p1, Lfjk;->d:Landroidx/appcompat/widget/AppCompatButton;
    new-instance v0, Lhb5;
    const/16 v12, 0x0
    invoke-direct {v0, p0, v12}, Lhb5;-><init>(Ljava/lang/Object;I)V
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    invoke-virtual {p0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lfjk;
    iget-object p0, p0, Lfjk;->s:Landroidx/compose/ui/platform/ComposeView;
    sget-object p1, Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnViewTreeLifecycleDestroyed;->INSTANCE:Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnViewTreeLifecycleDestroyed;
    invoke-virtual {p0, p1}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
    new-instance p1, Lib5;
    const/16 v12, 0x0
    invoke-direct {p1, p0, v12}, Lib5;-><init>(Ljava/lang/Object;I)V
    const v0, 0x3bb3090f
    invoke-static {v0, v1, p1}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
    move-result-object p1
    invoke-virtual {p0, p1}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
    return-void
    :cond_7
    invoke-virtual {p0, v2}, Landroid/app/Activity;->setResult(I)V
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
""".trimIndent()

internal const val citsParkingActivityOnResumeRegisterCount15 = 21

internal val citsParkingActivityOnResume15 = """
    move-object/from16 v1, p0
    invoke-super {v1}, Lnl/flitsmeister/controllers/activities/base/BaseActivity;->onResume()V
    invoke-virtual {v1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Llf;
    iget-object v0, v0, Llf;->s1:Landroid/widget/LinearLayout;
    iget-object v2, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    sget-object v3, Lrz2;->a:Lrz2;
    const/4 v6, 0x0
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    const/4 v4, 0x1
    const-wide/16 v7, 0x0
    if-nez v2, :cond_0
    :goto_0
    move v5, v6
    goto :goto_2
    :cond_0
    sget-object v5, Lxc0;->V:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v5, v3}, Lxc0;->c(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;Ljava/lang/Integer;)Ljava/lang/Integer;
    move-result-object v5
    sget-object v9, Lxc0;->W:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v9, v3}, Lxc0;->c(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;Ljava/lang/Integer;)Ljava/lang/Integer;
    move-result-object v9
    sget-object v10, Lxc0;->X:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v10, v3}, Lxc0;->c(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;Ljava/lang/Integer;)Ljava/lang/Integer;
    move-result-object v3
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxHeightCm()D
    move-result-wide v10
    cmpl-double v10, v10, v7
    if-lez v10, :cond_1
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I
    move-result v5
    int-to-double v10, v5
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxHeightCm()D
    move-result-wide v12
    cmpl-double v5, v10, v12
    if-lez v5, :cond_1
    move v5, v6
    goto :goto_1
    :cond_1
    move v5, v4
    :goto_1
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxWidthCm()D
    move-result-wide v10
    cmpl-double v10, v10, v7
    if-lez v10, :cond_2
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I
    move-result v9
    int-to-double v9, v9
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxWidthCm()D
    move-result-wide v11
    cmpl-double v9, v9, v11
    if-lez v9, :cond_2
    move v5, v6
    :cond_2
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxWeightKg()D
    move-result-wide v9
    cmpl-double v9, v9, v7
    if-lez v9, :cond_3
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    move-result v3
    int-to-double v9, v3
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxWeightKg()D
    move-result-wide v11
    cmpl-double v3, v9, v11
    if-lez v3, :cond_3
    move v5, v6
    :cond_3
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getCapacity()I
    move-result v2
    if-nez v2, :cond_4
    goto :goto_0
    :cond_4
    :goto_2
    const/16 v2, 0x8
    if-nez v5, :cond_5
    move v3, v6
    goto :goto_3
    :cond_5
    move v3, v2
    :goto_3
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V
    invoke-virtual {v1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Llf;
    iget-object v3, v0, Llf;->s:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    iget-object v5, v0, Llf;->q1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    iget-object v9, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    const-string v10, ""
    if-eqz v9, :cond_6
    invoke-virtual {v9}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getName()Ljava/lang/String;
    move-result-object v9
    if-eqz v9, :cond_6
    goto :goto_4
    :cond_6
    move-object v9, v10
    :goto_4
    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    iget-object v0, v0, Llf;->p1:Landroid/widget/TextView;
    const v5, 0x7f14028b
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    iget-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    const/4 v5, -0x1
    if-eqz v0, :cond_7
    invoke-virtual {v0}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getCapacity()I
    move-result v0
    goto :goto_5
    :cond_7
    move v0, v5
    :goto_5
    invoke-virtual {v1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v9
    check-cast v9, Llf;
    iget-object v9, v9, Llf;->I:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    const/4 v11, 0x0
    if-eq v0, v5, :cond_9
    if-eqz v0, :cond_8
    invoke-virtual {v9, v11}, Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;->e(Ljava/lang/Integer;)V
    const v5, 0x7f14089d
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    new-instance v12, Ljava/lang/StringBuilder;
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    filled-new-array {v0}, [Ljava/lang/Object;
    move-result-object v0
    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
    move-result-object v0
    invoke-static {v5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :goto_6
    :cond_8
    const v0, 0x7f060707
    invoke-static {v1, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I
    move-result v0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    invoke-virtual {v9, v0}, Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;->e(Ljava/lang/Integer;)V
    const v0, 0x7f140870
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :goto_6
    :cond_9
    invoke-virtual {v9, v11}, Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;->e(Ljava/lang/Integer;)V
    const v0, 0x7f14089a
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :goto_6
    iget-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    if-eqz v0, :cond_a
    invoke-virtual {v0}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getAddress()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :cond_b
    :cond_a
    move-object v0, v10
    :cond_b
    invoke-static {v0}, Luli;->a(Ljava/lang/CharSequence;)Z
    move-result v0
    if-nez v0, :cond_c
    move v2, v6
    :cond_c
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V
    iget-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    if-eqz v0, :cond_d
    invoke-virtual {v0}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getAddress()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :cond_d
    goto :goto_7
    :cond_d
    move-object v0, v10
    :goto_7
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Llf;
    iget-object v2, v0, Llf;->x1:Landroid/widget/LinearLayout;
    iget-object v3, v0, Llf;->o1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    iget-object v5, v0, Llf;->Y:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    iget-object v9, v0, Llf;->w1:Landroid/widget/LinearLayout;
    iget-object v12, v0, Llf;->t1:Landroid/widget/LinearLayout;
    iget-object v13, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    if-nez v13, :cond_e
    goto/16 :goto_d
    :cond_e
    invoke-virtual {v13, v1}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getPricingDescription(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v14
    invoke-static {v14}, Luli;->a(Ljava/lang/CharSequence;)Z
    move-result v15
    if-nez v15, :cond_f
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V
    iget-object v15, v0, Llf;->r1:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    invoke-virtual {v15, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :cond_f
    invoke-virtual {v13, v1}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getLocalizedOpeningHours(Landroid/content/Context;)Ljava/util/Map;
    move-result-object v14
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-interface {v14}, Ljava/util/Map;->isEmpty()Z
    move-result v15
    move-wide/from16 v16, v7
    const v7, 0x7f14022b
    const v8, 0x7f1402d0
    const v11, 0x7f1402d1
    if-nez v15, :cond_12
    invoke-virtual {v12, v6}, Landroid/view/View;->setVisibility(I)V
    invoke-interface {v14}, Ljava/util/Map;->entrySet()Ljava/util/Set;
    move-result-object v14
    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v14
    :goto_8
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z
    move-result v15
    if-eqz v15, :cond_10
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/util/Map${'$'}Entry;
    invoke-interface {v15}, Ljava/util/Map${'$'}Entry;->getKey()Ljava/lang/Object;
    move-result-object v18
    move/from16 v19, v4
    move-object/from16 v4, v18
    check-cast v4, Ljava/lang/String;
    invoke-interface {v15}, Ljava/util/Map${'$'}Entry;->getValue()Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v1, v4, v15, v6}, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->z(Ljava/lang/String;Ljava/lang/String;Z)V
    move/from16 v4, v19
    goto :goto_8
    :cond_10
    move/from16 v19, v4
    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->isExitPossible()Z
    move-result v8
    if-eqz v8, :cond_11
    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v7
    goto :goto_9
    :cond_11
    invoke-virtual {v1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v7
    :goto_9
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->isExitPossible()Z
    move-result v8
    xor-int/lit8 v8, v8, 0x1
    invoke-virtual {v1, v4, v7, v8}, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->z(Ljava/lang/String;Ljava/lang/String;Z)V
    goto :goto_a
    :cond_12
    move/from16 v19, v4
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->isExitPossible()Z
    move-result v4
    if-eqz v4, :cond_13
    invoke-virtual {v12, v6}, Landroid/view/View;->setVisibility(I)V
    const v4, 0x7f14026d
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v14
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move/from16 v15, v19
    invoke-virtual {v1, v4, v14, v15}, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->z(Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v1, v4, v7, v6}, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->z(Ljava/lang/String;Ljava/lang/String;Z)V
    :cond_13
    :goto_a
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxHeightM()D
    move-result-wide v7
    cmpl-double v4, v7, v16
    if-gtz v4, :cond_14
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getTotalCapacity()I
    move-result v4
    if-lez v4, :cond_17
    :cond_14
    invoke-virtual {v9, v6}, Landroid/view/View;->setVisibility(I)V
    iget-object v4, v0, Llf;->X:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    const v7, 0x7f14086b
    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxHeightM()D
    move-result-wide v7
    cmpl-double v4, v7, v16
    const v7, 0x7f0605af
    if-lez v4, :cond_15
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getMaxHeightM()D
    move-result-wide v14
    const v4, 0x7f14070c
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v8, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :goto_b
    :cond_15
    invoke-static {v1, v7}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I
    move-result v4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual {v5, v4}, Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;->e(Ljava/lang/Integer;)V
    invoke-virtual {v1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :goto_b
    iget-object v4, v0, Llf;->Z:Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;
    const v5, 0x7f140299
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getTotalCapacity()I
    move-result v4
    if-lez v4, :cond_16
    invoke-virtual {v13}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getTotalCapacity()I
    move-result v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    goto :goto_c
    :cond_16
    invoke-static {v1, v7}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I
    move-result v4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual {v3, v4}, Lnl/flitsmeister/fmcore/views/nightmode/NightmodeTextView;->e(Ljava/lang/Integer;)V
    invoke-virtual {v1, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :cond_17
    :goto_c
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I
    move-result v3
    if-eqz v3, :cond_18
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I
    move-result v3
    if-nez v3, :cond_19
    :cond_18
    iget-object v3, v0, Llf;->y1:Landroid/view/View;
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V
    :cond_19
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I
    move-result v3
    if-nez v3, :cond_1a
    iget-object v3, v0, Llf;->v1:Landroid/view/View;
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V
    :cond_1a
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I
    move-result v2
    if-eqz v2, :cond_1b
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I
    move-result v2
    if-eqz v2, :cond_1b
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I
    move-result v2
    if-nez v2, :cond_1c
    :cond_1b
    iget-object v0, v0, Llf;->d:Landroid/view/View;
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V
    :cond_1c
    :goto_d
    iget-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->q1:Lnl/flitsmeister/fmcore/models/data/destinations/Destination;
    if-nez v0, :cond_20
    new-instance v0, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;
    invoke-direct {v0}, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;-><init>()V
    iget-object v2, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    if-eqz v2, :cond_1d
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;->getLocation()Landroid/location/Location;
    move-result-object v2
    if-eqz v2, :cond_1d
    invoke-virtual {v0, v2}, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;->setLocation(Landroid/location/Location;)V
    :cond_1d
    iget-object v2, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    if-eqz v2, :cond_1f
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getName()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :cond_1e
    goto :goto_e
    :cond_1e
    move-object v10, v2
    :cond_1f
    :goto_e
    invoke-virtual {v0, v10}, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;->setLocationName(Ljava/lang/String;)V
    invoke-virtual {v0, v6}, Lnl/flitsmeister/fmcore/models/data/destinations/Destination;->setDestinationGroupEnum(I)V
    iput-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->q1:Lnl/flitsmeister/fmcore/models/data/destinations/Destination;
    :cond_20
    sget-object v2, Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;->PARKING_DETAILS:Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;
    iget-object v0, v1, Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;->p1:Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    sget-object v9, Lnza;->b:Landroid/location/Location;
    if-nez v9, :cond_21
    goto :goto_15
    :cond_21
    new-instance v3, Lbemobile/cits/sdk/core/model/request/MonitoringEvent;
    if-eqz v0, :cond_23
    invoke-virtual {v0}, Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;->getId()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :cond_22
    goto :goto_10
    :cond_22
    :goto_f
    move-object v11, v4
    goto :goto_11
    :cond_23
    :goto_10
    invoke-static {}, Lmlc;->a()Ljava/lang/String;
    move-result-object v4
    goto :goto_f
    :goto_11
    if-eqz v0, :cond_25
    invoke-virtual {v0}, Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;->getLocation()Landroid/location/Location;
    move-result-object v4
    if-nez v4, :cond_24
    goto :goto_12
    :cond_24
    move-object v12, v4
    goto :goto_13
    :cond_25
    :goto_12
    move-object v12, v9
    :goto_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v13
    const/16 v16, 0x8
    const/16 v17, 0x0
    const/4 v15, 0x0
    move-object v10, v3
    invoke-direct/range {v10 .. v17}, Lbemobile/cits/sdk/core/model/request/MonitoringEvent;-><init>(Ljava/lang/String;Landroid/location/Location;JLjava/lang/Integer;ILr66;)V
    new-instance v4, Lbemobile/cits/sdk/core/model/request/MonitoringAlert;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v10
    if-eqz v0, :cond_26
    invoke-virtual {v0, v1}, Lnl/flitsmeister/fmcore/models/data/cits/CitsParking;->getShortDescription(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    move-object v12, v0
    goto :goto_14
    :cond_26
    const/4 v12, 0x0
    :goto_14
    const/4 v13, 0x1
    const/4 v14, 0x0
    const/4 v8, 0x0
    move-object v7, v4
    invoke-direct/range {v7 .. v14}, Lbemobile/cits/sdk/core/model/request/MonitoringAlert;-><init>(Ljava/lang/String;Landroid/location/Location;JLjava/lang/String;ILr66;)V
    new-instance v0, Lkotlin/Pair;
    const-string v5, "status"
    const-string v7, "function called"
    invoke-direct {v0, v5, v7}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    invoke-static {v0}, Lbob;->b(Lkotlin/Pair;)Ljava/util/Map;
    move-result-object v0
    const-string v5, "gmp_ttme_status"
    invoke-static {v1, v5, v0}, Llp0;->m(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    new-instance v0, Lcz2;
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, Lcz2;-><init>(Landroid/content/Context;Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;Lbemobile/cits/sdk/core/model/request/MonitoringEvent;Lbemobile/cits/sdk/core/model/request/MonitoringAlert;Lsn4;)V
    sget-object v2, Ln37;->a:Lre6;
    invoke-static {v2, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    :goto_15
    invoke-virtual {v1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Llf;
    iget-object v2, v0, Llf;->y:Landroid/widget/TextView;
    new-instance v3, Llz2;
    invoke-direct {v3, v1, v6}, Llz2;-><init>(Ljava/lang/Object;I)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v2, v0, Llf;->x:Landroid/widget/TextView;
    new-instance v3, Lkz2;
    invoke-direct {v3, v0, v6}, Lkz2;-><init>(Ljava/lang/Object;I)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v2, v0, Llf;->c:Landroidx/appcompat/widget/AppCompatButton;
    new-instance v3, Ljz2;
    invoke-direct {v3, v1}, Ljz2;-><init>(Lnl/flitsmeister/controllers/activities/citsParking/CitsParkingActivity;)V
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    iget-object v0, v0, Llf;->b:Landroidx/appcompat/widget/AppCompatButton;
    new-instance v2, Lmz2;
    invoke-direct {v2, v1, v6}, Lmz2;-><init>(Ljava/lang/Object;I)V
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
    return-void
""".trimIndent()

internal const val insiderLoginActivityOnCreateRegisterCount15 = 10

internal val insiderLoginActivityOnCreate15 = """
    const-string v0, "connect_wizard"
    const-string v1, "insider"
    const-string v2, ""
    :try_start_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
    invoke-static {}, Lcdl;->h()Lcdl;
    move-result-object p1
    invoke-virtual {p1}, Lcdl;->f()Lmal;
    move-result-object p1
    check-cast p1, Lbbl;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v3
    iput-object v3, p1, Lbbl;->a:Landroid/content/Context;
    invoke-virtual {p1}, Lbbl;->d()V
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p1
    if-eqz p1, :cond_f
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v3
    if-nez v3, :cond_0
    goto/16 :goto_5
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object p1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :cond_e
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :cond_1
    goto/16 :goto_4
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    move-result-object v3
    const-string v4, "/"
    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v3
    iget-object v4, p0, Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    if-eqz v5, :cond_d
    invoke-virtual {v5, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :cond_d
    invoke-virtual {v5}, Ljava/lang/String;->length()I
    move-result v4
    const/4 v5, 0x7
    if-le v4, v5, :cond_d
    iget-object v4, p0, Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    const-string v6, "test_device"
    if-nez v4, :cond_2
    :try_start_1
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :cond_d
    :cond_2
    iget-object v4, p0, Lcom/useinsider/insider/InsiderLoginActivity;->a:Lhdl;
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    if-eqz v5, :cond_7
    if-eqz v3, :cond_7
    invoke-virtual {v3}, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :cond_3
    goto :goto_0
    :cond_3
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :cond_5
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :cond_4
    goto :goto_0
    :cond_4
    sget-object v4, Lhdl;->c:Ljava/util/regex/Pattern;
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v4
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z
    move-result v4
    goto :goto_1
    :cond_5
    sget-object v4, Lhdl;->a:Ljava/util/regex/Pattern;
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v4
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z
    move-result v4
    if-nez v4, :cond_6
    sget-object v4, Lhdl;->b:Ljava/util/regex/Pattern;
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v4
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z
    move-result v4
    if-eqz v4, :cond_7
    :cond_6
    const/4 v4, 0x1
    goto :goto_1
    :cond_7
    :goto_0
    const/4 v4, 0x0
    :goto_1
    if-nez v4, :cond_8
    goto :goto_3
    :cond_8
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I
    move-result v5
    const v7, -0x28c4115d
    if-eq v5, v7, :cond_a
    const p1, 0x4828ce60    # 172857.5f
    if-eq v5, p1, :cond_9
    goto :goto_2
    :cond_9
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :cond_b
    sput-object v3, Ldlc;->a:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/useinsider/insider/InsiderLoginActivity;->a()V
    goto :goto_2
    :catch_0
    move-exception p1
    goto :goto_6
    :cond_a
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_b
    invoke-virtual {p0}, Lcom/useinsider/insider/InsiderLoginActivity;->a()V
    sput-object v3, Ldlc;->c:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;
    move-result-object p1
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object p1
    sput-object p1, Ldlc;->d:Ljava/lang/String;
    :cond_b
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
    move-result p1
    if-nez p1, :cond_c
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :cond_c
    return-void
    :cond_d
    :goto_3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
    :cond_e
    :goto_4
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
    :cond_f
    :goto_5
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    return-void
    :goto_6
    sget-object v0, Lcom/useinsider/insider/Insider;->Instance:Lcom/useinsider/insider/Insider;
    invoke-virtual {v0, p1}, Lcom/useinsider/insider/Insider;->putException(Ljava/lang/Exception;)V
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    return-void
""".trimIndent()
