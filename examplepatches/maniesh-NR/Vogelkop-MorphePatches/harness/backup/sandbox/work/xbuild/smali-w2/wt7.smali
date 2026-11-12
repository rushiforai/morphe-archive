.class public final Lwt7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final m:J

.field public static final n:J

.field public static final synthetic o:I


# instance fields
.field public final a:Lha6;

.field public final b:Ldbf;

.field public final c:Lpde;

.field public final d:Liv7;

.field public final e:Ligi;

.field public final f:Lm0a;

.field public final g:Lhd;

.field public final h:Lp8f;

.field public final i:Lpde;

.field public final j:Lu0a;

.field public k:Z

.field public l:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x78

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lwt7;->m:J

    invoke-static {v0, v1}, Lpn7;->d(J)J

    move-result-wide v0

    sput-wide v0, Lwt7;->n:J

    return-void
.end method

.method public constructor <init>(Lfe5;Lha6;Ldbf;Lpde;Liv7;Ligi;Lm0a;Lhd;Lp8f;Lpde;Lu0a;Lq2;Llv7;)V
    .registers 27

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    move-object/from16 v5, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwt7;->a:Lha6;

    move-object/from16 v8, p3

    iput-object v8, p0, Lwt7;->b:Ldbf;

    iput-object v1, p0, Lwt7;->c:Lpde;

    iput-object v2, p0, Lwt7;->d:Liv7;

    iput-object v3, p0, Lwt7;->e:Ligi;

    iput-object v4, p0, Lwt7;->f:Lm0a;

    iput-object v5, p0, Lwt7;->g:Lhd;

    iput-object v6, p0, Lwt7;->h:Lp8f;

    move-object/from16 v8, p10

    iput-object v8, p0, Lwt7;->i:Lpde;

    iput-object v7, p0, Lwt7;->j:Lu0a;

    const/4 v8, 0x1

    iput-boolean v8, p0, Lwt7;->l:Z

    new-instance v9, Ljt7;

    const/4 v10, 0x0

    invoke-direct {v9, p0, v10}, Ljt7;-><init>(Lwt7;B)V

    new-instance v10, Lug;

    const/16 v11, 0xe

    invoke-direct {v10, v9, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v10}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v2, Liv7;->k:Lpde;

    new-instance v9, Ljt7;

    const/4 v10, 0x2

    invoke-direct {v9, p0, v10}, Ljt7;-><init>(Lwt7;B)V

    new-instance v12, Lug;

    invoke-direct {v12, v9, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v12}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v5, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lqde;

    new-instance v5, Ljt7;

    const/4 v9, 0x3

    invoke-direct {v5, p0, v9}, Ljt7;-><init>(Lwt7;B)V

    new-instance v9, Lug;

    invoke-direct {v9, v5, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v9}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v2, Liv7;->f:Lpde;

    new-instance v2, Ljt7;

    const/4 v5, 0x4

    invoke-direct {v2, p0, v5}, Ljt7;-><init>(Lwt7;B)V

    new-instance v5, Lug;

    invoke-direct {v5, v2, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v5}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v3, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Lode;

    new-instance v2, Ljt7;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Ljt7;-><init>(Lwt7;B)V

    new-instance v3, Lug;

    invoke-direct {v3, v2, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v4, Lm0a;->e:Lpde;

    new-instance v2, Ljt7;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v3}, Ljt7;-><init>(Lwt7;B)V

    new-instance v3, Lug;

    invoke-direct {v3, v2, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v7, Lu0a;->a:Lpde;

    new-instance v2, Ljt7;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v3}, Ljt7;-><init>(Lwt7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v2, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, p2, Lha6;->h:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v2, Ltaf;->g:Ltaf;

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    iget-object v1, p2, Lha6;->k:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v2, Ltaf;->h:Ltaf;

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    iget-object v1, p2, Lha6;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v2, Ltaf;->b:Ltaf;

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    iget-object v1, p2, Lha6;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v1, :cond_c4

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    :cond_c4
    iget-object v1, p2, Lha6;->i:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v2, Ltaf;->f:Ltaf;

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    iget-object v1, p2, Lha6;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    sget-object v2, Ltaf;->c:Ltaf;

    invoke-virtual {p0, v1, v2}, Lwt7;->c(Landroid/view/View;Ltaf;)V

    iget-object v1, p2, Lha6;->l:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v1, :cond_e6

    new-instance v2, Ljf7;

    move-object/from16 v4, p12

    invoke-direct {v2, v4, p0, v10}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_e6
    iget-object v1, p2, Lha6;->j:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v1, :cond_f6

    new-instance v2, Lyk4;

    move-object/from16 v4, p13

    invoke-direct {v2, v4, v11}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_f6
    iget-object v1, v6, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lpde;

    new-instance v2, Ljt7;

    invoke-direct {v2, p0, v8}, Ljt7;-><init>(Lwt7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v2, v11}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p2, Lha6;->n:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_117

    new-instance v1, Lyk4;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_117
    iget-object p1, p2, Lha6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance v0, Lz61;

    invoke-direct {v0, p0, v3}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lwt7;->a:Lha6;

    iget-object v0, p0, Lha6;->h:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    iget-object v0, p0, Lha6;->k:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    iget-object v0, p0, Lha6;->i:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    iget-object v0, p0, Lha6;->j:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v0, :cond_20

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    :cond_20
    iget-object v0, p0, Lha6;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    iget-object v0, p0, Lha6;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v0, :cond_30

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    :cond_30
    iget-object v0, p0, Lha6;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    iget-object v0, p0, Lha6;->l:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v0, :cond_40

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    :cond_40
    iget-object v0, p0, Lha6;->m:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v0, :cond_49

    invoke-static {v0}, Lix5;->o(Landroid/view/View;)V

    :cond_49
    iget-object p0, p0, Lha6;->n:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p0, :cond_52

    invoke-static {p0}, Lix5;->o(Landroid/view/View;)V

    :cond_52
    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lwt7;->k:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lwt7;->k:Z

    iget-object v0, p0, Lwt7;->a:Lha6;

    iget-object v0, v0, Lha6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v1, Lvr9;

    const/16 v2, 0x9

    invoke-direct {v1, v0, p0, v2}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lkff;->a(Landroid/view/View;Ljava/lang/Runnable;)Lkff;

    return-void
.end method

.method public final c(Landroid/view/View;Ltaf;)V
    .registers 5

    new-instance v0, Ldv2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, p2, v1}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lkt7;

    invoke-direct {v0, p0, p1, p2}, Lkt7;-><init>(Lwt7;Landroid/view/View;Ltaf;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method
