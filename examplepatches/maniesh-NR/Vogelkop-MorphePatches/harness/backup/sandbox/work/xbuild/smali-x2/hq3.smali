.class public final Lhq3;
.super Ls62;
.source "SourceFile"


# instance fields
.field public final F:Lhv;

.field public final G:Landroid/net/Uri;

.field public final H:Lrii;

.field public final I:Lyyn;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;La12;Lwth;Ll02;Lh62;Lf62;Lhv;Landroid/net/Uri;Lcom/opera/android/settings/SettingsManager;Lrii;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lg62;Lr2;Lyv3;)V
    .registers 43

    sget-object v1, Lt62;->a:Lt62;

    new-instance v0, Lf32;

    const/16 v2, 0x1d

    invoke-direct {v0, v2}, Lf32;-><init>(B)V

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p9

    move-object/from16 v9, p11

    move-object/from16 v10, p12

    move-object/from16 v11, p13

    move-object/from16 v12, p14

    move-object/from16 v13, p15

    move-object/from16 v14, p16

    move-object/from16 v15, p17

    move-object/from16 v16, p18

    move-object/from16 v17, p19

    move-object/from16 v19, p20

    move-object/from16 v20, p21

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v20}, Ls62;-><init>(Lt62;Lcom/opera/android/browser/WebContentsWrapper;Ld12;Lwth;Ll02;Lkotlin/jvm/functions/Function1;Lf62;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lg7m;Lp12;Lwyn;Lky1;Lyk6;La52;Lqb;Lesk;Lkotlin/jvm/functions/Function1;Lr2;Lyv3;)V

    move-object/from16 v1, p7

    iput-object v1, v0, Lhq3;->F:Lhv;

    move-object/from16 v1, p8

    iput-object v1, v0, Lhq3;->G:Landroid/net/Uri;

    move-object/from16 v1, p10

    iput-object v1, v0, Lhq3;->H:Lrii;

    new-instance v1, Lagm;

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v2

    invoke-direct {v1, v2}, Lagm;-><init>(Ldx3;)V

    iget-object v1, v1, Lagm;->c:Ljava/lang/Object;

    check-cast v1, Lyyn;

    iput-object v1, v0, Lhq3;->I:Lyyn;

    invoke-virtual {v0}, Lhq3;->n()V

    invoke-virtual {v0}, Ls62;->j()V

    return-void
.end method

.method public static final o(Lhq3;Ljava/lang/Boolean;)Lkotlin/Unit;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_28

    iget-object p1, p0, Lhq3;->H:Lrii;

    iget-object p1, p1, Lrii;->b:Ljava/lang/Object;

    check-cast p1, La12;

    iget-object p1, p1, La12;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "ofa-migration-version"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-super {p0}, Ls62;->n()V

    :cond_28
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final b(Ll62;)V
    .registers 5

    new-instance v0, Lksc;

    iget-object v1, p0, Lhq3;->G:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lksc;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lstn;

    iget-object p0, p0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-direct {v1, p0, p1}, Lstn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->d()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/NavigationController;->r(Lksc;)Lorg/chromium/content_public/browser/NavigationHandle;

    return-void
.end method

.method public final g()Likc;
    .registers 1

    iget-object p0, p0, Lhq3;->I:Lyyn;

    return-object p0
.end method

.method public final n()V
    .registers 5

    iget-object v0, p0, Lhq3;->H:Lrii;

    invoke-virtual {v0}, Lrii;->j()Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lhq3;->F:Lhv;

    invoke-virtual {v0}, Lhv;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqb7;

    iget-object v0, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    new-instance v1, Lbo3;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lpb;

    const/16 v3, 0x1a

    invoke-direct {v2, v1, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :cond_25
    invoke-super {p0}, Ls62;->n()V

    return-void
.end method
