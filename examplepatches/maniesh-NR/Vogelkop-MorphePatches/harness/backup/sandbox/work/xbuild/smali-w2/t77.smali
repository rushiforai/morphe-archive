.class public final Lt77;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 30
    iput-byte p2, p0, Lt77;->a:B

    iput-object p1, p0, Lt77;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lndc;Lbk5;Lx79;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lt77;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lt77;->b:Ljava/lang/Object;

    iget-object p2, p2, Lbk5;->f:Lkze;

    new-instance p3, Ld58;

    const/16 v0, 0x12

    invoke-direct {p3, v0}, Ld58;-><init>(B)V

    invoke-static {p2, p3}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p2

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lslk;Lm9c;)V
    .registers 4

    const/16 v0, 0x9

    iput-byte v0, p0, Lt77;->a:B

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p2, p0, Lt77;->b:Ljava/lang/Object;

    .line 27
    iget-object p1, p1, Lslk;->c:Lpy9;

    .line 28
    iget-object p1, p1, Lpy9;->g:Lkze;

    .line 29
    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lslk;Lndc;Lode;)V
    .registers 5

    const/16 v0, 0xa

    iput-byte v0, p0, Lt77;->a:B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lt77;->b:Ljava/lang/Object;

    .line 33
    invoke-virtual {p3, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 6

    iget-object p0, p0, Lt77;->b:Ljava/lang/Object;

    check-cast p0, Lt6g;

    const/4 v0, 0x2

    if-ne p1, v0, :cond_47

    iget-object p1, p0, Lt6g;->k:Lorm;

    sget-object v1, Lgm0;->m:Lgm0;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->l0(Lgm0;)V

    iget-object p1, p0, Lt6g;->r:Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lt6g;->q:Z

    if-nez p1, :cond_47

    const/4 p1, 0x1

    iput-boolean p1, p0, Lt6g;->q:Z

    iget-object p1, p0, Lt6g;->j:Lhxk;

    new-instance v1, Ls6g;

    invoke-direct {v1, p0, v0}, Ls6g;-><init>(Lt6g;B)V

    new-instance v0, Ls6g;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, Ls6g;-><init>(Lt6g;B)V

    check-cast p1, Lkxk;

    iget-object p0, p1, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lkxk;->d:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzwk;

    new-instance v3, Ll31;

    invoke-direct {v3, v1, v2}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    new-instance v1, Ll31;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-static {p0, p1, v3, v1}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    :cond_47
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lt77;->a:B

    const/4 v2, -0x1

    const/16 v3, 0x11

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, v0, Lt77;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_320

    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    check-cast v7, Lqkn;

    iget-object v1, v7, Lqkn;->j:Lujn;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lpv1;

    const/16 v3, 0x8

    invoke-direct {v2, v1, v3}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_29
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    check-cast v7, Lm9k;

    if-eqz v1, :cond_4a

    iget-object v1, v7, Lm9k;->e:Ljze;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    iget-object v0, v7, Lm9k;->h:Loml;

    if-eqz v0, :cond_41

    invoke-virtual {v0, v6}, Loml;->cancel(Z)Z

    :cond_41
    iput-object v5, v7, Lm9k;->h:Loml;

    iget-object v0, v7, Lm9k;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "has_waited_for_startup_dependencies"

    invoke-virtual {v0, v4, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_4a
    return-void

    :pswitch_4b
    move-object/from16 v0, p1

    check-cast v0, Lh1b;

    move-object v9, v7

    check-cast v9, Lslk;

    invoke-virtual {v0, v6}, Lh1b;->u(I)La1b;

    move-result-object v1

    :cond_56
    :goto_56
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_94

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luah;

    iget-object v7, v2, Luah;->e:Lh1b;

    invoke-virtual {v7, v6}, Lh1b;->u(I)La1b;

    move-result-object v7

    :cond_68
    invoke-virtual {v7}, Lq4;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_56

    invoke-virtual {v7}, Lq4;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v10, Lzsk;->f:Ljava/util/Map;

    invoke-interface {v10, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_68

    iget-object v10, v2, Luah;->a:Ljava/lang/String;

    iget-object v11, v2, Luah;->b:Ljava/lang/String;

    iget-object v12, v2, Luah;->c:Ljava/lang/String;

    iget-object v13, v2, Luah;->d:Ljava/lang/String;

    iget-object v14, v2, Luah;->e:Lh1b;

    new-instance v2, Lr62;

    iget-object v7, v9, Lslk;->h:Lode;

    new-instance v8, Lqe9;

    const/4 v15, 0x4

    invoke-direct/range {v8 .. v15}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v7, v8, v4}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    goto :goto_56

    :cond_94
    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lnn;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lnn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lag1;

    invoke-direct {v1, v4}, Lag1;-><init>(B)V

    invoke-static {v1}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Comparator;->reversed()Ljava/util/Comparator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lmn;

    invoke-direct {v1, v3}, Lmn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    iget-object v1, v9, Lslk;->b:Ltmk;

    iget-object v2, v1, Ltmk;->k:Ljava/lang/Iterable;

    if-eqz v2, :cond_d3

    invoke-static {v0, v2}, Lsfe;->N(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z

    move-result v2

    if-nez v2, :cond_e5

    :cond_d3
    iput-object v0, v1, Ltmk;->k:Ljava/lang/Iterable;

    iget-object v0, v9, Lslk;->a:Lm59;

    iget-object v1, v0, Lm59;->e:Ljava/lang/Object;

    check-cast v1, Loml;

    if-eqz v1, :cond_e2

    invoke-virtual {v1, v6}, Loml;->cancel(Z)Z

    iput-object v5, v0, Lm59;->e:Ljava/lang/Object;

    :cond_e2
    invoke-virtual {v0}, Lm59;->i()V

    :cond_e5
    return-void

    :pswitch_e6
    move-object/from16 v0, p1

    check-cast v0, Lqtg;

    iget v0, v0, Lqtg;->a:I

    if-eq v0, v2, :cond_100

    check-cast v7, Lm9c;

    if-eq v0, v4, :cond_f3

    move v4, v6

    :cond_f3
    iget-object v0, v7, Lm9c;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "premium_giveaway_available"

    invoke-static {v0, v1, v4}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_100
    return-void

    :pswitch_101
    move-object/from16 v1, p1

    check-cast v1, Lipf;

    sget-object v2, Lepf;->a:Lepf;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13a

    sget-object v2, Lgpf;->a:Lgpf;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11f

    check-cast v7, Lt6g;

    iget-object v0, v7, Lt6g;->r:Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_13a

    :cond_11f
    instance-of v2, v1, Lcpf;

    if-eqz v2, :cond_12b

    check-cast v1, Lcpf;

    iget v1, v1, Lcpf;->b:I

    invoke-virtual {v0, v1}, Lt77;->a(I)V

    goto :goto_13a

    :cond_12b
    instance-of v2, v1, Lfpf;

    if-eqz v2, :cond_137

    check-cast v1, Lfpf;

    iget v1, v1, Lfpf;->e:I

    invoke-virtual {v0, v1}, Lt77;->a(I)V

    goto :goto_13a

    :cond_137
    invoke-static {}, Lh9o;->p()V

    :cond_13a
    :goto_13a
    return-void

    :pswitch_13b
    move-object/from16 v0, p1

    check-cast v0, Lf8f;

    check-cast v7, Lk6g;

    invoke-virtual {v7}, Lk6g;->a()V

    return-void

    :pswitch_145
    move-object/from16 v0, p1

    check-cast v0, Ldpf;

    check-cast v7, Lhpf;

    invoke-virtual {v0, v7}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_14f
    move-object/from16 v1, p1

    check-cast v1, Lm18;

    check-cast v7, Lu1f;

    sget-object v2, Lm18;->a:Lm18;

    if-eq v1, v2, :cond_165

    iget-object v1, v7, Lu1f;->g:Ljava/lang/Object;

    check-cast v1, Likc;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    iget-object v0, v7, Lp1f;->b:Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    :cond_165
    return-void

    :pswitch_166
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    check-cast v7, Ligi;

    iget-object v1, v7, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Lpt1;

    iget-object v1, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_17c
    move-object/from16 v0, p1

    check-cast v0, Ljd7;

    check-cast v7, Li9c;

    iget-object v1, v7, Li9c;->f:Ljava/lang/Object;

    check-cast v1, Lkdb;

    if-eqz v1, :cond_18d

    iget-object v1, v1, Lkdb;->a:Landroid/net/Uri;

    invoke-virtual {v7, v0, v1}, Li9c;->b(Ljd7;Landroid/net/Uri;)V

    :cond_18d
    return-void

    :pswitch_18e
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    check-cast v7, Lx79;

    if-eqz v0, :cond_1df

    iget-object v0, v7, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-object v1, v7, Lx79;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/PopupWindow;

    if-nez v1, :cond_1e8

    new-instance v1, Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v8, 0x7f0d0246

    invoke-virtual {v4, v8, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-direct {v1, v4, v2, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v2, v7, Lx79;->b:Ljava/lang/Object;

    check-cast v2, Lqim;

    invoke-virtual {v2, v5}, Lqim;->f(Lfm8;)Leq6;

    move-result-object v2

    iget-object v4, v7, Lx79;->c:Ljava/lang/Object;

    check-cast v4, Lm24;

    iget-object v5, v7, Lx79;->d:Ljava/lang/Object;

    check-cast v5, Lhe;

    invoke-interface {v4, v5}, Lm24;->a(Ll24;)V

    new-instance v4, Lgsc;

    invoke-direct {v4, v7, v2}, Lgsc;-><init>(Lx79;Leq6;)V

    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    invoke-virtual {v1, v0, v3, v6, v6}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    iput-object v1, v7, Lx79;->e:Ljava/lang/Object;

    goto :goto_1e8

    :cond_1df
    iget-object v0, v7, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/PopupWindow;

    if-eqz v0, :cond_1e8

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_1e8
    :goto_1e8
    return-void

    :pswitch_1e9
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/Set;

    check-cast v7, Lc59;

    iget-boolean v1, v7, Lc59;->d:Z

    if-eqz v1, :cond_2e4

    iget-object v1, v7, Lc59;->h:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lr49;->f(Ljava/lang/String;)Lr49;

    move-result-object v1

    const-class v2, Lcom/google/firebase/messaging/FirebaseMessaging;

    invoke-virtual {v1, v2}, Lr49;->b(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/messaging/FirebaseMessaging;

    sget-object v2, Ln59;->a:Ljava/util/regex/Pattern;

    new-instance v2, Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_216
    :goto_216
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_248

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_22a

    move-object v3, v5

    goto :goto_242

    :cond_22a
    sget-object v4, Ln59;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v8, 0x384

    if-le v4, v8, :cond_242

    invoke-virtual {v3, v6, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_242
    :goto_242
    if-eqz v3, :cond_216

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_216

    :cond_248
    invoke-virtual {v7}, Lc59;->c()Ljava/util/Set;

    move-result-object v0

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v3, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_258
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_270

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->i:Lcom/google/android/gms/tasks/Task;

    new-instance v8, Ljp5;

    const/4 v9, 0x5

    invoke-direct {v8, v5, v9}, Ljp5;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v6, v8}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    goto :goto_258

    :cond_270
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v4, v0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_27c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-string v6, "subscribed_topics"

    if-eqz v5, :cond_2af

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v7}, Lc59;->c()Ljava/util/Set;

    move-result-object v8

    iget-object v9, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->i:Lcom/google/android/gms/tasks/Task;

    new-instance v10, Ljp5;

    const/4 v11, 0x4

    invoke-direct {v10, v5, v11}, Ljp5;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v9, v10}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-object v9, v8

    check-cast v9, Ljava/util/HashSet;

    invoke-virtual {v9, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_27c

    :cond_2af
    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2bb

    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2e4

    :cond_2bb
    iput-object v2, v7, Lc59;->f:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2d3

    invoke-virtual {v7}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_2e4

    :cond_2d3
    invoke-virtual {v7}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, v7, Lc59;->f:Ljava/util/HashSet;

    invoke-interface {v0, v6, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2e4
    :goto_2e4
    return-void

    :pswitch_2e5
    move-object/from16 v0, p1

    check-cast v0, Lndc;

    check-cast v7, Landroidx/fragment/app/i;

    if-eqz v0, :cond_31e

    invoke-static {v7}, Landroidx/fragment/app/i;->access$200(Landroidx/fragment/app/i;)Z

    move-result v0

    if-eqz v0, :cond_31e

    invoke-virtual {v7}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_319

    invoke-static {v7}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_31e

    const/4 v1, 0x3

    invoke-static {v1}, Landroidx/fragment/app/w;->N(I)Z

    move-result v1

    if-eqz v1, :cond_311

    invoke-static {v7}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_311
    invoke-static {v7}, Landroidx/fragment/app/i;->access$000(Landroidx/fragment/app/i;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    goto :goto_31e

    :cond_319
    const-string v0, "DialogFragment can not be attached to a container view"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_31e
    :goto_31e
    return-void

    nop

    :pswitch_data_320
    .packed-switch 0x0
        :pswitch_2e5
        :pswitch_1e9
        :pswitch_18e
        :pswitch_17c
        :pswitch_166
        :pswitch_14f
        :pswitch_145
        :pswitch_13b
        :pswitch_101
        :pswitch_e6
        :pswitch_4b
        :pswitch_29
    .end packed-switch
.end method
