.class public final Lj1c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    new-instance v0, Ldfe;

    const/16 v1, 0x10

    new-array v2, v1, [Lzt9;

    invoke-direct {v0, v2}, Ldfe;-><init>([Ljava/lang/Object;)V

    .line 256
    iput-object v0, p0, Lj1c;->b:Ljava/lang/Object;

    .line 257
    sget-object v2, Ljmi;->a:Ltee;

    .line 258
    new-instance v2, Ltee;

    invoke-direct {v2}, Ltee;-><init>()V

    .line 259
    iput-object v2, p0, Lj1c;->c:Ljava/lang/Object;

    .line 260
    iput-object v0, p0, Lj1c;->d:Ljava/lang/Object;

    .line 261
    new-instance v0, Ldfe;

    new-array v2, v1, [Ljava/lang/Object;

    invoke-direct {v0, v2}, Ldfe;-><init>([Ljava/lang/Object;)V

    .line 262
    iput-object v0, p0, Lj1c;->e:Ljava/lang/Object;

    .line 263
    new-instance v0, Ldfe;

    new-array v1, v1, [Lkotlin/jvm/functions/Function0;

    invoke-direct {v0, v1}, Ldfe;-><init>([Ljava/lang/Object;)V

    .line 264
    iput-object v0, p0, Lj1c;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;)V
    .registers 17

    const/4 v8, 0x0

    const/16 v9, 0x80

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    .line 253
    invoke-direct/range {v0 .. v9}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V

    return-void
.end method

.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V
    .registers 12

    and-int/lit8 v0, p9, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move-object p1, v1

    :cond_6
    and-int/lit8 v0, p9, 0x4

    if-eqz v0, :cond_b

    move-object p3, v1

    :cond_b
    and-int/lit8 v0, p9, 0x20

    if-eqz v0, :cond_10

    move-object p6, p5

    :cond_10
    and-int/lit8 v0, p9, 0x40

    if-eqz v0, :cond_15

    move-object p7, v1

    :cond_15
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_1a

    move-object p8, v1

    .line 265
    :cond_1a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 266
    iput-object p1, p0, Lj1c;->a:Ljava/lang/Object;

    .line 267
    iput-object p2, p0, Lj1c;->b:Ljava/lang/Object;

    .line 268
    iput-object p3, p0, Lj1c;->c:Ljava/lang/Object;

    .line 269
    iput-object p4, p0, Lj1c;->d:Ljava/lang/Object;

    .line 270
    iput-object p5, p0, Lj1c;->e:Ljava/lang/Object;

    .line 271
    iput-object p6, p0, Lj1c;->f:Ljava/lang/Object;

    .line 272
    iput-object p7, p0, Lj1c;->g:Ljava/lang/Object;

    .line 273
    iput-object p8, p0, Lj1c;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Landroid/content/SharedPreferences;Lv3m;Ljbn;)V
    .registers 5

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-object p1, p0, Lj1c;->a:Ljava/lang/Object;

    .line 240
    iput-object p2, p0, Lj1c;->b:Ljava/lang/Object;

    .line 241
    iput-object p3, p0, Lj1c;->c:Ljava/lang/Object;

    .line 242
    iput-object p4, p0, Lj1c;->d:Ljava/lang/Object;

    .line 243
    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lj1c;->e:Ljava/lang/Object;

    .line 244
    const-string p1, "translate_web_pages_to_language"

    .line 245
    const-string p2, "translate_web_pages_backup_translation_method_enabled"

    const-string p3, "translation_source"

    const-string p4, "translate_web_pages_enabled"

    filled-new-array {p3, p4, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    .line 246
    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    .line 247
    iput-object p1, p0, Lj1c;->f:Ljava/lang/Object;

    .line 248
    new-instance p1, Ls9;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lj1c;->h:Ljava/lang/Object;

    .line 249
    new-instance p1, Li1c;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Li1c;-><init>(Lj1c;B)V

    iput-object p1, p0, Lj1c;->i:Ljava/lang/Object;

    .line 250
    new-instance p1, Li1c;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Li1c;-><init>(Lj1c;B)V

    iput-object p1, p0, Lj1c;->k:Ljava/lang/Object;

    .line 251
    sget-object p1, Lv08;->a:Lv08;

    .line 252
    iput-object p1, p0, Lj1c;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 12

    .line 237
    iput-object p1, p0, Lj1c;->a:Ljava/lang/Object;

    iput-object p2, p0, Lj1c;->b:Ljava/lang/Object;

    iput-object p3, p0, Lj1c;->c:Ljava/lang/Object;

    iput-object p4, p0, Lj1c;->d:Ljava/lang/Object;

    iput-object p5, p0, Lj1c;->e:Ljava/lang/Object;

    iput-object p6, p0, Lj1c;->f:Ljava/lang/Object;

    iput-object p7, p0, Lj1c;->g:Ljava/lang/Object;

    iput-object p8, p0, Lj1c;->h:Ljava/lang/Object;

    iput-object p9, p0, Lj1c;->i:Ljava/lang/Object;

    iput-object p10, p0, Lj1c;->j:Ljava/lang/Object;

    iput-object p11, p0, Lj1c;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lx5f;Landroid/widget/FrameLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;Landroid/view/View;Landroid/view/View;Lz77;Lysj;Lmt3;Lk6l;Li53;Lnr8;Lu4l;Lyu3;Lyqa;)V
    .registers 40

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v11, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p10

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lj1c;->a:Ljava/lang/Object;

    move-object/from16 v5, p2

    iput-object v5, v0, Lj1c;->b:Ljava/lang/Object;

    iput-object v11, v0, Lj1c;->c:Ljava/lang/Object;

    iput-object v2, v0, Lj1c;->d:Ljava/lang/Object;

    iput-object v3, v0, Lj1c;->e:Ljava/lang/Object;

    iput-object v4, v0, Lj1c;->f:Ljava/lang/Object;

    move-object/from16 v6, p14

    iput-object v6, v0, Lj1c;->g:Ljava/lang/Object;

    new-instance v7, Lt9l;

    move-object/from16 v10, p3

    invoke-direct {v7, v10}, Lt9l;-><init>(Landroid/view/ViewGroup;)V

    iget-object v7, v7, Lt9l;->b:Ljava/lang/Object;

    check-cast v7, Lpde;

    new-instance v5, Lpde;

    sget-object v8, Leyj;->I:Leyj;

    invoke-direct {v5, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v5, v0, Lj1c;->h:Ljava/lang/Object;

    new-instance v9, Lpde;

    sget-object v8, Lb3c;->g:Lb3c;

    invoke-direct {v9, v8}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v9, v0, Lj1c;->i:Ljava/lang/Object;

    new-instance v8, Lpde;

    const/4 v12, 0x0

    invoke-direct {v8, v12}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v12, Ls9i;

    invoke-direct {v12, v7, v4}, Ls9i;-><init>(Lpde;Lk6l;)V

    new-instance v13, Lpde;

    iget-object v14, v4, Lk6l;->o:Lb2l;

    if-eqz v14, :cond_54

    invoke-interface {v14}, Lb9l;->T()Lp6l;

    move-result-object v14

    goto :goto_56

    :cond_54
    sget-object v14, Lp6l;->a:Lp6l;

    :goto_56
    invoke-direct {v13, v14}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v13, v0, Lj1c;->j:Ljava/lang/Object;

    move-object/from16 v20, v12

    new-instance v12, La21;

    move-object v14, v13

    new-instance v13, Lohf;

    invoke-direct {v13, v1}, Lohf;-><init>(Lx5f;)V

    move-object v1, v14

    new-instance v14, Lb3l;

    const/4 v15, 0x0

    invoke-direct {v14, v0, v15}, Lb3l;-><init>(Lj1c;B)V

    move-object/from16 v21, p8

    move-object/from16 v22, p9

    move-object/from16 v17, p11

    move-object/from16 v18, p12

    move-object/from16 v19, p13

    move-object/from16 v16, v4

    move-object/from16 v23, v6

    move-object/from16 v15, p7

    invoke-direct/range {v12 .. v23}, La21;-><init>(Lqdb;Lkotlin/jvm/functions/Function0;Lz77;Lk6l;Li53;Lnr8;Lu4l;Ls9i;Lysj;Lkotlin/jvm/functions/Function0;Lw9l;)V

    move-object v14, v1

    new-instance v1, Lz5l;

    iget-object v6, v11, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    sget-object v15, Ll08;->a:Ll08;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    move-object/from16 v3, p10

    move-object/from16 v4, p13

    move-object v2, v7

    move-object v7, v8

    move-object v13, v12

    move-object v12, v14

    move-object/from16 v8, v20

    move-object/from16 v14, p15

    invoke-direct/range {v1 .. v16}, Lz5l;-><init>(Lpde;Lk6l;Lu4l;Lpde;Lpde;Lpde;Ls9i;Lpde;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Likc;La21;Lyqa;Ljava/util/List;Landroid/content/res/Resources;)V

    new-instance v4, Lg3l;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lg3l;-><init>(Ljava/lang/Object;B)V

    iget-object v6, v1, Lz5l;->k:Lr5l;

    invoke-static {v6, v2, v4}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iput-object v1, v0, Lj1c;->k:Ljava/lang/Object;

    iget-object v1, v11, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->b:Lpde;

    new-instance v4, Lc3l;

    invoke-direct {v4, v0, v5}, Lc3l;-><init>(Lj1c;B)V

    invoke-static {v1, v2, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v1, v11, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    new-instance v4, Lc3l;

    const/4 v6, 0x1

    invoke-direct {v4, v0, v6}, Lc3l;-><init>(Lj1c;B)V

    invoke-static {v1, v2, v4}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v1, Lf3l;

    invoke-direct {v1, v0}, Lf3l;-><init>(Lj1c;)V

    new-instance v4, Lb3l;

    invoke-direct {v4, v0, v6}, Lb3l;-><init>(Lj1c;B)V

    invoke-static {v3, v2, v1, v4}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v1, Ld3l;

    invoke-direct {v1, v0, v5}, Ld3l;-><init>(Lj1c;B)V

    move-object/from16 v2, p5

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Le3l;

    invoke-direct {v1, v0, v5}, Le3l;-><init>(Lj1c;B)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v1, Ld3l;

    invoke-direct {v1, v0, v6}, Ld3l;-><init>(Lj1c;B)V

    move-object/from16 v3, p6

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Le3l;

    invoke-direct {v1, v0, v6}, Le3l;-><init>(Lj1c;B)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public static final g(Lzt9;Ldfe;)Z
    .registers 7

    iget-object v0, p1, Ldfe;->a:[Ljava/lang/Object;

    iget p1, p1, Ldfe;->c:I

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, p1, :cond_27

    aget-object v3, v0, v2

    check-cast v3, Lzt9;

    iget-object v3, v3, Lzt9;->a:Ldth;

    instance-of v4, v3, Lg8g;

    if-eqz v4, :cond_24

    check-cast v3, Lg8g;

    iget-object v3, v3, Lg8g;->b:Ldfe;

    invoke-virtual {v3, p0}, Ldfe;->k(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_22

    invoke-static {p0, v3}, Lj1c;->g(Lzt9;Ldfe;)Z

    move-result v3

    if-eqz v3, :cond_24

    :cond_22
    const/4 p0, 0x1

    return p0

    :cond_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_27
    return v1
.end method


# virtual methods
.method public final a()V
    .registers 10

    iget-object v0, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    iget-object v2, v2, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;->c:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/util/Size;

    const v2, 0x7f07098f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f070992

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    sub-int/2addr v2, v3

    const v3, 0x7f070991

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const v4, 0x7f070990

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v6, p0, Lj1c;->k:Ljava/lang/Object;

    check-cast v6, Lz5l;

    iget-object v6, v6, Lz5l;->v:Lx2l;

    iget-object v6, v6, Lx2l;->o:Lo2l;

    iget-object v6, v6, Lo2l;->g:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-lez v7, :cond_78

    if-lez v6, :cond_78

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v7

    const v8, 0x7f070994

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    sub-int/2addr v7, v8

    const v8, 0x7f070993

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    sub-int/2addr v7, v8

    const v8, 0x7f070996

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    new-instance v8, Landroid/util/Size;

    div-int/2addr v7, v6

    invoke-static {v7, v3, v4}, Ldjh;->c(III)I

    move-result v3

    shl-int/lit8 v1, v1, 0x1

    sub-int/2addr v3, v1

    invoke-direct {v8, v3, v2}, Landroid/util/Size;-><init>(II)V

    :goto_76
    move-object v6, v8

    goto :goto_7e

    :cond_78
    new-instance v8, Landroid/util/Size;

    invoke-direct {v8, v4, v2}, Landroid/util/Size;-><init>(II)V

    goto :goto_76

    :goto_7e
    iget-object v1, p0, Lj1c;->h:Ljava/lang/Object;

    check-cast v1, Lpde;

    sget-object v2, Leyj;->H:Lcyj;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object p0, p0, Lj1c;->i:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lb3c;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lm5h;->e(Landroid/content/Context;Lb3c;Landroid/util/Size;Landroid/util/Size;II)Leyj;

    move-result-object p0

    invoke-static {v1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lj1c;->f:Ljava/lang/Object;

    iput-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    iget-object v1, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v1, Ldfe;

    invoke-virtual {v1}, Ldfe;->h()V

    iget-object v2, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v2, Ltee;

    invoke-virtual {v2}, Ltee;->b()V

    iput-object v1, p0, Lj1c;->d:Ljava/lang/Object;

    iget-object v1, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v1, Ldfe;

    invoke-virtual {v1}, Ldfe;->h()V

    iget-object v1, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast v1, Ldfe;

    invoke-virtual {v1}, Ldfe;->h()V

    iput-object v0, p0, Lj1c;->h:Ljava/lang/Object;

    iput-object v0, p0, Lj1c;->i:Ljava/lang/Object;

    iput-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_34

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "Compose:abandons"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_18
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldth;

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    invoke-interface {v0}, Ldth;->b()V
    :try_end_2a
    .catchall {:try_start_14 .. :try_end_2a} :catchall_2f

    goto :goto_18

    :cond_2b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_2f
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0

    :cond_34
    return-void
.end method

.method public final d()V
    .registers 9

    iget-object v0, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v0, Ldfe;

    iget-object v1, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v1, Ldfe;

    iget-object v2, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast v2, Ljava/util/Set;

    if-eqz v2, :cond_ad

    const/4 v3, 0x0

    iput-object v3, p0, Lj1c;->k:Ljava/lang/Object;

    iget v3, v1, Ldfe;->c:I

    const/16 v4, 0x11

    if-eqz v3, :cond_6f

    const-string v3, "Compose:onForgotten"

    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_1c
    iget-object v3, p0, Lj1c;->h:Ljava/lang/Object;

    check-cast v3, Ltee;

    iget v5, v1, Ldfe;->c:I

    add-int/lit8 v5, v5, -0x1

    :goto_24
    const/4 v6, -0x1

    if-ge v6, v5, :cond_66

    iget-object v6, v1, Ldfe;->a:[Ljava/lang/Object;

    aget-object v6, v6, v5
    :try_end_2b
    .catchall {:try_start_1c .. :try_end_2b} :catchall_6a

    :try_start_2b
    instance-of v7, v6, Lzt9;

    if-eqz v7, :cond_3a

    move-object v7, v6

    check-cast v7, Lzt9;

    iget-object v7, v7, Lzt9;->a:Ldth;

    invoke-interface {v2, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v7}, Ldth;->c()V

    :cond_3a
    instance-of v7, v6, Leg5;

    if-eqz v7, :cond_53

    if-eqz v3, :cond_4d

    invoke-virtual {v3, v6}, Ltee;->c(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4d

    move-object v7, v6

    check-cast v7, Leg5;

    invoke-interface {v7}, Leg5;->c()V

    goto :goto_53

    :cond_4d
    move-object v7, v6

    check-cast v7, Leg5;

    invoke-interface {v7}, Leg5;->a()V
    :try_end_53
    .catchall {:try_start_2b .. :try_end_53} :catchall_56

    :cond_53
    :goto_53
    add-int/lit8 v5, v5, -0x1

    goto :goto_24

    :catchall_56
    move-exception v0

    :try_start_57
    iget-object p0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast p0, Ldi5;

    if-eqz p0, :cond_65

    new-instance v1, Lgb3;

    invoke-direct {v1, p0, v6, v4}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lphj;->A0(Ljava/lang/Throwable;Lkotlin/jvm/functions/Function0;)Z

    :cond_65
    throw v0
    :try_end_66
    .catchall {:try_start_57 .. :try_end_66} :catchall_6a

    :cond_66
    invoke-static {}, Landroid/os/Trace;->endSection()V

    goto :goto_6f

    :catchall_6a
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0

    :cond_6f
    :goto_6f
    iget v1, v0, Ldfe;->c:I

    if-eqz v1, :cond_ad

    const-string v1, "Compose:onRemembered"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_78
    iget-object v1, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_a4

    iget-object v2, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    const/4 v3, 0x0

    :goto_83
    if-ge v3, v0, :cond_a4

    aget-object v5, v2, v3

    check-cast v5, Lzt9;

    iget-object v6, v5, Lzt9;->a:Ldth;

    invoke-interface {v1, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_8e
    .catchall {:try_start_78 .. :try_end_8e} :catchall_a8

    :try_start_8e
    invoke-interface {v6}, Ldth;->a()V
    :try_end_91
    .catchall {:try_start_8e .. :try_end_91} :catchall_94

    add-int/lit8 v3, v3, 0x1

    goto :goto_83

    :catchall_94
    move-exception v0

    :try_start_95
    iget-object p0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast p0, Ldi5;

    if-eqz p0, :cond_a3

    new-instance v1, Lgb3;

    invoke-direct {v1, p0, v5, v4}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lphj;->A0(Ljava/lang/Throwable;Lkotlin/jvm/functions/Function0;)Z

    :cond_a3
    throw v0
    :try_end_a4
    .catchall {:try_start_95 .. :try_end_a4} :catchall_a8

    :cond_a4
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_a8
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0

    :cond_ad
    return-void
.end method

.method public final e()V
    .registers 5

    iget-object p0, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast p0, Ldfe;

    iget v0, p0, Ldfe;->c:I

    if-eqz v0, :cond_2a

    const-string v0, "Compose:sideeffects"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    :try_start_d
    iget-object v0, p0, Ldfe;->a:[Ljava/lang/Object;

    iget v1, p0, Ldfe;->c:I

    const/4 v2, 0x0

    :goto_12
    if-ge v2, v1, :cond_1e

    aget-object v3, v0, v2

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_1e
    invoke-virtual {p0}, Ldfe;->h()V
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_25

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_25
    move-exception p0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0

    :cond_2a
    return-void
.end method

.method public final f(Lzt9;)V
    .registers 4

    iget-object v0, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v0, Ldfe;

    iget-object v1, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v1, Ltee;

    invoke-virtual {v1, p1}, Ltee;->c(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    iget-object v1, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v1, Ltee;

    invoke-virtual {v1, p1}, Ltee;->l(Ljava/lang/Object;)Z

    iget-object v1, p0, Lj1c;->d:Ljava/lang/Object;

    check-cast v1, Ldfe;

    invoke-virtual {v1, p1}, Ldfe;->k(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    invoke-virtual {v0, p1}, Ldfe;->k(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    invoke-static {p1, v0}, Lj1c;->g(Lzt9;Ldfe;)Z

    :cond_28
    iget-object p0, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_40

    iget-object p1, p1, Lzt9;->a:Ldth;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_34
    iget-object v0, p0, Lj1c;->k:Ljava/lang/Object;

    check-cast v0, Ltee;

    if-eqz v0, :cond_41

    invoke-virtual {v0, p1}, Ltee;->c(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    :cond_40
    return-void

    :cond_41
    iget-object p0, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast p0, Ldfe;

    invoke-virtual {p0, p1}, Ldfe;->c(Ljava/lang/Object;)V

    return-void
.end method

.method public final h(Z)V
    .registers 11

    iget-object v0, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lj1c;->f:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    iget-object v3, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/appbar/AppBarLayout;

    iget-object v4, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast v4, Lyz7;

    iget-object v5, p0, Lj1c;->d:Ljava/lang/Object;

    check-cast v5, Landroid/view/View;

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz p1, :cond_7a

    if-eqz v5, :cond_21

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    :cond_21
    if-eqz v2, :cond_32

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    :cond_32
    if-eqz v3, :cond_3e

    iput-boolean v7, v3, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v6, v3, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    invoke-virtual {v3, v7, v6}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    invoke-virtual {v3, v7, v7, v6}, Lcom/google/android/material/appbar/AppBarLayout;->k(ZZZ)V

    :cond_3e
    if-eqz v1, :cond_43

    invoke-virtual {v1, v7}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    :cond_43
    const/4 v1, 0x0

    if-eqz v0, :cond_49

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    goto :goto_4a

    :cond_49
    move-object v2, v1

    :goto_4a
    iput-object v2, p0, Lj1c;->i:Ljava/lang/Object;

    if-eqz v0, :cond_51

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    :cond_51
    if-eqz v4, :cond_5c

    iget-object v0, v4, Lyz7;->b:Lwz7;

    iget v0, v0, Lwz7;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_5d

    :cond_5c
    move-object v0, v1

    :goto_5d
    iput-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    if-eqz v4, :cond_69

    iget-object v0, v4, Lyz7;->b:Lwz7;

    iget v0, v0, Lwz7;->c:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_69
    iput-object v1, p0, Lj1c;->k:Ljava/lang/Object;

    if-eqz v4, :cond_c8

    const v0, 0x7f14103c

    invoke-virtual {v4, v0}, Lyz7;->b(I)V

    const v0, 0x7f130035

    invoke-virtual {v4, v0}, Lyz7;->a(I)V

    goto :goto_c8

    :cond_7a
    if-eqz v5, :cond_80

    const/4 v8, 0x4

    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_80
    if-eqz v2, :cond_94

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v8, 0x7f0402f0

    invoke-static {v8, v5}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    :cond_94
    if-eqz v3, :cond_9a

    iput-boolean v6, v3, Lcom/google/android/material/appbar/AppBarLayout;->l:Z

    iput-boolean v7, v3, Lcom/google/android/material/appbar/AppBarLayout;->i:Z

    :cond_9a
    if-eqz v1, :cond_9f

    invoke-virtual {v1, v6}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    :cond_9f
    iget-object v1, p0, Lj1c;->i:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/e;

    if-eqz v1, :cond_aa

    if-eqz v0, :cond_aa

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    :cond_aa
    iget-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_b9

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-eqz v4, :cond_b9

    invoke-virtual {v4, v0}, Lyz7;->b(I)V

    :cond_b9
    iget-object v0, p0, Lj1c;->k:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_c8

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-eqz v4, :cond_c8

    invoke-virtual {v4, v0}, Lyz7;->a(I)V

    :cond_c8
    :goto_c8
    iget-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_fb

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    if-eqz v0, :cond_fb

    iget-object v1, v0, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_da
    if-ge v7, v1, :cond_fb

    invoke-virtual {v0, v7}, Litd;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v3, p0, Lj1c;->h:Ljava/lang/Object;

    check-cast v3, Lxsi;

    if-eqz v3, :cond_ea

    invoke-interface {v3, v2, p1}, Lxsi;->b(Landroid/view/MenuItem;Z)V

    goto :goto_f8

    :cond_ea
    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0932

    if-eq v3, v4, :cond_f8

    xor-int/lit8 v3, p1, 0x1

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_f8
    :goto_f8
    add-int/lit8 v7, v7, 0x1

    goto :goto_da

    :cond_fb
    return-void
.end method

.method public final i(Ljava/util/Set;Ldi5;)V
    .registers 3

    invoke-virtual {p0}, Lj1c;->b()V

    iput-object p1, p0, Lj1c;->f:Ljava/lang/Object;

    iput-object p2, p0, Lj1c;->a:Ljava/lang/Object;

    return-void
.end method

.method public final j()V
    .registers 4

    invoke-virtual {p0}, Lj1c;->k()V

    iget-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lj1c;->h:Ljava/lang/Object;

    check-cast v1, Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v0, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v0, Lv3m;

    iget-object v0, v0, Lv3m;->d:Lplk;

    iget-object v0, v0, Lplk;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object v1, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v1, Lv9j;

    iget-object v2, p0, Lj1c;->k:Ljava/lang/Object;

    check-cast v2, Li1c;

    invoke-virtual {v1, v0, v2}, Lh42;->s(Lekc;Lf7f;)V

    iput-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    iget-object v0, p0, Lj1c;->d:Ljava/lang/Object;

    check-cast v0, Ljbn;

    invoke-virtual {v0}, Ljbn;->a()Lekc;

    move-result-object v0

    iget-object p0, p0, Lj1c;->i:Ljava/lang/Object;

    check-cast p0, Li1c;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final k()V
    .registers 12

    iget-object v0, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v0, Lv9j;

    new-instance v1, Lh1c;

    iget-object v2, p0, Lj1c;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "language_code"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lywc;->a(Ljava/lang/String;)Lxwc;

    move-result-object v2

    iget-object v2, v2, Lxwc;->a:Ljava/lang/String;

    iget-object v3, p0, Lj1c;->d:Ljava/lang/Object;

    check-cast v3, Ljbn;

    invoke-virtual {v3}, Ljbn;->a()Lekc;

    move-result-object v3

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lywc;->a(Ljava/lang/String;)Lxwc;

    move-result-object v3

    iget-object v3, v3, Lxwc;->a:Ljava/lang/String;

    iget-object v4, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/SettingsManager;

    move-object v5, v4

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v4

    move-object v6, v5

    new-instance v5, Le5m;

    iget-object v7, p0, Lj1c;->c:Ljava/lang/Object;

    check-cast v7, Lv3m;

    iget-object v8, v7, Lv3m;->a:Landroid/content/Context;

    invoke-static {v8}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v8

    const-string v9, "translate_web_pages_enabled"

    invoke-virtual {v6, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v7}, Lv3m;->d()Lszb;

    move-result-object v7

    const-string v10, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {v6, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v5, v8, v9, v7, v6}, Le5m;-><init>(ZZLszb;Z)V

    iget-object p0, p0, Lj1c;->g:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Ljava/util/Set;

    invoke-direct/range {v1 .. v6}, Lh1c;-><init>(Ljava/lang/String;Ljava/lang/String;Lz4m;Le5m;Ljava/util/Set;)V

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final onStopped()V
    .registers 3

    iget-object v0, p0, Lj1c;->d:Ljava/lang/Object;

    check-cast v0, Ljbn;

    invoke-virtual {v0}, Ljbn;->a()Lekc;

    move-result-object v0

    iget-object v1, p0, Lj1c;->i:Ljava/lang/Object;

    check-cast v1, Li1c;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast v0, Lode;

    if-eqz v0, :cond_1c

    iget-object v1, p0, Lj1c;->e:Ljava/lang/Object;

    check-cast v1, Lv9j;

    invoke-virtual {v1, v0}, Lh42;->t(Lekc;)V

    :cond_1c
    const/4 v0, 0x0

    iput-object v0, p0, Lj1c;->j:Ljava/lang/Object;

    iget-object v0, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lj1c;->h:Ljava/lang/Object;

    check-cast p0, Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
