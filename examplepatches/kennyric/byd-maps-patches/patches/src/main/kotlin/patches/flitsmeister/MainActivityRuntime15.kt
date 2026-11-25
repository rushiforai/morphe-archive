package patches.flitsmeister

/**
 * MainActivity startup recovered from the 14.17 direct lifecycle body.
 *
 * The 15.0 constructor/delegate bodies establish field and class identities;
 * coroutine metadata and individual R8 switch branches establish callback
 * identities, constructor captures and discriminator values. Keep all original
 * lifecycle, view, observer, subscription and preference behavior. The obsolete
 * report-button composition is excluded: in 15.0 SearchBottomSheetCoordinator
 * owns the replacement combined header and initializes its composition itself.
 * Exact outgoing member signatures are checked against the publisher DEX.
 */
internal val mainActivityOnCreate15 = """
move-object/from16 v0, p0
invoke-super/range {p0 .. p1}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->onCreate(Landroid/os/Bundle;)V
const v1, 0x7f010027
invoke-static {v0, v1, v1}, Lhh;->a(Landroid/app/Activity;II)V
invoke-static {v0}, Lorg/maplibre/android/MapLibre;->getInstance(Landroid/content/Context;)Lorg/maplibre/android/MapLibre;
invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
move-result-object v1
const/16 v2, 0x200
invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V
invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
move-result-object v2
const/4 v3, 0x1
iput v3, v2, Landroid/view/WindowManager${'$'}LayoutParams;->layoutInDisplayCutoutMode:I
const/4 v2, 0x0
invoke-static {v1, v2}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V
invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V
invoke-virtual {v1, v2}, Landroid/view/Window;->setNavigationBarColor(I)V
invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
move-result-object v1
const-string v4, "SHOW_HUD_KEY"
invoke-virtual {v1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
move-result v1
if-eqz v1, :cond_0
invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
move-result-object v1
invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
move-result v1
iput-boolean v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->G1:Z
:cond_0
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->D()V
invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;
move-result-object v1
const-string v4, "dimen"
const-string v5, "android"
const/4 v6, 0x0
sget-object v6, Landroidx/sqlite/util/Zcx/StDI;->DkYkJVzdP:Ljava/lang/String;
invoke-virtual {v1, v6, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
move-result v1
if-lez v1, :cond_2
invoke-static {v0}, Lehd;->a(Landroid/content/Context;)Z
move-result v4
if-eqz v4, :cond_1
move v1, v2
goto :goto_0
:cond_1
invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;
move-result-object v4
invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
move-result v1
:goto_0
iput v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->r1:I
:cond_2
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget v4, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->r1:I
iget-object v5, v1, Lnl/flitsmeister/fmx/activities/main/k;->o2:Landroidx/lifecycle/MutableLiveData;
invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
move-result-object v4
invoke-virtual {v5, v4}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V
invoke-virtual {v1}, Lnl/flitsmeister/fmx/activities/main/k;->i()V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->q1:Lag;
iget-object v4, v1, Lag;->X:Landroid/view/View;
new-instance v5, Lcaa;
const v6, 0x7f060031
invoke-static {v0, v6}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I
move-result v6
const-wide v7, 0x403a99999999999aL    # 26.6
invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
move-result-object v7
invoke-static {v7}, Ld8;->b(Ljava/lang/Number;)I
move-result v7
invoke-direct {v5, v6, v7}, Lcaa;-><init>(II)V
invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
iget-object v4, v1, Lag;->b:Landroid/widget/LinearLayout;
new-instance v5, Lf4b;
invoke-direct {v5, v0}, Lf4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
iget-object v4, v1, Lag;->x:Landroid/widget/LinearLayout;
new-instance v5, Lm4b;
invoke-direct {v5, v0}, Lm4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
iget-object v4, v1, Lag;->I:Landroid/widget/ImageView;
iget-object v5, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->R1:Le68;
const/4 v6, 0x0
if-eqz v5, :cond_25
invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V
new-instance v5, Lsi8;
invoke-direct {v5, v0, v3}, Lsi8;-><init>(Ljava/lang/Object;I)V
invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
invoke-static {v0}, Landroidx/lifecycle/LifecycleOwnerKt;->getLifecycleScope(Landroidx/lifecycle/LifecycleOwner;)Landroidx/lifecycle/LifecycleCoroutineScope;
move-result-object v4
new-instance v5, Lnl/flitsmeister/fmx/activities/main/b;
invoke-direct {v5, v0, v1, v6}, Lnl/flitsmeister/fmx/activities/main/b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lag;Lsn4;)V
const/4 v7, 0x3
invoke-static {v4, v6, v6, v5, v7}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
iget-object v4, v1, Lag;->q:Landroid/widget/ImageView;
new-instance v5, Lc5b;
invoke-direct {v5, v1, v0}, Lc5b;-><init>(Lag;Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v10, v1, Lnl/flitsmeister/fmx/activities/main/k;->M3:Li6f;
new-instance v13, Ln6b;
invoke-direct {v13, v0, v6}, Ln6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
sget-object v17, Landroidx/lifecycle/Lifecycle${'$'}Event;->ON_START:Landroidx/lifecycle/Lifecycle${'$'}Event;
sget-object v18, Landroidx/lifecycle/Lifecycle${'$'}Event;->ON_STOP:Landroidx/lifecycle/Lifecycle${'$'}Event;
new-instance v8, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v9
move-object/from16 v11, v17
move-object/from16 v12, v18
invoke-direct/range {v8 .. v13}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->Y:Landroidx/compose/ui/platform/ComposeView;
sget-object v4, Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnDetachedFromWindow;->INSTANCE:Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnDetachedFromWindow;
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v5, Lgl;
invoke-direct {v5, v0, v3}, Lgl;-><init>(Ljava/lang/Object;I)V
const v8, -0x4e335576
invoke-static {v8, v3, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v5
invoke-virtual {v1, v5}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->u1:Landroidx/compose/ui/platform/ComposeView;
if-eqz v1, :cond_3
new-instance v5, Lph8;
invoke-direct {v5, v0, v3}, Lph8;-><init>(Ljava/lang/Object;I)V
const v8, -0x4cff0559
invoke-static {v8, v3, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v5
invoke-virtual {v1, v5}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
:cond_3
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->s:Landroidx/compose/ui/platform/ComposeView;
new-instance v5, Ld9f;
invoke-direct {v5}, Ld9f;-><init>()V
sget v8, Lm65;->b:I
iput v8, v5, Ld9f;->a:I
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v8, Lp4b;
invoke-direct {v8, v0, v5}, Lp4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Ld9f;)V
const v5, -0xc1fe20e
invoke-static {v5, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v5
invoke-virtual {v1, v5}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->b:Landroidx/compose/ui/platform/ComposeView;
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v4, Lh4b;
invoke-direct {v4, v0}, Lh4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v5, 0x643148d9
invoke-static {v5, v3, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v4
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
sget-object v1, Lnl/flitsmeister/managers/ble/BleDeviceManager;->Companion:Lnl/flitsmeister/managers/ble/BleDeviceManager${'$'}Companion;
invoke-virtual {v1, v0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
move-result-object v1
check-cast v1, Lnl/flitsmeister/managers/ble/BleDeviceManager;
invoke-virtual {v1}, Lnl/flitsmeister/managers/ble/BleDeviceManager;->getPairedTypes()Ljava/util/List;
move-result-object v1
sget-object v4, Lnl/flitsmeister/fmcore/data/enums/FMDeviceVersion;->TWO:Lnl/flitsmeister/fmcore/data/enums/FMDeviceVersion;
invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
move-result v1
if-eqz v1, :cond_4
const v4, 0x7f140c41
goto :goto_1
:cond_4
const v4, 0x7f140c40
:goto_1
if-eqz v1, :cond_5
const v1, 0x7f140819
goto :goto_2
:cond_5
const v1, 0x7f140a5f
:goto_2
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v5
iget-object v5, v5, Lnl/flitsmeister/fmx/activities/main/k;->G3:Liji;
new-instance v8, Lx6b;
invoke-direct {v8, v0, v4, v1, v6}, Lx6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;IILsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v5
move-object/from16 v19, v8
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
invoke-static {v1}, Landroidx/lifecycle/ViewModelKt;->getViewModelScope(Landroidx/lifecycle/ViewModel;)Lq45;
move-result-object v4
new-instance v5, Lkcb;
invoke-direct {v5, v1, v6}, Lkcb;-><init>(Lnl/flitsmeister/fmx/activities/main/k;Lsn4;)V
invoke-static {v4, v6, v6, v5, v7}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->D1:Landroidx/lifecycle/ViewModelLazy;
invoke-interface {v1}, Lwja;->getValue()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lifc;
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
invoke-static {v1}, Landroidx/lifecycle/ViewModelKt;->getViewModelScope(Landroidx/lifecycle/ViewModel;)Lq45;
move-result-object v4
new-instance v5, Lgfc;
invoke-direct {v5, v1, v6}, Lgfc;-><init>(Lifc;Lsn4;)V
invoke-static {v4, v6, v6, v5, v7}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
iget-object v4, v1, Lnl/flitsmeister/fmx/activities/main/k;->I3:Li6f;
new-instance v5, Lw7b;
invoke-direct {v5, v0, v1, v6}, Lw7b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lnl/flitsmeister/fmx/activities/main/k;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v4
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
iget-object v4, v1, Lnl/flitsmeister/fmx/activities/main/k;->K3:Li6f;
new-instance v5, Lx7b;
invoke-direct {v5, v0, v1, v6}, Lx7b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lnl/flitsmeister/fmx/activities/main/k;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v4
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->y1:Landroidx/compose/ui/platform/ComposeView;
sget-object v4, Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnViewTreeLifecycleDestroyed;->INSTANCE:Landroidx/compose/ui/platform/ViewCompositionStrategy${'$'}DisposeOnViewTreeLifecycleDestroyed;
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v5, Lg4b;
invoke-direct {v5, v0}, Lg4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v8, -0x5be1a67e
invoke-static {v8, v3, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v5
invoke-virtual {v1, v5}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v5
check-cast v5, Lzf;
iget-object v5, v5, Lzf;->x1:Landroidx/compose/ui/platform/ComposeView;
if-eqz v5, :cond_6
new-instance v8, Ly7b;
invoke-direct {v8, v1, v0}, Ly7b;-><init>(Lnl/flitsmeister/fmx/activities/main/k;Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v1, 0x2aff41a
invoke-static {v1, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v1
invoke-virtual {v5, v1}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
:cond_6
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->s1:Landroidx/compose/ui/platform/ComposeView;
new-instance v5, Li4b;
invoke-direct {v5, v0}, Li4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v8, 0x146a0a63
invoke-static {v8, v3, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v5
invoke-virtual {v1, v5}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->k4:Low1;
invoke-static {v1}, Lyo8;->c(Low1;)Lxr2;
move-result-object v16
new-instance v1, Lq6b;
invoke-direct {v1, v0, v6}, Lq6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v19, v1
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->J2:Landroidx/lifecycle/MutableLiveData;
new-instance v5, Lss5;
invoke-direct {v5, v0, v3}, Lss5;-><init>(Ljava/lang/Object;I)V
new-instance v8, Lo7b;
invoke-direct {v8, v5}, Lo7b;-><init>(Lu39;)V
invoke-virtual {v1, v0, v8}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->u3:Landroidx/lifecycle/MutableLiveData;
new-instance v5, Lkf3;
const/4 v8, 0x2
invoke-direct {v5, v0, v8}, Lkf3;-><init>(Ljava/lang/Object;I)V
new-instance v8, Lo7b;
invoke-direct {v8, v5}, Lo7b;-><init>(Lu39;)V
invoke-virtual {v1, v0, v8}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->B()Lnl/flitsmeister/content/presentation/top_content/signal/SignalViewModel;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/content/presentation/top_content/signal/SignalViewModel;->x:Landroidx/lifecycle/MutableLiveData;
new-instance v5, Lqu4;
invoke-direct {v5, v0, v3}, Lqu4;-><init>(Ljava/lang/Object;I)V
new-instance v8, Lo7b;
invoke-direct {v8, v5}, Lo7b;-><init>(Lu39;)V
invoke-virtual {v1, v0, v8}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->B()Lnl/flitsmeister/content/presentation/top_content/signal/SignalViewModel;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/content/presentation/top_content/signal/SignalViewModel;->Y:Landroidx/lifecycle/MutableLiveData;
new-instance v5, Ly4b;
invoke-direct {v5, v0, v2}, Ly4b;-><init>(Ljava/lang/Object;I)V
new-instance v8, Lo7b;
invoke-direct {v8, v5}, Lo7b;-><init>(Lu39;)V
invoke-virtual {v1, v0, v8}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->R2:Lhji;
new-instance v5, Lnl/flitsmeister/fmx/activities/main/c;
invoke-direct {v5, v0, v6}, Lnl/flitsmeister/fmx/activities/main/c;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v1
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->f3:Li6f;
new-instance v5, Lr6b;
invoke-direct {v5, v0, v6}, Lr6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v1
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->w3:Landroidx/lifecycle/MutableLiveData;
new-instance v5, Llf3;
const/4 v8, 0x2
invoke-direct {v5, v0, v8}, Llf3;-><init>(Ljava/lang/Object;I)V
new-instance v8, Lo7b;
invoke-direct {v8, v5}, Lo7b;-><init>(Lu39;)V
invoke-virtual {v1, v0, v8}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V
sget-object v1, Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;
invoke-virtual {v1}, Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;->getDarkThemeFlow()Lhji;
move-result-object v16
new-instance v1, Ls6b;
invoke-direct {v1, v0, v6}, Ls6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v19, v1
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->u1:Landroidx/lifecycle/ViewModelLazy;
invoke-interface {v1}, Lwja;->getValue()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lljj;
iget-object v1, v1, Lljj;->y:Lh6f;
new-instance v5, Lt6b;
invoke-direct {v5, v0, v6}, Lt6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
move-object/from16 v16, v1
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->h2:Li6f;
invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
new-instance v5, Lo6b;
invoke-direct {v5, v0, v6}, Lo6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
move-object/from16 v16, v1
move-object/from16 v19, v5
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->z1:Lnl/flitsmeister/views/NonSwipeableViewPager;
iget-object v5, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->h2:Lfti;
invoke-virtual {v5}, Lfti;->getValue()Ljava/lang/Object;
move-result-object v5
check-cast v5, Lp1i;
invoke-virtual {v1, v5}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
const/4 v5, 0x2
invoke-virtual {v1, v5}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->t1:Landroidx/compose/ui/platform/ComposeView;
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v8, Lj4b;
invoke-direct {v8, v0}, Lj4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v9, 0x7aed4cc1
invoke-static {v9, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v8
invoke-virtual {v1, v8}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->c:Lyf;
iget-object v1, v1, Lyf;->b:Landroidx/compose/ui/platform/ComposeView;
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v8, Lb6b;
invoke-direct {v8, v0, v2}, Lb6b;-><init>(Ljava/lang/Object;I)V
const v9, -0x207052e3
invoke-static {v9, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v8
invoke-virtual {v1, v8}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->X:Landroidx/compose/ui/platform/ComposeView;
if-eqz v1, :cond_7
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v8, Lc6b;
invoke-direct {v8, v0, v1}, Lc6b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Landroidx/compose/ui/platform/ComposeView;)V
const v9, -0x7e4ab862
invoke-static {v9, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v8
invoke-virtual {v1, v8}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
:cond_7

invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v1
check-cast v1, Lzf;
iget-object v1, v1, Lzf;->I:Landroidx/compose/ui/platform/ComposeView;
if-eqz v1, :cond_8
invoke-virtual {v1, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v8, Lbl2;
invoke-direct {v8, v0, v3}, Lbl2;-><init>(Ljava/lang/Object;I)V
const v9, -0x1a5eb237
invoke-static {v9, v3, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v8
invoke-virtual {v1, v8}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
:cond_8
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->z1:Landroidx/lifecycle/ViewModelLazy;
invoke-interface {v1}, Lwja;->getValue()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lvzc;
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
sget v8, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
const/16 v9, 0x21
if-ge v8, v9, :cond_9
goto :goto_3
:cond_9
invoke-virtual {v0}, Lnl/flitsmeister/controllers/activities/base/BaseViewBindingActivity;->x()Landroidx/viewbinding/ViewBinding;
move-result-object v8
check-cast v8, Lzf;
iget-object v8, v8, Lzf;->x:Landroidx/compose/ui/platform/ComposeView;
invoke-virtual {v8, v4}, Landroidx/compose/ui/platform/AbstractComposeView;->setViewCompositionStrategy(Landroidx/compose/ui/platform/ViewCompositionStrategy;)V
new-instance v4, Lp7b;
invoke-direct {v4, v1, v0}, Lp7b;-><init>(Lvzc;Lnl/flitsmeister/fmx/activities/main/MainActivity;)V
const v1, 0x6e44ff65
invoke-static {v1, v3, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;
move-result-object v1
invoke-virtual {v8, v1}, Landroidx/compose/ui/platform/ComposeView;->setContent(Li49;)V
:goto_3
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->v1:Landroidx/lifecycle/ViewModelLazy;
invoke-interface {v1}, Lwja;->getValue()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lcxf;
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
invoke-static {v1}, Landroidx/lifecycle/ViewModelKt;->getViewModelScope(Landroidx/lifecycle/ViewModel;)Lq45;
move-result-object v4
new-instance v8, Ldxf;
invoke-direct {v8, v1, v6}, Ldxf;-><init>(Lcxf;Lsn4;)V
invoke-static {v4, v6, v6, v8, v7}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->O1:Lfti;
invoke-virtual {v1}, Lfti;->getValue()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lhle;
invoke-interface {v1, v0}, Lhle;->P(Landroid/content/Context;)Z
move-result v1
if-eqz v1, :cond_c
sget-object v1, Lt28;->u1:Ltuh;
invoke-virtual {v1, v0}, Ltuh;->a(Landroid/content/Context;)Z
move-result v1
if-nez v1, :cond_a
goto :goto_4
:cond_a
sget-object v1, Lt28;->w1:Ltuh;
invoke-virtual {v1, v0}, Ltuh;->a(Landroid/content/Context;)Z
move-result v1
if-eqz v1, :cond_b
sget-object v1, Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}a;->d:Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}a;
invoke-virtual {v0, v1}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->F(Lnl/flitsmeister/features/hud/views/activities/HUDActivity${'$'}a;)V
goto :goto_4
:cond_b
new-instance v1, Lf9f;
invoke-direct {v1}, Lf9f;-><init>()V
new-instance v4, Lf9f;
invoke-direct {v4}, Lf9f;-><init>()V
new-instance v8, Lf9f;
invoke-direct {v8}, Lf9f;-><init>()V
new-instance v9, Lk4b;
invoke-direct {v9, v1, v4, v8}, Lk4b;-><init>(Lf9f;Lf9f;Lf9f;)V
invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/AndroidAutoEventBus;->getBusAndroidAutoServiceActive()Las7;
move-result-object v10
new-instance v11, Ll4b;
invoke-direct {v11, v2, v9, v0}, Ll4b;-><init>(ILj49;Ljava/lang/Object;)V
invoke-virtual {v10, v11}, Las7;->b(Lu39;)Lds7;
move-result-object v10
iget-object v11, v0, Lnl/flitsmeister/controllers/activities/base/BaseActivity;->d:Lwni;
invoke-virtual {v11, v10}, Lwni;->a(Lds7;)V
iput-object v10, v1, Lf9f;->a:Ljava/lang/Object;
invoke-static {}, Lnl/flitsmeister/models/eventbuses/ConnectedDeviceBusKt;->getBusDeviceMotionStatus()Las7;
move-result-object v1
new-instance v10, Ln4b;
invoke-direct {v10, v2, v0, v9}, Ln4b;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V
invoke-virtual {v1, v10}, Las7;->b(Lu39;)Lds7;
move-result-object v1
invoke-virtual {v11, v1}, Lwni;->a(Lds7;)V
iput-object v1, v4, Lf9f;->a:Ljava/lang/Object;
invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/DriveStateBus;->getBusDriveStateChanged()Las7;
move-result-object v1
new-instance v4, Lo4b;
invoke-direct {v4, v0, v9}, Lo4b;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lk4b;)V
invoke-virtual {v1, v4}, Las7;->b(Lu39;)Lds7;
move-result-object v1
invoke-virtual {v11, v1}, Lwni;->a(Lds7;)V
iput-object v1, v8, Lf9f;->a:Ljava/lang/Object;
:cond_c
:goto_4
if-nez p1, :cond_14
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
sget-object v4, Lt28;->H1:Ltuh;
iget-object v8, v1, Lnl/flitsmeister/fmx/activities/main/k;->a:Landroid/app/Application;
invoke-virtual {v4, v8}, Ltuh;->g(Landroid/content/Context;)Z
move-result v9
const-class v10, Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdate;
if-eqz v9, :cond_d
invoke-static {v8}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
move-result-object v9
iget-object v11, v4, Ltuh;->a:Ljava/lang/String;
new-instance v12, Lcom/google/gson/Gson;
invoke-direct {v12}, Lcom/google/gson/Gson;-><init>()V
iget-object v13, v4, Ltuh;->b:Ljava/lang/Object;
invoke-virtual {v12, v13}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
move-result-object v12
invoke-interface {v9, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
move-result-object v9
invoke-static {v10, v9}, Lb2;->a(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
move-result-object v9
check-cast v9, Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdate;
goto :goto_5
:cond_d
move-object v9, v6
:goto_5
sget-object v11, Lt28;->G1:Ltuh;
invoke-virtual {v11, v8}, Ltuh;->g(Landroid/content/Context;)Z
move-result v12
if-eqz v12, :cond_e
invoke-static {v8}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
move-result-object v12
iget-object v13, v11, Ltuh;->a:Ljava/lang/String;
new-instance v14, Lcom/google/gson/Gson;
invoke-direct {v14}, Lcom/google/gson/Gson;-><init>()V
iget-object v15, v11, Ltuh;->b:Ljava/lang/Object;
invoke-virtual {v14, v15}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
move-result-object v14
invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
move-result-object v12
invoke-static {v10, v12}, Lb2;->a(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
move-result-object v10
check-cast v10, Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdate;
goto :goto_6
:cond_e
move-object v10, v6
:goto_6
const-class v12, Lbqe;
invoke-static {v8, v12}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
move-result-object v12
check-cast v12, Lbqe;
invoke-interface {v12}, Lbqe;->u()Laqe;
move-result-object v12
sget-object v13, Lt28;->P0:Ltuh;
invoke-virtual {v13, v8}, Ltuh;->a(Landroid/content/Context;)Z
move-result v14
if-eqz v14, :cond_f
goto :goto_7
:cond_f
invoke-interface {v12, v8}, Laqe;->b(Landroid/content/Context;)Z
move-result v12
if-nez v12, :cond_10
sget-object v12, Lgb;->j:Lgb${'$'}a;
invoke-virtual {v12, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
move-result-object v12
check-cast v12, Lgb;
iget-object v12, v12, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
if-eqz v12, :cond_10
invoke-virtual {v13, v8, v3}, Ltuh;->i(Landroid/content/Context;Z)Z
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->F3:Liji;
sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
invoke-virtual {v1, v6, v4}, Liji;->l(Ljava/lang/Object;Ljava/lang/Object;)Z
goto :goto_a
:cond_10
:goto_7
if-eqz v9, :cond_11
invoke-virtual {v9}, Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdate;->getReleasenotes()Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdateReleaseNotes;
move-result-object v12
goto :goto_8
:cond_11
move-object v12, v6
:goto_8
if-eqz v12, :cond_12
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->H3:Liji;
invoke-virtual {v1, v9}, Liji;->setValue(Ljava/lang/Object;)V
invoke-virtual {v4, v8}, Ltuh;->h(Landroid/content/Context;)V
goto :goto_a
:cond_12
if-eqz v10, :cond_13
invoke-virtual {v10}, Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdate;->getReleasenotes()Lnl/flitsmeister/features/bledevices/models/data/update/BleDeviceUpdateReleaseNotes;
move-result-object v4
goto :goto_9
:cond_13
move-object v4, v6
:goto_9
if-eqz v4, :cond_14
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->J3:Liji;
invoke-virtual {v1, v10}, Liji;->setValue(Ljava/lang/Object;)V
invoke-virtual {v11, v8}, Ltuh;->h(Landroid/content/Context;)V
:cond_14
:goto_a
invoke-virtual {v0}, Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;
move-result-object v1
iget-object v1, v1, Lnl/flitsmeister/fmx/activities/main/k;->R2:Lhji;
invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
new-instance v4, Lnl/flitsmeister/fmx/activities/main/MainActivity${'$'}c;
invoke-direct {v4, v0, v6}, Lnl/flitsmeister/fmx/activities/main/MainActivity${'$'}c;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
move-object/from16 v16, v1
move-object/from16 v19, v4
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
iget-object v1, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->P1:Lp4d;
if-eqz v1, :cond_24
iget-object v1, v1, Lp4d;->a:Lmwf;
invoke-interface {v1}, Lmwf;->a()Lko8;
move-result-object v1
new-instance v4, Lo4d;
invoke-direct {v4, v1}, Lo4d;-><init>(Lko8;)V
invoke-static {v4}, Lep8;->b(Lko8;)Lko8;
move-result-object v16
invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v15
new-instance v1, Lnl/flitsmeister/fmx/activities/main/MainActivity${'$'}d;
invoke-direct {v1, v0, v6}, Lnl/flitsmeister/fmx/activities/main/MainActivity${'$'}d;-><init>(Lnl/flitsmeister/fmx/activities/main/MainActivity;Lsn4;)V
new-instance v14, Ldr8;
move-object/from16 v19, v1
invoke-direct/range {v14 .. v19}, Ldr8;-><init>(Landroidx/lifecycle/Lifecycle;Lko8;Landroidx/lifecycle/Lifecycle${'$'}Event;Landroidx/lifecycle/Lifecycle${'$'}Event;Li49;)V
const/16 v1, 0xf
new-array v4, v1, [Landroidx/lifecycle/LifecycleObserver;
iget-object v8, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->f2:Libb;
if-eqz v8, :cond_23
aput-object v8, v4, v2
iget-object v8, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->g2:Lv9b;
if-eqz v8, :cond_22
aput-object v8, v4, v3
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->b2:Lbeg;
if-eqz v3, :cond_21
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->c2:Lkvf;
if-eqz v3, :cond_20
aput-object v3, v4, v7
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->d2:Ls58;
if-eqz v3, :cond_1f
const/4 v5, 0x4
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->e2:Ljxf;
if-eqz v3, :cond_1e
const/4 v5, 0x5
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->a2:Lt8b;
if-eqz v3, :cond_1d
const/4 v5, 0x6
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->T1:Lnl/flitsmeister/fmx/activities/main/f;
if-eqz v3, :cond_1c
const/4 v5, 0x7
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->U1:Lgj2;
if-eqz v3, :cond_1b
const/16 v5, 0x8
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->V1:Liha;
if-eqz v3, :cond_1a
const/16 v5, 0x9
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->W1:Ltke;
if-eqz v3, :cond_19
const/16 v5, 0xa
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->X1:Lc09;
if-eqz v3, :cond_18
const/16 v5, 0xb
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->Y1:Lnl/flitsmeister/parking/presentation/ParkingDeepLinkHandler;
if-eqz v3, :cond_17
const/16 v5, 0xc
aput-object v3, v4, v5
sget-object v3, Ltvd;->Y:Ltvd${'$'}a;
invoke-virtual {v3, v0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
move-result-object v3
const/16 v5, 0xd
aput-object v3, v4, v5
iget-object v3, v0, Lnl/flitsmeister/fmx/activities/main/MainActivity;->Z1:Lnl/flitsmeister/fmx/activities/main/g;
if-eqz v3, :cond_16
const/16 v5, 0xe
aput-object v3, v4, v5
:goto_b
if-ge v2, v1, :cond_15
aget-object v3, v4, v2
invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;
move-result-object v5
invoke-virtual {v5, v3}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V
add-int/lit8 v2, v2, 0x1
goto :goto_b
:cond_15
return-void
:cond_16
const-string v0, "mainOrientationObserver"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_17
const-string v0, "parkingDeepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_18
const-string v0, "fuelDeepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_19
const-string v0, "proDeepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1a
const-string v0, "lbADeepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1b
const-string v0, "carwashDeepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1c
const-string v0, "deepLinkHandler"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1d
const-string v0, "mainBottomSheetStateCoordinator"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1e
const-string v0, "routeSuggestionWidgetCoordinator"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_1f
const-string v0, "favoriteDestinationsBottomSheetCoordinator"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_20
const-string v0, "routeOverviewBottomSheetCoordinator"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_21
const-string v0, "searchBottomSheetCoordinator"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_22
const-string v0, "mainDialogHost"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_23
const-string v0, "mainOverlayHost"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_24
const-string v0, "observeIsNavigationRunning"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
:cond_25
const-string v0, "featureProvider"
invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
throw v6
""".trimIndent()
