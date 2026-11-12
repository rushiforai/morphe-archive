.class public Lr9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxyn;
.implements Ljw1;
.implements Lhtd;
.implements Lkud;
.implements Lfvj;
.implements Lazc;
.implements Lfu8;
.implements Ldmg;
.implements Lzkf;
.implements Lvnk;
.implements Llii;


# static fields
.field public static final f:Lnyf;

.field public static g:I


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnyf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lr9i;->f:Lnyf;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lr9i;->a:B

    packed-switch p1, :pswitch_data_3e

    .line 711
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 712
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 713
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    .line 714
    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    .line 715
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 716
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    return-void

    .line 717
    :pswitch_25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 718
    new-instance p1, Lg1g;

    invoke-direct {p1}, Lg1g;-><init>()V

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 719
    new-instance p1, Lg1g;

    invoke-direct {p1}, Lg1g;-><init>()V

    iput-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    .line 720
    new-instance p1, Ledg;

    invoke-direct {p1}, Ledg;-><init>()V

    iput-object p1, p0, Lr9i;->d:Ljava/lang/Object;

    return-void

    :pswitch_data_3e
    .packed-switch 0x19
        :pswitch_25
    .end packed-switch
.end method

.method public synthetic constructor <init>(BZ)V
    .registers 3

    .line 727
    iput-byte p1, p0, Lr9i;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Le84;Lumi;)V
    .registers 5

    const/4 v0, 0x7

    iput-byte v0, p0, Lr9i;->a:B

    .line 728
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 729
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 730
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 731
    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    .line 732
    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/view/TouchIgnoringViewPager;)V
    .registers 6

    const/16 p1, 0x11

    iput-byte p1, p0, Lr9i;->a:B

    .line 721
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 722
    iput-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    .line 723
    iput-object p3, p0, Lr9i;->c:Ljava/lang/Object;

    .line 724
    iput-object p4, p0, Lr9i;->d:Ljava/lang/Object;

    .line 725
    iput-object p5, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/core/widget/NestedScrollView;Landroid/view/View;Lhcb;)V
    .registers 5

    const/16 v0, 0x14

    iput-byte v0, p0, Lr9i;->a:B

    .line 659
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 660
    new-array v0, v0, [I

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    .line 661
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 662
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 663
    iput-object p3, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbon;Lpad;Lqp6;Ld06;)V
    .registers 5

    const/16 p1, 0xb

    iput-byte p1, p0, Lr9i;->a:B

    .line 646
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 647
    iput-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    .line 648
    iput-object p3, p0, Lr9i;->c:Ljava/lang/Object;

    .line 649
    iput-object p4, p0, Lr9i;->d:Ljava/lang/Object;

    .line 650
    new-instance p1, Lr94;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lorg/chromium/content_public/browser/WebContents;Lks3;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lr9i;->a:B

    .line 651
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 652
    iput-object p3, p0, Lr9i;->b:Ljava/lang/Object;

    .line 653
    new-instance p3, Lqq8;

    new-instance v0, Ltu;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, v0}, Lqq8;-><init>(Lcom/opera/api/Callback;)V

    iput-object p3, p0, Lr9i;->c:Ljava/lang/Object;

    .line 654
    new-instance v0, Lupn;

    invoke-direct {v0, p3}, Lupn;-><init>(Lqq8;)V

    iput-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    .line 655
    new-instance p3, Lcom/opera/android/webcore/WebcoreRpcBridge;

    const/4 v0, 0x2

    invoke-direct {p3, v0, p2, p0}, Lcom/opera/android/webcore/WebcoreRpcBridge;-><init>(ILorg/chromium/content_public/browser/WebContents;Lxyn;)V

    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    .line 656
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    .line 657
    new-instance p2, Lrz;

    invoke-direct {p2, p0, v0}, Lrz;-><init>(Ljava/lang/Object;B)V

    .line 658
    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Lcsh;Lbpd;Lesg;Ls6h;)V
    .registers 6

    const/16 v0, 0x15

    iput-byte v0, p0, Lr9i;->a:B

    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_e

    .line 757
    invoke-static {p1}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p1

    goto :goto_12

    :cond_e
    sget-object p1, Lh1b;->b:La1b;

    .line 758
    sget-object p1, Lcsh;->e:Lcsh;

    .line 759
    :goto_12
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 760
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 761
    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    .line 762
    iput-object p4, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldkf;Landroid/view/View;IILjwf;)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Lr9i;->a:B

    .line 743
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 744
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 745
    new-instance v0, Lm66;

    .line 746
    invoke-direct {v0, p1}, Litd;-><init>(Landroid/content/Context;)V

    .line 747
    iput-object v0, p0, Lr9i;->c:Ljava/lang/Object;

    .line 748
    iput-object p0, v0, Litd;->e:Lhtd;

    .line 749
    iput-object p5, v0, Litd;->m:Ljwf;

    .line 750
    new-instance p5, Lo66;

    invoke-direct {p5, p1, v0, p2, p4}, Lo66;-><init>(Ldkf;Litd;Landroid/view/View;I)V

    iput-object p5, p0, Lr9i;->d:Ljava/lang/Object;

    .line 751
    iput p3, p5, Lo66;->m:I

    .line 752
    iput-object p0, p5, Lo66;->h:Lr9i;

    return-void
.end method

.method public constructor <init>(Lf9c;Landroid/content/Context;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Lr9i;->a:B

    .line 704
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 705
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lr9i;->d:Ljava/lang/Object;

    .line 706
    invoke-static {p2}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 707
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 708
    new-instance p1, Ldkf;

    const v0, 0x7f1505b9

    invoke-direct {p1, p2, v0}, Ldkf;-><init>(Landroid/content/Context;I)V

    const p2, 0x7f040216

    const v0, 0x7f0600b1

    .line 709
    invoke-static {p2, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 710
    iput-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfwa;Landroid/util/Size;Landroid/hardware/camera2/CameraCharacteristics;Z)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0x12

    iput-byte v2, v0, Lr9i;->a:B

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lxug;->i()V

    iput-object v1, v0, Lr9i;->b:Ljava/lang/Object;

    sget-object v2, Lqsm;->Kp:Lan2;

    const/4 v8, 0x0

    invoke-interface {v1, v2, v8}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lng4;

    if-eqz v2, :cond_267

    new-instance v3, Lpyl;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lpyl;-><init>(B)V

    invoke-virtual {v2, v1, v3}, Lng4;->a(Lfwa;Lpyl;)V

    invoke-virtual {v3}, Lpyl;->j()Lai4;

    move-result-object v2

    iput-object v2, v0, Lr9i;->c:Ljava/lang/Object;

    new-instance v9, Ligi;

    const/16 v10, 0xd

    invoke-direct {v9, v10}, Ligi;-><init>(B)V

    iput-object v8, v9, Ligi;->b:Ljava/lang/Object;

    iput-object v8, v9, Ligi;->g:Ljava/lang/Object;

    iput-object v9, v0, Lr9i;->d:Ljava/lang/Object;

    new-instance v11, Lg7m;

    invoke-static {}, Ltjb;->a()Ljava/util/concurrent/Executor;

    move-result-object v2

    sget-object v3, Lsjb;->wp:Lan2;

    invoke-interface {v1, v3, v2}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v3, p3

    invoke-direct {v11, v2, v3}, Lg7m;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCharacteristics;)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sget-object v2, Ltxa;->hp:Lan2;

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v13, 0x100

    const/16 v14, 0x20

    if-eqz v2, :cond_78

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ab

    :cond_78
    sget-object v2, Lfwa;->e:Lan2;

    invoke-interface {v1, v2, v8}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_87

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_a4

    :cond_87
    sget-object v2, Ltxa;->gp:Lan2;

    invoke-interface {v1, v2, v8}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_a3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v5, 0x1005

    if-ne v3, v5, :cond_9b

    move v2, v5

    goto :goto_a4

    :cond_9b
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v14, :cond_a3

    move v2, v14

    goto :goto_a4

    :cond_a3
    move v2, v13

    :goto_a4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_ab
    invoke-virtual {v1}, Lfwa;->m()I

    move-result v3

    sget-object v2, Lfwa;->g:Lan2;

    invoke-interface {v1, v2, v8}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_261

    new-instance v1, Lxm2;

    new-instance v6, Lms7;

    invoke-direct {v6}, Lms7;-><init>()V

    new-instance v7, Lms7;

    invoke-direct {v7}, Lms7;-><init>()V

    move-object/from16 v2, p2

    move/from16 v5, p4

    invoke-direct/range {v1 .. v7}, Lxm2;-><init>(Landroid/util/Size;ILjava/util/ArrayList;ZLms7;Lms7;)V

    iput-object v1, v0, Lr9i;->e:Ljava/lang/Object;

    iget-object v0, v9, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lxm2;

    const/4 v5, 0x1

    if-nez v0, :cond_db

    iget-object v0, v9, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Lbl9;

    if-nez v0, :cond_db

    move v0, v5

    goto :goto_dc

    :cond_db
    move v0, v12

    :goto_dc
    const-string v15, "CaptureNode does not support recreation yet."

    invoke-static {v15, v0}, Ljpo;->n(Ljava/lang/String;Z)V

    iput-object v1, v9, Ligi;->f:Ljava/lang/Object;

    new-instance v0, Lsb4;

    invoke-direct {v0, v9, v5}, Lsb4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-le v15, v5, :cond_f2

    move v15, v5

    :goto_ef
    move-object/from16 v16, v8

    goto :goto_f4

    :cond_f2
    move v15, v12

    goto :goto_ef

    :goto_f4
    const/4 v8, 0x2

    const/4 v10, 0x4

    if-nez p4, :cond_168

    if-eqz v15, :cond_13c

    move/from16 p0, v5

    new-instance v5, Ltxd;

    move/from16 p3, v12

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v12

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v14

    invoke-direct {v5, v12, v14, v13, v10}, Ltxd;-><init>(IIII)V

    new-array v12, v8, [Lrb4;

    aput-object v0, v12, p3

    iget-object v13, v5, Ltxd;->b:Lsb4;

    aput-object v13, v12, p0

    invoke-static {v12}, Lmkh;->m([Lrb4;)Lrb4;

    move-result-object v12

    new-instance v13, Ltxd;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v14

    move-object/from16 p1, v0

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v0

    move-object/from16 p4, v5

    const/16 v5, 0x20

    invoke-direct {v13, v14, v0, v5, v10}, Ltxd;-><init>(IIII)V

    new-array v0, v8, [Lrb4;

    aput-object p1, v0, p3

    iget-object v5, v13, Ltxd;->b:Lsb4;

    aput-object v5, v0, p0

    invoke-static {v0}, Lmkh;->m([Lrb4;)Lrb4;

    move-result-object v0

    move-object/from16 v5, p4

    move-object/from16 v16, v0

    move-object v0, v12

    goto :goto_15d

    :cond_13c
    move-object/from16 p1, v0

    move/from16 p0, v5

    move/from16 p3, v12

    new-instance v5, Ltxd;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v12

    invoke-direct {v5, v0, v12, v3, v10}, Ltxd;-><init>(IIII)V

    new-array v0, v8, [Lrb4;

    aput-object p1, v0, p3

    iget-object v10, v5, Ltxd;->b:Lsb4;

    aput-object v10, v0, p0

    invoke-static {v0}, Lmkh;->m([Lrb4;)Lrb4;

    move-result-object v0

    move-object/from16 v13, v16

    :goto_15d
    new-instance v10, Lki4;

    move/from16 v12, p3

    invoke-direct {v10, v9, v12}, Lki4;-><init>(Ligi;B)V

    move-object v12, v10

    move-object/from16 v10, v16

    goto :goto_18c

    :cond_168
    move-object/from16 p1, v0

    move/from16 p0, v5

    new-instance v5, Ls6h;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v12

    invoke-static {v0, v12, v3, v10}, Laib;->u(IIII)Lrn9;

    move-result-object v0

    invoke-direct {v5, v0}, Ls6h;-><init>(Ljava/lang/Object;)V

    iput-object v5, v9, Ligi;->g:Ljava/lang/Object;

    new-instance v10, Lki4;

    move/from16 v0, p0

    invoke-direct {v10, v9, v0}, Lki4;-><init>(Ligi;B)V

    move-object/from16 v0, p1

    move-object v12, v10

    move-object/from16 v10, v16

    move-object v13, v10

    :goto_18c
    iput-object v0, v1, Lxm2;->a:Lrb4;

    if-eqz v15, :cond_194

    if-eqz v10, :cond_194

    iput-object v10, v1, Lxm2;->b:Lrb4;

    :cond_194
    invoke-interface {v5}, Luya;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v10, v1, Lxm2;->c:Ls0b;

    if-nez v10, :cond_1a1

    const/4 v10, 0x1

    goto :goto_1a2

    :cond_1a1
    const/4 v10, 0x0

    :goto_1a2
    const-string v14, "The surface is already set."

    invoke-static {v14, v10}, Ljpo;->n(Ljava/lang/String;Z)V

    new-instance v10, Ls0b;

    invoke-direct {v10, v0, v2, v3}, Ls0b;-><init>(Landroid/view/Surface;Landroid/util/Size;I)V

    iput-object v10, v1, Lxm2;->c:Ls0b;

    new-instance v0, Lbl9;

    invoke-direct {v0, v5}, Lbl9;-><init>(Luya;)V

    iput-object v0, v9, Ligi;->c:Ljava/lang/Object;

    new-instance v0, Lva2;

    const/16 v10, 0x1b

    invoke-direct {v0, v9, v10}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v14

    invoke-interface {v5, v0, v14}, Luya;->w(Ltya;Ljava/util/concurrent/Executor;)V

    if-eqz v15, :cond_1f1

    if-eqz v13, :cond_1f1

    invoke-virtual {v13}, Ltxd;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iget-object v5, v1, Lxm2;->d:Ls0b;

    if-nez v5, :cond_1d1

    const/4 v5, 0x1

    goto :goto_1d2

    :cond_1d1
    const/4 v5, 0x0

    :goto_1d2
    const-string v14, "The secondary surface is already set."

    invoke-static {v14, v5}, Ljpo;->n(Ljava/lang/String;Z)V

    new-instance v5, Ls0b;

    invoke-direct {v5, v0, v2, v3}, Ls0b;-><init>(Landroid/view/Surface;Landroid/util/Size;I)V

    iput-object v5, v1, Lxm2;->d:Ls0b;

    new-instance v0, Lbl9;

    invoke-direct {v0, v13}, Lbl9;-><init>(Luya;)V

    iput-object v0, v9, Ligi;->d:Ljava/lang/Object;

    new-instance v0, Lva2;

    invoke-direct {v0, v9, v10}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Ltxd;->w(Ltya;Ljava/util/concurrent/Executor;)V

    :cond_1f1
    iput-object v12, v6, Lms7;->b:Ljava/lang/Object;

    new-instance v0, Lki4;

    invoke-direct {v0, v9, v8}, Lki4;-><init>(Ligi;B)V

    iput-object v0, v7, Lms7;->b:Ljava/lang/Object;

    new-instance v0, Lio2;

    new-instance v1, Lms7;

    invoke-direct {v1}, Lms7;-><init>()V

    new-instance v2, Lms7;

    invoke-direct {v2}, Lms7;-><init>()V

    invoke-direct {v0, v1, v2, v3, v4}, Lio2;-><init>(Lms7;Lms7;ILjava/util/ArrayList;)V

    iput-object v0, v9, Ligi;->e:Ljava/lang/Object;

    iput-object v0, v11, Lg7m;->d:Ljava/lang/Object;

    new-instance v0, Lp1h;

    const/4 v12, 0x0

    invoke-direct {v0, v11, v12}, Lp1h;-><init>(Lg7m;B)V

    iput-object v0, v1, Lms7;->b:Ljava/lang/Object;

    new-instance v0, Lp1h;

    const/4 v1, 0x1

    invoke-direct {v0, v11, v1}, Lp1h;-><init>(Lg7m;B)V

    iput-object v0, v2, Lms7;->b:Ljava/lang/Object;

    new-instance v0, Lj06;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lj06;-><init>(B)V

    iput-object v0, v11, Lg7m;->e:Ljava/lang/Object;

    new-instance v0, Lqe6;

    iget-object v1, v11, Lg7m;->k:Ljava/lang/Object;

    check-cast v1, Lygh;

    invoke-direct {v0, v1}, Lqe6;-><init>(Lygh;)V

    iput-object v0, v11, Lg7m;->f:Ljava/lang/Object;

    new-instance v0, Lr16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, v11, Lg7m;->g:Ljava/lang/Object;

    new-instance v0, Lzpa;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lzpa;-><init>(B)V

    iput-object v0, v11, Lg7m;->b:Ljava/lang/Object;

    new-instance v0, Lhr5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, v11, Lg7m;->h:Ljava/lang/Object;

    new-instance v0, Li06;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    iput-object v0, v11, Lg7m;->j:Ljava/lang/Object;

    const/16 v0, 0x23

    if-eq v3, v0, :cond_259

    iget-boolean v0, v11, Lg7m;->a:Z

    if-eqz v0, :cond_260

    :cond_259
    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, v11, Lg7m;->i:Ljava/lang/Object;

    :cond_260
    return-void

    :cond_261
    move-object/from16 v16, v8

    invoke-static {}, Lh9o;->t()V

    throw v16

    :cond_267
    move-object/from16 v16, v8

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lfcl;->Cp:Lan2;

    invoke-interface {v1, v2, v0}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "Implementation is missing option unpacker for "

    invoke-static {v0, v1}, Lj9h;->u(Ljava/lang/Object;Ljava/lang/String;)V

    throw v16
.end method

.method public constructor <init>(Li16;Lu59;Ls99;)V
    .registers 5

    const/16 v0, 0x9

    iput-byte v0, p0, Lr9i;->a:B

    .line 636
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 637
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 638
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 639
    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    .line 640
    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lumi;)V
    .registers 4

    const/16 v0, 0xe

    iput-byte v0, p0, Lr9i;->a:B

    .line 641
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 642
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 643
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 644
    new-instance p2, Ljava/io/File;

    const-string v0, "favorite_catalog_json_data"

    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lr9i;->d:Ljava/lang/Object;

    .line 645
    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 635
    iput-byte p5, p0, Lr9i;->a:B

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    iput-object p4, p0, Lr9i;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lr9i;->a:B

    .line 692
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 693
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 694
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 695
    iput-object p3, p0, Lr9i;->d:Ljava/lang/Object;

    .line 696
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/net/Socket;)V
    .registers 3

    const/16 v0, 0xc

    iput-byte v0, p0, Lr9i;->a:B

    .line 683
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 684
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    .line 685
    new-instance p1, Luv6;

    invoke-direct {p1, p0}, Luv6;-><init>(Lr9i;)V

    iput-object p1, p0, Lr9i;->d:Ljava/lang/Object;

    .line 686
    new-instance p1, Ltv6;

    invoke-direct {p1, p0}, Ltv6;-><init>(Lr9i;)V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 8

    const/4 p2, 0x1

    iput-byte p2, p0, Lr9i;->a:B

    .line 733
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 734
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 735
    new-instance p2, Landroid/util/SparseBooleanArray;

    invoke-direct {p2}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p2, p0, Lr9i;->d:Ljava/lang/Object;

    .line 736
    new-instance p2, Landroidx/collection/ArrayMap;

    const/4 v0, 0x0

    .line 737
    invoke-direct {p2, v0}, Lhkj;-><init>(I)V

    .line 738
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 739
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/high16 v1, -0x80000000

    const/4 v2, 0x0

    :goto_1e
    if-ge v0, p2, :cond_2f

    .line 740
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loyf;

    .line 741
    iget v4, v3, Loyf;->e:I

    if-le v4, v1, :cond_2c

    move-object v2, v3

    move v1, v4

    :cond_2c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 742
    :cond_2f
    iput-object v2, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk6l;Lcom/opera/android/settings/SettingsManager;)V
    .registers 6

    const/16 v0, 0x8

    iput-byte v0, p0, Lr9i;->a:B

    .line 697
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 698
    new-instance v0, Li25;

    invoke-direct {v0, p0}, Li25;-><init>(Lr9i;)V

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    .line 699
    new-instance v1, Lj25;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lr9i;->e:Ljava/lang/Object;

    .line 700
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 701
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    .line 702
    invoke-virtual {p1, v0}, Lk6l;->c(Lj6l;)V

    .line 703
    invoke-virtual {p2, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public constructor <init>(Lkii;Lkii;)V
    .registers 4

    const/16 v0, 0x1c

    iput-byte v0, p0, Lr9i;->a:B

    .line 753
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 754
    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    .line 755
    iput-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Lu02;)V
    .registers 6

    const/4 v0, 0x5

    iput-byte v0, p0, Lr9i;->a:B

    .line 687
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 688
    new-instance v0, Lqq8;

    new-instance v1, Lab;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lqq8;-><init>(Lcom/opera/api/Callback;)V

    iput-object v0, p0, Lr9i;->c:Ljava/lang/Object;

    .line 689
    new-instance v1, Lole;

    invoke-direct {v1, v0}, Lole;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lr9i;->e:Ljava/lang/Object;

    .line 690
    new-instance v0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, p0}, Lcom/opera/android/webcore/WebcoreRpcBridge;-><init>(ILorg/chromium/content_public/browser/WebContents;Lxyn;)V

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    .line 691
    iput-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lppf;Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    const/16 v0, 0x17

    iput-byte v0, p0, Lr9i;->a:B

    .line 726
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    iput-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    iput-object p3, p0, Lr9i;->c:Ljava/lang/Object;

    iput-object p4, p0, Lr9i;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luy8;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 6

    const/16 v0, 0xf

    iput-byte v0, p0, Lr9i;->a:B

    .line 763
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    iput-object p3, p0, Lr9i;->c:Ljava/lang/Object;

    iput-object p4, p0, Lr9i;->d:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lvzk;)V
    .registers 6

    const/16 v0, 0x18

    iput-byte v0, p0, Lr9i;->a:B

    .line 664
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 665
    iget-object v0, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    .line 666
    iget-object v1, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    .line 667
    sget-object v2, Lfd7;->p:Ljava/util/LinkedHashSet;

    .line 668
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 669
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 670
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 671
    sget-object v3, Lfd7;->q:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 672
    :cond_33
    iput-object v2, p0, Lr9i;->b:Ljava/lang/Object;

    .line 673
    new-instance v0, Lj06;

    const/16 v1, 0x17

    .line 674
    invoke-direct {v0, v1}, Lj06;-><init>(B)V

    .line 675
    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    .line 676
    iget-object v0, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    .line 677
    iput-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    .line 678
    iget-object p1, p1, Lvzk;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    .line 679
    iput-object p1, p0, Lr9i;->c:Ljava/lang/Object;

    .line 680
    new-instance p0, Lc5o;

    .line 681
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-direct {p0, p1, v0}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 682
    new-instance p1, Lg8b;

    invoke-direct {p1, p0}, Lg8b;-><init>(Lc5o;)V

    return-void
.end method

.method public static K(II)Z
    .registers 3

    const/16 v0, 0x21

    if-gt p1, v0, :cond_8

    if-le p0, v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public static Q(JLjava/util/HashMap;)V
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v3, v3, p0

    if-gtz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_2f
    const/4 p0, 0x0

    :goto_30
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p0, p1, :cond_40

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p0, p0, 0x1

    goto :goto_30

    :cond_40
    return-void
.end method


# virtual methods
.method public final A()Lx79;
    .registers 1

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lx79;

    return-object p0
.end method

.method public final B(Ljava/util/List;)Ljava/util/ArrayList;
    .registers 7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-static {v0, v1, v2}, Lr9i;->Q(JLjava/util/HashMap;)V

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-static {v0, v1, p0}, Lr9i;->Q(JLjava/util/HashMap;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_18
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_3e

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loa3;

    iget-object v4, v3, Loa3;->b:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    iget v4, v3, Loa3;->c:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3b
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_3e
    return-object v0
.end method

.method public final C()Lh40;
    .registers 5

    iget-object v0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    iget-object v2, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v2, Lg40;

    if-eqz v2, :cond_43

    iget-object v2, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_3d

    iget-object v2, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_37

    new-instance v1, Lh40;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lg40;

    invoke-direct {v1, v0, v2, v3, p0}, Lh40;-><init>(IIILg40;)V

    return-object v1

    :cond_37
    const-string p0, "Tag size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_3d
    const-string p0, "IV size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_43
    const-string p0, "Variant is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1

    :cond_49
    const-string p0, "Key size is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v1
.end method

.method public final D()Lar7;
    .registers 7

    sget-object v0, Lc30;->h:Lc30;

    iget-object v1, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Lu30;

    const/4 v2, 0x0

    if-eqz v1, :cond_5d

    iget-object v3, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v3, Lzq7;

    if-eqz v3, :cond_57

    iget-object v4, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v4, Lc30;

    if-eqz v4, :cond_51

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lg40;

    if-eqz p0, :cond_4b

    sget-object v5, Lzq7;->c:Lzq7;

    if-ne v3, v5, :cond_29

    sget-object v5, Lc30;->f:Lc30;

    if-eq v4, v5, :cond_29

    const-string p0, "NIST_P256 requires SHA256"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_29
    sget-object v5, Lzq7;->d:Lzq7;

    if-ne v3, v5, :cond_39

    sget-object v5, Lc30;->g:Lc30;

    if-eq v4, v5, :cond_39

    if-eq v4, v0, :cond_39

    const-string p0, "NIST_P384 requires SHA384 or SHA512"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_39
    sget-object v5, Lzq7;->e:Lzq7;

    if-ne v3, v5, :cond_45

    if-eq v4, v0, :cond_45

    const-string p0, "NIST_P521 requires SHA512"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_45
    new-instance v0, Lar7;

    invoke-direct {v0, v1, v3, v4, p0}, Lar7;-><init>(Lu30;Lzq7;Lc30;Lg40;)V

    return-object v0

    :cond_4b
    const-string p0, "variant is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_51
    const-string p0, "hash type is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_57
    const-string p0, "EC curve type is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2

    :cond_5d
    const-string p0, "signature encoding is not set"

    invoke-static {p0}, Lt3p;->w(Ljava/lang/String;)V

    return-object v2
.end method

.method public final E()V
    .registers 6

    invoke-static {}, Lxug;->i()V

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Ligi;

    invoke-static {}, Lxug;->i()V

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lxm2;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Lbl9;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Lbl9;

    iget-object v2, v0, Lxm2;->c:Ls0b;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lg07;->a()V

    iget-object v2, v0, Lxm2;->c:Ls0b;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v2, Lg07;->e:Lo94;

    invoke-static {v2}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    new-instance v3, Lli4;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lli4;-><init>(Lbl9;B)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iget-object v1, v0, Lxm2;->e:Ls0b;

    const/4 v2, 0x1

    if-eqz v1, :cond_59

    invoke-virtual {v1}, Lg07;->a()V

    iget-object v1, v0, Lxm2;->e:Ls0b;

    iget-object v1, v1, Lg07;->e:Lo94;

    invoke-static {v1}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v3, Lli4;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v2}, Lli4;-><init>(Lbl9;B)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :cond_59
    iget-object v1, v0, Lxm2;->h:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v2, :cond_7d

    iget-object v1, v0, Lxm2;->d:Ls0b;

    if-eqz v1, :cond_7d

    invoke-virtual {v1}, Lg07;->a()V

    iget-object v0, v0, Lxm2;->d:Ls0b;

    iget-object v0, v0, Lg07;->e:Lo94;

    invoke-static {v0}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Lli4;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lli4;-><init>(Lbl9;B)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :cond_7d
    return-void
.end method

.method public F(Loqe;Lga6;)Ljava/lang/String;
    .registers 4

    check-cast p1, Lmsh;

    iget-object p1, p1, Lmsh;->i:Landroid/net/Uri;

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    iget-object p2, p2, Lga6;->b:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/Point;

    iget v0, p2, Landroid/graphics/Point;->x:I

    iget p2, p2, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, p1, v0, p2}, Luqe;->m(Landroid/net/Uri;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final G()Ljava/io/File;
    .registers 3

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "account_profile_picture.png-account_profile_picture.png"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public H(Loqe;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lmsh;

    iget-object p0, p1, Lmsh;->h:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_d

    iget-object p0, p1, Lmsh;->h:Ljava/lang/String;

    return-object p0

    :cond_d
    invoke-virtual {p1}, Lmsh;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public I(Loqe;)J
    .registers 3

    check-cast p1, Lmsh;

    iget-wide p0, p1, Lmsh;->o:J

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public J(Loqe;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lmsh;

    iget-object p0, p1, Lmsh;->z:Lxlg;

    if-nez p0, :cond_9

    iget-object p0, p1, Loqe;->b:Ljava/lang/String;

    return-object p0

    :cond_9
    iget-object p0, p0, Lxlg;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final L(I)V
    .registers 4

    new-instance v0, Ll66;

    iget-object v1, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Ldkf;

    invoke-direct {v0, p0, v1}, Ll66;-><init>(Lr9i;Ldkf;)V

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    invoke-virtual {v0, p1, p0}, Ll66;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public final M(Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 7

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-object v1, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Le84;

    iget-object v1, v1, Le84;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "image_url"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1b

    const/4 v1, 0x0

    goto :goto_1f

    :cond_1b
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    :goto_1f
    if-nez v1, :cond_25

    invoke-interface {p2, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_25
    new-instance v1, Lxj;

    const/16 v2, 0x17

    invoke-direct {v1, p0, p1, v2}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance v1, Llw0;

    const/4 v2, 0x2

    invoke-direct {v1, p2, v2}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnml;->b(Lnml;)V

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p0, p2, v3}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final N(Llx8;Lj82;)V
    .registers 3

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lylg;

    if-eqz p0, :cond_9

    invoke-interface {p0, p1, p2}, Lylg;->n(Llx8;Lj82;)V

    :cond_9
    return-void
.end method

.method public final O(Lj82;Z)V
    .registers 3

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    if-eqz p2, :cond_21

    move-object p2, p1

    check-cast p2, Lpue;

    iget-object p2, p2, Lj82;->c:Loqe;

    iget-boolean p1, p1, Lj82;->e:Z

    if-eqz p2, :cond_1d

    iget-object p0, p0, Luqe;->h:Luy8;

    if-eqz p1, :cond_18

    const/4 p1, 0x2

    invoke-virtual {p0, p2, p1}, Luy8;->j(Loqe;I)V

    return-void

    :cond_18
    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Luy8;->j(Loqe;I)V

    return-void

    :cond_1d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :cond_21
    check-cast p1, Lpue;

    iget-object p1, p1, Lj82;->c:Loqe;

    check-cast p1, Lmsh;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object p2, p0, Luy8;->d:Ljec;

    invoke-static {p2, p1}, Luy8;->i(Ljec;Lmsh;)V

    iget-object p0, p0, Luy8;->e:Ljec;

    invoke-static {p0, p1}, Luy8;->i(Ljec;Lmsh;)V

    return-void
.end method

.method public final P(Ljec;Ljava/util/ArrayList;)V
    .registers 10

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Luy8;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_9
    :goto_9
    if-ge v1, v0, :cond_41

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ldy8;

    iget-object v3, v2, Ldy8;->a:Ljava/lang/String;

    const-string v4, "impression"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    check-cast v2, Ley8;

    iget-object v2, v2, Lzx8;->d:Ljava/lang/String;

    iget-object v3, p0, Luy8;->w:Ljava/util/Set;

    iget-object v4, p0, Luy8;->y:Ljava/util/Set;

    iget-object v5, p0, Luy8;->H:Lk5o;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    const/4 v6, 0x1

    if-eqz v3, :cond_3a

    invoke-virtual {v5, v2, v6}, Lk5o;->r(Ljava/lang/String;Z)V

    iget-object v3, p0, Luy8;->x:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {v4, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_3a
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v2, v6}, Lk5o;->r(Ljava/lang/String;Z)V

    goto :goto_9

    :cond_41
    invoke-virtual {p1, p2}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final R(Ljava/util/List;)Loa3;
    .registers 10

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Lr9i;->B(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_17

    const/4 p0, 0x0

    invoke-static {p1, p0}, Lsfe;->Z(Ljava/util/AbstractCollection;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loa3;

    return-object p0

    :cond_17
    new-instance v1, Lc9;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lc9;-><init>(B)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loa3;

    iget v3, v3, Loa3;->c:I

    move v4, v2

    :goto_2f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_60

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Loa3;

    iget v6, v5, Loa3;->c:I

    if-eq v3, v6, :cond_4d

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_60

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loa3;

    return-object p0

    :cond_4d
    new-instance v6, Landroid/util/Pair;

    iget-object v7, v5, Loa3;->b:Ljava/lang/String;

    iget v5, v5, Loa3;->d:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v6, v7, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2f

    :cond_60
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loa3;

    if-nez v3, :cond_ac

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    move v3, v2

    move v4, v3

    :goto_72
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_84

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Loa3;

    iget v5, v5, Loa3;->d:I

    add-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_72

    :cond_84
    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/Random;

    invoke-virtual {p0, v4}, Ljava/util/Random;->nextInt(I)I

    move-result p0

    move v3, v2

    :goto_8d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_a1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loa3;

    iget v5, v4, Loa3;->d:I

    add-int/2addr v3, v5

    if-lt p0, v3, :cond_a8

    add-int/lit8 v2, v2, 0x1

    goto :goto_8d

    :cond_a1
    invoke-static {p1}, Lsfe;->c0(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Loa3;

    :cond_a8
    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v4

    :cond_ac
    return-object v3
.end method

.method public final S(Z)V
    .registers 2

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    iput-boolean p1, p0, Lo66;->s:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lo66;->t:Z

    return-void
.end method

.method public final T()V
    .registers 2

    const/16 v0, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lr9i;->c:Ljava/lang/Object;

    return-void
.end method

.method public final U(I)V
    .registers 3

    const/16 v0, 0x10

    if-eq p1, v0, :cond_20

    const/16 v0, 0x18

    if-eq p1, v0, :cond_20

    const/16 v0, 0x20

    if-eq p1, v0, :cond_20

    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lr9i;->b:Ljava/lang/Object;

    return-void
.end method

.method public final V()V
    .registers 2

    const/16 v0, 0x10

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    return-void
.end method

.method public final W(Z)V
    .registers 5

    if-eqz p1, :cond_7

    iget-object v0, p0, Lr9i;->c:Ljava/lang/Object;

    :goto_4
    check-cast v0, Landroid/content/res/ColorStateList;

    goto :goto_a

    :cond_7
    iget-object v0, p0, Lr9i;->b:Ljava/lang/Object;

    goto :goto_4

    :goto_a
    iget-object v1, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/ColorStateList;

    if-ne v1, v0, :cond_11

    return-void

    :cond_11
    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    iget-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lf9c;

    iget-object v1, v0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lltl;->t0(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/ColorStateList;

    invoke-static {v0, p0}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    if-eqz p1, :cond_47

    const p0, 0x7f0600ab

    invoke-virtual {v2, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    const/high16 p1, 0x42000000    # 32.0f

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {p1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    invoke-static {p1, p0}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p0

    invoke-static {p0, v0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    :cond_47
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final a()Z
    .registers 1

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->n:Landroid/view/View;

    check-cast v0, Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->l:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    if-ne v0, p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lj82;Lov0;Lcmg;II)V
    .registers 12

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Ldmg;

    if-eqz v0, :cond_f

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Ldmg;->c(Lj82;Lov0;Lcmg;II)V

    :cond_f
    return-void
.end method

.method public final cancel()V
    .registers 1

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->close()V

    return-void
.end method

.method public final d(Lcom/google/android/gms/ads/AdError;)V
    .registers 4

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lppf;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: initialize onError, error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p0, p0, Lhnf;->t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p0, p1}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void
.end method

.method public final destroy()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lppf;

    const-string v1, "loadAd: initialize onSuccess"

    invoke-virtual {v0, v1}, Lhnf;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;

    invoke-static {v0}, Lrm5;->a0(Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;)V

    new-instance v1, Lqfb;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0, v1}, Lphj;->d0(Landroid/content/Context;Ljava/lang/String;Lfie;)V

    return-void
.end method

.method public final f(Litd;Z)V
    .registers 3

    return-void
.end method

.method public final g(Z)V
    .registers 2

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->o:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final getSink()Lnmj;
    .registers 1

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Ltv6;

    return-object p0
.end method

.method public final getSource()Lewj;
    .registers 1

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Luv6;

    return-object p0
.end method

.method public final h(ZZ)V
    .registers 8

    iget-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Luy8;

    const/4 v1, 0x0

    iput-boolean v1, v0, Luy8;->h:Z

    iget-object v2, v0, Luy8;->o:Lqy8;

    if-eqz p1, :cond_2d

    iget-object p1, v0, Luy8;->d:Ljec;

    iget-object p2, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Lr9i;->P(Ljec;Ljava/util/ArrayList;)V

    iget-object p1, v0, Luy8;->e:Ljec;

    iget-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Lr9i;->P(Ljec;Ljava/util/ArrayList;)V

    iget-object p1, v0, Luy8;->f:Ljec;

    iget-object p2, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Lr9i;->P(Ljec;Ljava/util/ArrayList;)V

    invoke-virtual {v2}, Lqy8;->b()V

    invoke-virtual {v0}, Luy8;->n()V

    return-void

    :cond_2d
    if-nez p2, :cond_42

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    iput-wide p0, v2, Lqy8;->e:J

    const-wide/32 v3, 0x493e0

    add-long/2addr p0, v3

    iput-wide p0, v2, Lqy8;->f:J

    invoke-virtual {v2, v1}, Lqy8;->c(Z)V

    return-void

    :cond_42
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    iput-wide p0, v2, Lqy8;->e:J

    const-wide/16 v3, 0x7530

    add-long/2addr p0, v3

    iput-wide p0, v2, Lqy8;->f:J

    invoke-virtual {v2, v1}, Lqy8;->c(Z)V

    return-void
.end method

.method public final i()V
    .registers 3

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->n:Landroid/view/View;

    check-cast v0, Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object v1, p0, Lrvg;->l:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    if-eq v0, v1, :cond_1d

    iget-object p0, p0, Lrvg;->n:Landroid/view/View;

    check-cast p0, Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_1d
    return-void
.end method

.method public final j([BIILunk;Lop5;)V
    .registers 36

    move-object/from16 v0, p0

    move/from16 v1, p2

    iget-object v2, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Ledg;

    iget-object v3, v2, Ledg;->b:[I

    iget-object v4, v2, Ledg;->a:Lg1g;

    iget-object v5, v0, Lr9i;->c:Ljava/lang/Object;

    check-cast v5, Lg1g;

    iget-object v6, v0, Lr9i;->b:Ljava/lang/Object;

    check-cast v6, Lg1g;

    add-int v7, v1, p3

    move-object/from16 v8, p1

    invoke-virtual {v6, v8, v7}, Lg1g;->L([BI)V

    invoke-virtual {v6, v1}, Lg1g;->N(I)V

    iget-object v1, v0, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/zip/Inflater;

    if-nez v1, :cond_2b

    new-instance v1, Ljava/util/zip/Inflater;

    invoke-direct {v1}, Ljava/util/zip/Inflater;-><init>()V

    iput-object v1, v0, Lr9i;->e:Ljava/lang/Object;

    :cond_2b
    sget-object v0, Ltym;->a:Ljava/lang/String;

    invoke-virtual {v6}, Lg1g;->a()I

    move-result v0

    if-lez v0, :cond_48

    invoke-virtual {v6}, Lg1g;->j()I

    move-result v0

    const/16 v7, 0x78

    if-ne v0, v7, :cond_48

    invoke-static {v6, v5, v1}, Ltym;->H(Lg1g;Lg1g;Ljava/util/zip/Inflater;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, v5, Lg1g;->a:[B

    iget v1, v5, Lg1g;->c:I

    invoke-virtual {v6, v0, v1}, Lg1g;->L([BI)V

    :cond_48
    const/4 v0, 0x0

    iput v0, v2, Ledg;->d:I

    iput v0, v2, Ledg;->e:I

    iput v0, v2, Ledg;->f:I

    iput v0, v2, Ledg;->g:I

    iput v0, v2, Ledg;->h:I

    iput v0, v2, Ledg;->i:I

    invoke-virtual {v4, v0}, Lg1g;->K(I)V

    iput-boolean v0, v2, Ledg;->c:Z

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    :goto_5f
    invoke-virtual {v6}, Lg1g;->a()I

    move-result v1

    const/4 v5, 0x3

    if-lt v1, v5, :cond_234

    iget v1, v6, Lg1g;->c:I

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v7

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v9

    iget v10, v6, Lg1g;->b:I

    add-int/2addr v10, v9

    if-le v10, v1, :cond_7c

    invoke-virtual {v6, v1}, Lg1g;->N(I)V

    move v12, v0

    const/4 v11, 0x0

    goto/16 :goto_22c

    :cond_7c
    const/16 v1, 0x80

    if-eq v7, v1, :cond_172

    packed-switch v7, :pswitch_data_24a

    goto/16 :goto_16e

    :pswitch_85
    const/16 v1, 0x13

    if-lt v9, v1, :cond_16e

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v1

    iput v1, v2, Ledg;->d:I

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v1

    iput v1, v2, Ledg;->e:I

    const/16 v1, 0xb

    invoke-virtual {v6, v1}, Lg1g;->O(I)V

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v1

    iput v1, v2, Ledg;->f:I

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v1

    iput v1, v2, Ledg;->g:I

    goto/16 :goto_16e

    :pswitch_a8
    const/4 v7, 0x4

    if-lt v9, v7, :cond_16e

    invoke-virtual {v6, v5}, Lg1g;->O(I)V

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v5

    and-int/2addr v5, v1

    if-eqz v5, :cond_b7

    const/4 v12, 0x1

    goto :goto_b8

    :cond_b7
    move v12, v0

    :goto_b8
    add-int/lit8 v1, v9, -0x4

    if-eqz v12, :cond_d8

    const/4 v5, 0x7

    if-lt v1, v5, :cond_16e

    invoke-virtual {v6}, Lg1g;->D()I

    move-result v1

    if-lt v1, v7, :cond_16e

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v5

    iput v5, v2, Ledg;->h:I

    invoke-virtual {v6}, Lg1g;->H()I

    move-result v5

    iput v5, v2, Ledg;->i:I

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v4, v1}, Lg1g;->K(I)V

    add-int/lit8 v1, v9, -0xb

    :cond_d8
    iget v5, v4, Lg1g;->b:I

    iget v7, v4, Lg1g;->c:I

    if-ge v5, v7, :cond_16e

    if-lez v1, :cond_16e

    sub-int/2addr v7, v5

    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v7, v4, Lg1g;->a:[B

    invoke-virtual {v6, v7, v5, v1}, Lg1g;->k([BII)V

    add-int/2addr v5, v1

    invoke-virtual {v4, v5}, Lg1g;->N(I)V

    goto/16 :goto_16e

    :pswitch_f0
    rem-int/lit8 v5, v9, 0x5

    const/4 v7, 0x2

    if-ne v5, v7, :cond_16e

    invoke-virtual {v6, v7}, Lg1g;->O(I)V

    invoke-static {v3, v0}, Ljava/util/Arrays;->fill([II)V

    div-int/lit8 v9, v9, 0x5

    move v5, v0

    :goto_fe
    if-ge v5, v9, :cond_16b

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v7

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v13

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v14

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v15

    invoke-virtual {v6}, Lg1g;->A()I

    move-result v16

    move/from16 p0, v1

    move-object/from16 p4, v2

    int-to-double v1, v13

    add-int/lit8 v14, v14, -0x80

    int-to-double v13, v14

    const-wide v17, 0x3ff66e978d4fdf3bL    # 1.402

    mul-double v17, v17, v13

    add-double v11, v17, v1

    double-to-int v11, v11

    add-int/lit8 v15, v15, -0x80

    move-wide/from16 v17, v1

    int-to-double v0, v15

    const-wide v19, 0x3fd60663c74fb54aL    # 0.34414

    mul-double v19, v19, v0

    sub-double v19, v17, v19

    const-wide v21, 0x3fe6da3c21187e7cL    # 0.71414

    mul-double v13, v13, v21

    sub-double v12, v19, v13

    double-to-int v2, v12

    const-wide v12, 0x3ffc5a1cac083127L    # 1.772

    mul-double/2addr v0, v12

    add-double v0, v0, v17

    double-to-int v0, v0

    shl-int/lit8 v16, v16, 0x18

    const/16 v1, 0xff

    const/4 v12, 0x0

    invoke-static {v11, v12, v1}, Ltym;->i(III)I

    move-result v11

    shl-int/lit8 v11, v11, 0x10

    or-int v16, v16, v11

    invoke-static {v2, v12, v1}, Ltym;->i(III)I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    or-int v16, v16, v2

    invoke-static {v0, v12, v1}, Ltym;->i(III)I

    move-result v0

    or-int v16, v16, v0

    aput v16, v3, v7

    add-int/lit8 v5, v5, 0x1

    move/from16 v1, p0

    move-object/from16 v2, p4

    goto :goto_fe

    :cond_16b
    const/4 v0, 0x1

    iput-boolean v0, v2, Ledg;->c:Z

    :cond_16e
    :goto_16e
    const/4 v11, 0x0

    const/4 v12, 0x0

    goto/16 :goto_229

    :cond_172
    iget v0, v2, Ledg;->d:I

    if-eqz v0, :cond_216

    iget v0, v2, Ledg;->e:I

    if-eqz v0, :cond_216

    iget v0, v2, Ledg;->h:I

    if-eqz v0, :cond_216

    iget v0, v2, Ledg;->i:I

    if-eqz v0, :cond_216

    iget v0, v4, Lg1g;->c:I

    if-eqz v0, :cond_216

    iget v1, v4, Lg1g;->b:I

    if-ne v1, v0, :cond_216

    iget-boolean v0, v2, Ledg;->c:Z

    if-eqz v0, :cond_216

    const/4 v12, 0x0

    invoke-virtual {v4, v12}, Lg1g;->N(I)V

    iget v0, v2, Ledg;->h:I

    iget v1, v2, Ledg;->i:I

    mul-int/2addr v0, v1

    new-array v1, v0, [I

    const/4 v12, 0x0

    :cond_19a
    :goto_19a
    if-ge v12, v0, :cond_1d3

    invoke-virtual {v4}, Lg1g;->A()I

    move-result v5

    if-eqz v5, :cond_1aa

    add-int/lit8 v7, v12, 0x1

    aget v5, v3, v5

    aput v5, v1, v12

    :goto_1a8
    move v12, v7

    goto :goto_19a

    :cond_1aa
    invoke-virtual {v4}, Lg1g;->A()I

    move-result v5

    if-eqz v5, :cond_19a

    and-int/lit8 v7, v5, 0x40

    if-nez v7, :cond_1b7

    and-int/lit8 v7, v5, 0x3f

    goto :goto_1c0

    :cond_1b7
    and-int/lit8 v7, v5, 0x3f

    shl-int/lit8 v7, v7, 0x8

    invoke-virtual {v4}, Lg1g;->A()I

    move-result v9

    or-int/2addr v7, v9

    :goto_1c0
    and-int/lit16 v5, v5, 0x80

    if-nez v5, :cond_1c8

    const/4 v5, 0x0

    aget v9, v3, v5

    goto :goto_1ce

    :cond_1c8
    invoke-virtual {v4}, Lg1g;->A()I

    move-result v5

    aget v9, v3, v5

    :goto_1ce
    add-int/2addr v7, v12

    invoke-static {v1, v12, v7, v9}, Ljava/util/Arrays;->fill([IIII)V

    goto :goto_1a8

    :cond_1d3
    iget v0, v2, Ledg;->h:I

    iget v5, v2, Ledg;->i:I

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v0, v5, v7}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v15

    iget v0, v2, Ledg;->f:I

    int-to-float v0, v0

    iget v1, v2, Ledg;->d:I

    int-to-float v1, v1

    div-float v19, v0, v1

    iget v0, v2, Ledg;->g:I

    int-to-float v0, v0

    iget v5, v2, Ledg;->e:I

    int-to-float v5, v5

    div-float v16, v0, v5

    iget v0, v2, Ledg;->h:I

    int-to-float v0, v0

    div-float v23, v0, v1

    iget v0, v2, Ledg;->i:I

    int-to-float v0, v0

    div-float v24, v0, v5

    new-instance v11, Lx36;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/high16 v21, -0x80000000

    const v22, -0x800001

    const/16 v25, 0x0

    const/high16 v26, -0x1000000

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object v14, v13

    move/from16 v27, v21

    invoke-direct/range {v11 .. v29}, Lx36;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFI)V

    :goto_214
    const/4 v12, 0x0

    goto :goto_218

    :cond_216
    const/4 v11, 0x0

    goto :goto_214

    :goto_218
    iput v12, v2, Ledg;->d:I

    iput v12, v2, Ledg;->e:I

    iput v12, v2, Ledg;->f:I

    iput v12, v2, Ledg;->g:I

    iput v12, v2, Ledg;->h:I

    iput v12, v2, Ledg;->i:I

    invoke-virtual {v4, v12}, Lg1g;->K(I)V

    iput-boolean v12, v2, Ledg;->c:Z

    :goto_229
    invoke-virtual {v6, v10}, Lg1g;->N(I)V

    :goto_22c
    if-eqz v11, :cond_231

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_231
    move v0, v12

    goto/16 :goto_5f

    :cond_234
    new-instance v7, La46;

    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct/range {v7 .. v12}, La46;-><init>(Ljava/util/List;JJ)V

    move-object/from16 v0, p5

    invoke-interface {v0, v7}, Lop5;->accept(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_24a
    .packed-switch 0x14
        :pswitch_f0
        :pswitch_a8
        :pswitch_85
    .end packed-switch
.end method

.method public final k(Lwj5;Lcom/opera/api/Callback;)V
    .registers 8

    new-instance v0, Ll45;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Ll45;->c:Ljava/lang/Object;

    iput-object p1, v0, Ll45;->a:Ljava/lang/Object;

    iput-object p2, v0, Ll45;->b:Ljava/lang/Object;

    iget-object p2, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashSet;

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lu59;

    iget-object p2, p1, Lwj5;->r:Lffb;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p2

    iget-object p1, p1, Lwj5;->s:Lffb;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    new-instance v1, Liu2;

    const/16 v2, 0x13

    invoke-direct {v1, v0, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqln;

    invoke-virtual {v2, p1}, Lqln;->q(Ljava/util/Set;)V

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_48

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, p1}, Liu2;->run(Ljava/lang/Object;)V

    goto/16 :goto_be

    :cond_48
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqln;

    iget-object p1, p1, Lqln;->i:Lqi5;

    iget-object p1, p1, Lqi5;->b:Ljava/lang/Object;

    check-cast p1, Lru9;

    move-object v2, p2

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_60
    :goto_60
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_83

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_84

    :cond_83
    const/4 v4, 0x0

    :goto_84
    if-eqz v4, :cond_60

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60

    :cond_8a
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_ac

    iget-object v2, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "wallpaper.unlocked_ids"

    invoke-static {v2, v4}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_ac

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v3, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_ac
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqln;

    iget-object p1, p1, Lqln;->f:Lami;

    new-instance v0, Lk3;

    const/16 v2, 0x1c

    invoke-direct {v0, p2, p0, v1, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lami;->r(Ljava/lang/Runnable;)V

    :goto_be
    return-void
.end method

.method public final l(I)V
    .registers 2

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->k:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final m()I
    .registers 1

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->n:Landroid/view/View;

    check-cast p0, Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    return p0
.end method

.method public final n(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->m:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final o(I)V
    .registers 5

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f12005b

    invoke-virtual {v0, v2, p1, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final p(Litd;)Z
    .registers 2

    if-eqz p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lrvg;

    iget-object v0, v0, Lrvg;->n:Landroid/view/View;

    check-cast v0, Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object v1, p0, Lrvg;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    if-eq v0, v1, :cond_1d

    iget-object p0, p0, Lrvg;->n:Landroid/view/View;

    check-cast p0, Landroid/widget/ViewSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_1d
    return-void
.end method

.method public final r(Llx8;Lj82;)V
    .registers 3

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lfu8;

    invoke-interface {p0, p1, p2}, Lfu8;->r(Llx8;Lj82;)V

    return-void
.end method

.method public final s(Litd;)V
    .registers 2

    return-void
.end method

.method public final t(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Lr9i;->a:B

    packed-switch v0, :pswitch_data_20

    :try_start_5
    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lqq8;

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lqq8;->j(Lorb;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_11} :catch_11

    :catch_11
    return-void

    :pswitch_12
    :try_start_12
    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lqq8;

    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lqq8;->j(Lorb;)V
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_1e} :catch_1e

    :catch_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lr9i;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Ljava/net/Socket;

    invoke-virtual {p0}, Ljava/net/Socket;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0xc
        :pswitch_a
    .end packed-switch
.end method

.method public final v(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroidx/coordinatorlayout/widget/CoordinatorLayout;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const v2, 0x7f0d0370

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a01c7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/google/android/material/button/MaterialButton;

    if-eqz v7, :cond_154

    const v1, 0x7f0a0641

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_154

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v8

    const v1, 0x7f0a07c7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_154

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v9

    const v1, 0x7f0a07e0

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_154

    const v1, 0x7f0a0803

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_154

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v11

    const v1, 0x7f0a0804

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v12, :cond_154

    const v1, 0x7f0a0805

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_154

    invoke-static {v4}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v13

    const v1, 0x7f0a0861

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    if-eqz v14, :cond_154

    const v1, 0x7f0a0862

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-eqz v15, :cond_154

    const v1, 0x7f0a0863

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Landroid/widget/LinearLayout;

    if-eqz v16, :cond_154

    const v1, 0x7f0a0864

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_154

    const v1, 0x7f0a0865

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Landroid/widget/ViewSwitcher;

    if-eqz v18, :cond_154

    const v1, 0x7f0a0915

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Lcom/google/android/material/button/MaterialButton;

    if-eqz v19, :cond_154

    const v1, 0x7f0a0a47

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v20, v4

    check-cast v20, Landroid/widget/LinearLayout;

    if-eqz v20, :cond_154

    const v1, 0x7f0a0a9f

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Space;

    if-eqz v4, :cond_154

    const v1, 0x7f0a0bbe

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/Shadow;

    if-eqz v4, :cond_154

    new-instance v5, Lrvg;

    move-object v6, v2

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-direct/range {v5 .. v20}, Lrvg;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/button/MaterialButton;Lhi4;Lhi4;Lcom/opera/android/custom_views/StylingTextView;Lhi4;Lcom/google/android/material/textfield/TextInputLayout;Lhi4;Lcom/opera/android/custom_views/RecyclerViewForScreenshot;Lcom/google/android/material/progressindicator/LinearProgressIndicator;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/ViewSwitcher;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;)V

    iput-object v5, v0, Lr9i;->d:Ljava/lang/Object;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object v1, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lrvg;

    iget-object v1, v1, Lrvg;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v1, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lrvg;

    iget-object v2, v1, Lrvg;->j:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    iput-boolean v4, v2, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    iget-object v1, v1, Lrvg;->o:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Loii;

    invoke-direct {v2, v0, v3}, Loii;-><init>(Lr9i;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lrvg;

    iget-object v1, v1, Lrvg;->c:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Loii;

    invoke-direct {v2, v0, v4}, Loii;-><init>(Lr9i;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lrvg;

    iget-object v1, v1, Lrvg;->p:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lx79;

    iget-object v1, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v1, Lrvg;

    iget-object v2, v1, Lrvg;->e:Ljava/lang/Object;

    check-cast v2, Lhi4;

    iget-object v5, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Lrvg;->i:Ljava/lang/Object;

    check-cast v2, Lhi4;

    iget-object v6, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Lrvg;->d:Ljava/lang/Object;

    check-cast v2, Lhi4;

    iget-object v7, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Lrvg;->g:Ljava/lang/Object;

    check-cast v2, Lhi4;

    iget-object v8, v2, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Lrvg;->h:Landroid/view/View;

    move-object v9, v2

    check-cast v9, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-direct/range {v4 .. v9}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, v0, Lr9i;->e:Ljava/lang/Object;

    iget-object v0, v1, Lrvg;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object v0

    :cond_154
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final w(Ljava/lang/String;Lilm;)V
    .registers 4

    iget-byte v0, p0, Lr9i;->a:B

    packed-switch v0, :pswitch_data_2c

    :try_start_5
    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Lu02;

    new-instance p1, Lzy9;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p2, p1, Lzy9;->a:Ljava/lang/Object;

    invoke-static {v0, p0, p1}, Lzpa;->U(Lorb;Lu02;Lzy9;)V
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_18} :catch_18

    :catch_18
    return-void

    :pswitch_19
    :try_start_19
    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    new-instance p1, Lwub;

    invoke-direct {p1, p2}, Lwub;-><init>(Ljava/lang/Object;)V

    invoke-static {v0, p0, p1}, Ln9a;->u(Lorb;Lks3;Lwub;)V
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_2a} :catch_2a

    :catch_2a
    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final x(Litd;Landroid/view/MenuItem;)Z
    .registers 3

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Lo73;

    if-eqz p0, :cond_e

    invoke-interface {p0, p2}, Ldog;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final y(Lk8g;)V
    .registers 2

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lrvg;

    iget-object p0, p0, Lrvg;->j:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final z()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method
