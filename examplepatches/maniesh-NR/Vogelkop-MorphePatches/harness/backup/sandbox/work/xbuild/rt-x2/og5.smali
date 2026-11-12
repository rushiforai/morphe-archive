.class public final Log5;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Log5;->a:B

    iput-object p1, p0, Log5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lzg;Lurj;)V
    .registers 3

    const/4 p2, 0x6

    iput-byte p2, p0, Log5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Log5;->b:Ljava/lang/Object;

    return-void
.end method

.method private final b(Lhjm;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Log5;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    iget-object v6, v0, Log5;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_180

    new-instance v0, Lqf;

    check-cast v6, Ljmn;

    const/4 v2, 0x4

    invoke-direct {v0, v1, v6, v2}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_17
    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    new-instance v2, Lpg5;

    check-cast v6, Lzg;

    invoke-direct {v2, v1, v0, v6}, Lpg5;-><init>(Lmej;Log5;Lzg;)V

    return-object v2

    :pswitch_22
    new-instance v0, Lrxk;

    check-cast v6, Lz4k;

    invoke-direct {v0, v1, v6}, Lrxk;-><init>(Lmej;Lz4k;)V

    return-object v0

    :pswitch_2a
    check-cast v6, Lru9;

    invoke-virtual {v6}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v6, "sync.acknowledgement_state"

    invoke-interface {v2, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    new-instance v0, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v8, Llxh;

    const v6, 0x7f0803bc

    invoke-direct {v8, v6}, Llxh;-><init>(I)V

    new-instance v11, Lrxh;

    const v6, 0x7f1415a9

    invoke-direct {v11, v6}, Lrxh;-><init>(I)V

    new-instance v12, Lrxh;

    const v6, 0x7f1415a8

    invoke-direct {v12, v6}, Lrxh;-><init>(I)V

    new-instance v6, Lrxh;

    const v7, 0x7f140bea

    invoke-direct {v6, v7}, Lrxh;-><init>(I)V

    new-instance v7, Lav5;

    invoke-direct {v7, v2, v4}, Lav5;-><init>(Landroid/content/Context;B)V

    invoke-static {v2, v6}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v2

    if-nez v2, :cond_70

    move-object v14, v3

    move-object v15, v14

    goto :goto_72

    :cond_70
    move-object v14, v6

    move-object v15, v7

    :goto_72
    new-instance v2, Lrxh;

    const v3, 0x7f140812

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v6, Lgua;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v16, v2

    invoke-direct/range {v6 .. v21}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v0, v1, v6, v5}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_93
    new-instance v0, Lqf;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v6, Lo4i;

    iget-object v4, v6, Lo4i;->a:Ljava/lang/String;

    new-instance v12, Lqxh;

    invoke-direct {v12, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Lo4i;->b:Landroid/text/SpannableStringBuilder;

    new-instance v13, Lqxh;

    invoke-direct {v13, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Lo4i;->d:Ln4i;

    iget-object v4, v4, Ln4i;->a:Ljava/lang/String;

    new-instance v7, Lqxh;

    invoke-direct {v7, v4}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Lzu5;

    const/4 v8, 0x5

    invoke-direct {v4, v6, v2, v8}, Lzu5;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v7, v8}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_cb

    move-object/from16 v17, v3

    move-object/from16 v18, v17

    goto :goto_cf

    :cond_cb
    move-object/from16 v18, v4

    move-object/from16 v17, v7

    :goto_cf
    iget-object v4, v6, Lo4i;->g:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_db

    new-instance v7, Lc37;

    invoke-direct {v7, v2, v4}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v8, v3

    move-object v10, v7

    goto :goto_ed

    :cond_db
    iget-object v4, v6, Lo4i;->f:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_e7

    new-instance v7, Lc37;

    invoke-direct {v7, v2, v4}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_e4
    move-object v10, v3

    move-object v8, v7

    goto :goto_ed

    :cond_e7
    new-instance v7, Lnx;

    invoke-direct {v7, v2}, Lnx;-><init>(Landroid/content/Context;)V

    goto :goto_e4

    :goto_ed
    iget-object v4, v6, Lo4i;->e:Ln4i;

    if-eqz v4, :cond_112

    iget-object v7, v4, Ln4i;->a:Ljava/lang/String;

    new-instance v9, Lqxh;

    invoke-direct {v9, v7}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v7, Lzu5;

    const/4 v11, 0x6

    invoke-direct {v7, v4, v2, v11}, Lzu5;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v9, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-nez v4, :cond_10e

    move-object v7, v3

    move-object v9, v7

    :cond_10e
    move-object/from16 v16, v7

    move-object v15, v9

    goto :goto_115

    :cond_112
    move-object v15, v3

    move-object/from16 v16, v15

    :goto_115
    iget-object v4, v6, Lo4i;->c:Landroid/text/SpannableStringBuilder;

    if-eqz v4, :cond_136

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v6, 0x7f0d0368

    const/4 v7, 0x0

    invoke-virtual {v2, v6, v3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v6, 0x7f0a0957

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_138

    move-object v3, v2

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_136
    move-object v14, v3

    goto :goto_14a

    :cond_138
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_15d

    :goto_14a
    new-instance v7, Lgua;

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v7 .. v22}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    invoke-direct {v0, v1, v7, v5}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    move-object v3, v0

    :goto_15d
    return-object v3

    :pswitch_15e
    new-instance v2, Lz4b;

    invoke-direct {v2, v1, v0}, Lz4b;-><init>(Lmej;Log5;)V

    return-object v2

    :pswitch_164
    new-instance v2, Llm6;

    check-cast v6, Lmm6;

    invoke-virtual {v6}, Lmm6;->a()Lyl6;

    move-result-object v3

    new-instance v5, Lqe6;

    invoke-direct {v5, v0, v4}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v1, v3, v4, v5}, Llm6;-><init>(Lmej;Lyl6;ZLgm6;)V

    return-object v2

    :pswitch_175
    new-instance v0, Lpg5;

    check-cast v1, Lrg5;

    check-cast v6, Lue5;

    invoke-direct {v0, v1, v6}, Lpg5;-><init>(Lrg5;Lue5;)V

    return-object v0

    nop

    :pswitch_data_180
    .packed-switch 0x0
        :pswitch_175
        :pswitch_164
        :pswitch_15e
        :pswitch_93
        :pswitch_2a
        :pswitch_22
        :pswitch_17
    .end packed-switch
.end method

.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 6

    iget-byte v0, p0, Log5;->a:B

    sparse-switch v0, :sswitch_data_24

    invoke-super {p0, p1}, Lcej;->createSheetHost(Landroid/content/Context;)Lmej;

    move-result-object p0

    return-object p0

    :sswitch_a
    new-instance v0, Lwq3;

    new-instance v1, Lamn;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lamn;-><init>(Lcej;Landroid/content/Context;B)V

    const p0, 0x7f150198

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-direct {v0, p1, p0, v3, v2}, Lwq3;-><init>(Landroid/content/Context;IZB)V

    iput-object v1, v0, Lvq3;->d:Lsni;

    return-object v0

    :sswitch_1d
    new-instance p0, Lrg5;

    invoke-direct {p0, p1}, Lrg5;-><init>(Landroid/content/Context;)V

    return-object p0

    nop

    :sswitch_data_24
    .sparse-switch
        0x0 -> :sswitch_1d
        0x6 -> :sswitch_a
    .end sparse-switch
.end method

.method public final d(Landroid/content/Context;)V
    .registers 5

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_15

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->c(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    :cond_15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0092

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    mul-int/lit8 v2, v1, 0xc

    add-int/lit8 v2, v2, 0x18

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iget-object p0, p0, Log5;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    int-to-float p1, p1

    sub-float/2addr v0, p1

    int-to-float p1, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr p1, v1

    div-float/2addr v0, p1

    float-to-int p1, v0

    iput p1, p0, Lzg;->a:I

    return-void
.end method

.method public final isAllowed(Lb2l;)Z
    .registers 3

    iget-byte v0, p0, Log5;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lcej;->isAllowed(Lb2l;)Z

    move-result p0

    return p0

    :pswitch_a
    if-eqz p1, :cond_18

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x0

    goto :goto_19

    :cond_18
    const/4 p0, 0x1

    :goto_19
    return p0

    :pswitch_data_1a
    .packed-switch 0x6
        :pswitch_a
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 7

    iget-byte v0, p0, Log5;->a:B

    sget-object v1, Lvb0;->d:Lvb0;

    const/4 v2, 0x0

    sget-object v3, Lhjm;->b:Lhjm;

    iget-object v4, p0, Log5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    :pswitch_c
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    return-void

    :pswitch_10
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    check-cast v4, Lzg;

    iget-object v0, v4, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, v0, Lqln;->l:Lqs7;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v2, Lqs7;->p:Ljava/lang/String;

    if-ne p1, v3, :cond_26

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lqln;->o(Z)V

    :cond_26
    iput-object v2, v4, Lzg;->c:Ljava/lang/Object;

    sget-object p1, Lzg;->e:Log5;

    if-ne p1, p0, :cond_2e

    sput-object v2, Lzg;->e:Log5;

    :cond_2e
    return-void

    :pswitch_2f
    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    if-ne p1, v3, :cond_3d

    check-cast v4, Lb5b;

    invoke-interface {v4}, Lb5b;->b()La5b;

    move-result-object p0

    invoke-virtual {p0, v1}, La5b;->a(Lvb0;)V

    :cond_3d
    return-void

    :pswitch_3e
    if-ne p1, v3, :cond_47

    check-cast v4, Lmm6;

    sget-object p0, Lac0;->c:Lac0;

    invoke-virtual {v4, v1, p0, v2}, Lmm6;->c(Lvb0;Lac0;Ljava/lang/String;)V

    :cond_47
    :pswitch_47
    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_47
        :pswitch_3e
        :pswitch_2f
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_10
    .end packed-switch
.end method
