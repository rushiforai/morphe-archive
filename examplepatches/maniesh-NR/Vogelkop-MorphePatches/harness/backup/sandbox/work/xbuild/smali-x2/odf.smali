.class public final synthetic Lodf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbcf;
.implements Ln5o;
.implements Ljtl;
.implements Lxsi;
.implements Ldkj;
.implements Lktn;
.implements Ljr9;
.implements Lfn8;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lodf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lodf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic c()Landroid/media/metrics/LogSessionId;
    .registers 1

    sget-object v0, Landroid/media/metrics/LogSessionId;->LOG_SESSION_ID_NONE:Landroid/media/metrics/LogSessionId;

    return-object v0
.end method

.method public static bridge synthetic d(Ljava/lang/Object;)Landroid/os/PowerMonitor;
    .registers 1

    check-cast p0, Landroid/os/PowerMonitor;

    return-object p0
.end method

.method public static synthetic h(ILjava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic i(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic j(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final m(Landroid/content/Context;Z)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ljava/lang/Void;

    sget-object p0, Lf1h;->b:Lf1h;

    return-object p0
.end method

.method public final b(Landroid/view/MenuItem;Z)V
    .registers 3

    xor-int/lit8 p2, p2, 0x1

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final createExtractors()[Lcn8;
    .registers 3

    new-instance p0, Lu8h;

    invoke-direct {p0}, Lu8h;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [Lcn8;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final e(Lorg/chromium/content/browser/webcontents/WebContentsImpl;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Lyng;

    invoke-direct {p0}, Lyng;-><init>()V

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte p0, p0, Lodf;->a:B

    packed-switch p0, :pswitch_data_82

    :pswitch_5
    check-cast p1, Lcom/leanplum/ActionContext;

    invoke-static {p1}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->b(Lcom/leanplum/ActionContext;)Lkotlin/Pair;

    move-result-object p0

    return-object p0

    :pswitch_c
    check-cast p1, Lcom/leanplum/ActionContext;

    invoke-static {p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->e(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0

    :pswitch_13
    check-cast p1, Lcom/leanplum/ActionContext;

    invoke-static {p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->h(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0

    :pswitch_1a
    check-cast p1, Lcom/leanplum/ActionContext;

    invoke-static {p1}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->a(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0

    :pswitch_21
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Landroid/content/Intent;

    const-string p0, "android.intent.action.VIEW"

    invoke-direct {v2, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 p0, 0x14000000

    invoke-virtual {v2, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string p0, "android.intent.category.BROWSABLE"

    invoke-virtual {v2, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    sget-object p0, Lmdb;->a:Ljava/util/HashSet;

    const-string p0, "externally_handled"

    const/4 p1, 0x1

    invoke-virtual {v2, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const p0, 0x10040

    invoke-static {p0, v2}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object p0

    if-eqz p0, :cond_7f

    iget-object p1, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz p1, :cond_7f

    filled-new-array {p0}, [Landroid/content/pm/ResolveInfo;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lbpd;->C(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7f

    sget-object p1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    new-instance v0, Logf;

    invoke-direct/range {v0 .. v5}, Logf;-><init>(Ljava/lang/String;Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/String;)V

    goto :goto_80

    :cond_7f
    const/4 v0, 0x0

    :goto_80
    return-object v0

    nop

    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_21
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_1a
        :pswitch_13
        :pswitch_c
    .end packed-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-byte v1, v1, Lodf;->a:B

    const/4 v3, 0x0

    const-string v4, "Missing required view with ID: "

    const/4 v5, 0x0

    sparse-switch v1, :sswitch_data_216

    const v1, 0x7f0d01ee

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a00d7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v7, :cond_b6

    const v1, 0x7f0a099c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_b6

    const v1, 0x7f0a09a9

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_b6

    const v1, 0x7f0a09af

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_b6

    const v1, 0x7f0a09b0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_b6

    const v1, 0x7f0a09b5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_b6

    const v1, 0x7f0a09b7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_b6

    const v1, 0x7f0a09ed

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_b6

    const v1, 0x7f0a09f2

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_b6

    const v1, 0x7f0a09f8

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_b6

    const v1, 0x7f0a0a16

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_b6

    const v1, 0x7f0a0a1a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v18, :cond_b6

    new-instance v5, Llm9;

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v18}, Llm9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v3, v5

    goto :goto_c5

    :cond_b6
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_c5
    return-object v3

    :sswitch_c6
    const v1, 0x7f0d01eb

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0997

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v7, :cond_153

    const v1, 0x7f0a0998

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v8, :cond_153

    const v1, 0x7f0a0999

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_153

    const v1, 0x7f0a099a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_153

    const v1, 0x7f0a099b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_153

    const v1, 0x7f0a09a0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v12, :cond_153

    const v1, 0x7f0a09ad

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v13, :cond_153

    const v1, 0x7f0a09b2

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v14, :cond_153

    const v1, 0x7f0a09e6

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v15, :cond_153

    const v1, 0x7f0a0a02

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v16, :cond_153

    new-instance v5, Lkm9;

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v16}, Lkm9;-><init>(Landroid/widget/LinearLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/CircleImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;Lcom/opera/android/widget/MenuSettingsListItem;)V

    move-object v3, v5

    goto :goto_162

    :cond_153
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_162
    return-object v3

    :sswitch_163
    const v1, 0x7f0d01e9

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0982

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_206

    const v1, 0x7f0a0985

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_206

    const v1, 0x7f0a0986

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_206

    const v1, 0x7f0a0988

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_206

    const v1, 0x7f0a0989

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_206

    const v1, 0x7f0a098b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_206

    const v1, 0x7f0a098c

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_206

    const v1, 0x7f0a098d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v13, :cond_206

    const v1, 0x7f0a098e

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v2, :cond_206

    const v1, 0x7f0a098f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_206

    const v1, 0x7f0a0992

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_206

    const v1, 0x7f0a0993

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v16, :cond_206

    new-instance v5, Lim9;

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v16}, Lim9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v3, v5

    goto :goto_215

    :cond_206
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_215
    return-object v3

    :sswitch_data_216
    .sparse-switch
        0xd -> :sswitch_163
        0x11 -> :sswitch_c6
    .end sparse-switch
.end method

.method public final l(Landroid/content/Context;Z)V
    .registers 5

    iget-byte p0, p0, Lodf;->a:B

    packed-switch p0, :pswitch_data_58

    return-void

    :pswitch_6
    const/4 p0, 0x1

    if-eqz p2, :cond_30

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iget-boolean p2, p1, Lx5f;->h:Z

    if-eqz p2, :cond_57

    iget-object p2, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p2}, Lx56;->H(Lzpa;)Lhm0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lhm0;->x(Lzpa;)Lbp0;

    move-result-object p2

    invoke-virtual {p2, p0, p0}, Ljf0;->d(II)V

    invoke-virtual {p1, v0}, Lx5f;->U0(Lx56;)V

    goto :goto_57

    :cond_30
    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iget-boolean p2, p1, Lx5f;->h:Z

    if-eqz p2, :cond_57

    iget-object p2, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p2}, Lx56;->H(Lzpa;)Lhm0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lhm0;->x(Lzpa;)Lbp0;

    move-result-object p2

    const/4 v1, 0x2

    invoke-virtual {p2, v1, p0}, Ljf0;->d(II)V

    invoke-virtual {p1, v0}, Lx5f;->U0(Lx56;)V

    :cond_57
    :goto_57
    return-void

    :pswitch_data_58
    .packed-switch 0xb
        :pswitch_6
    .end packed-switch
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 6

    iget-byte p0, p0, Lodf;->a:B

    const/16 v0, 0x207

    packed-switch p0, :pswitch_data_2a

    :pswitch_7
    invoke-static {p1, p2}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->d(Landroid/view/View;Lg3o;)Lg3o;

    move-result-object p0

    return-object p0

    :pswitch_c
    iget-object p0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget p0, p0, Lr9b;->b:I

    invoke-static {p0, p1}, Lp37;->q0(ILandroid/view/View;)V

    return-object p2

    :pswitch_18
    iget-object p0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {p0, v0}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget v0, p0, Lr9b;->a:I

    iget v1, p0, Lr9b;->b:I

    iget v2, p0, Lr9b;->c:I

    iget p0, p0, Lr9b;->d:I

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    return-object p2

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_18
        :pswitch_7
        :pswitch_c
    .end packed-switch
.end method
