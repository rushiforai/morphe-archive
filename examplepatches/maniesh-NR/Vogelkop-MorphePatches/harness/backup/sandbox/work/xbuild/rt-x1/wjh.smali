.class public final Lwjh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lo7h;


# static fields
.field public static final g:Lyg9;

.field public static final h:Lhr5;

.field public static final i:Lcpj;

.field public static volatile j:Lwjh;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lyg9;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lyg9;-><init>(B)V

    sput-object v0, Lwjh;->g:Lyg9;

    new-instance v0, Lhr5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwjh;->h:Lhr5;

    new-instance v0, Lcpj;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lcpj;-><init>(B)V

    sput-object v0, Lwjh;->i:Lcpj;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lwjh;->a:B

    sparse-switch p1, :sswitch_data_90

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :sswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0xa

    .line 605
    new-array v0, p1, [I

    .line 606
    iput-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    .line 607
    new-array v0, p1, [I

    .line 608
    iput-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    .line 609
    new-array v0, p1, [I

    .line 610
    iput-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    .line 611
    new-array v0, p1, [I

    .line 612
    iput-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    .line 613
    new-array p1, p1, [I

    .line 614
    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void

    .line 615
    :sswitch_23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 616
    new-instance p1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>(Z)V

    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 617
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 618
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    .line 619
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    return-void

    .line 620
    :sswitch_44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 621
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 622
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 623
    new-instance p1, Lf30;

    const/4 v0, 0x7

    .line 624
    invoke-direct {p1, v0}, Lf30;-><init>(B)V

    .line 625
    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    .line 626
    new-instance p1, Lf30;

    const/16 v0, 0x8

    .line 627
    invoke-direct {p1, v0}, Lf30;-><init>(B)V

    .line 628
    iput-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    .line 629
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void

    .line 630
    :sswitch_6e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 631
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 632
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 633
    new-instance p1, Lcf2;

    const/4 v0, 0x0

    .line 634
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 635
    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    .line 636
    new-instance p1, Ldee;

    invoke-direct {p1}, Ldee;-><init>()V

    .line 637
    iput-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    .line 638
    new-instance p1, Ldee;

    invoke-direct {p1}, Ldee;-><init>()V

    .line 639
    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_90
    .sparse-switch
        0xa -> :sswitch_6e
        0xc -> :sswitch_44
        0xd -> :sswitch_23
        0x19 -> :sswitch_9
    .end sparse-switch
.end method

.method public constructor <init>(Lai;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lwjh;->a:B

    .line 531
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 532
    new-instance p1, Lpde;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 533
    invoke-direct {p1, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 534
    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 535
    new-instance p1, Lpde;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 536
    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 537
    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    .line 538
    new-instance p1, Lsa2;

    const/4 v0, 0x6

    invoke-direct {p1, v0}, Lsa2;-><init>(B)V

    iput-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    .line 539
    new-instance p1, Lvjh;

    sget-object v0, Lujh;->c:Lujh;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lvjh;-><init>(Lujh;Ljava/lang/Integer;)V

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lwjh;->a:B

    .line 511
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getNoBackupFilesDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "opera_ads"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    const-string p1, "ads"

    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    new-instance p1, Ljava/io/File;

    const-string v1, "download"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    new-instance p1, Lzmo;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lzmo;-><init>(Lwjh;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    new-instance p1, Lzmo;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lzmo;-><init>(Lwjh;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;[Legd;Lr9g;)V
    .registers 7

    const/16 v0, 0x15

    iput-byte v0, p0, Lwjh;->a:B

    .line 597
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 598
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    .line 599
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lwjh;->e:Ljava/lang/Object;

    .line 600
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 601
    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    .line 602
    invoke-static {v0, p3}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 603
    iput-object p4, p0, Lwjh;->f:Ljava/lang/Object;

    .line 604
    invoke-virtual {p0}, Lwjh;->k()V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lqim;Lb7f;)V
    .registers 5

    const/16 v0, 0xb

    iput-byte v0, p0, Lwjh;->a:B

    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    .line 593
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    .line 594
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 595
    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    .line 596
    iput-object p3, p0, Lwjh;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/ToolbarProgressBar;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x2

    iput-byte v2, v0, Lwjh;->a:B

    .line 653
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 654
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v3, v0, Lwjh;->b:Ljava/lang/Object;

    .line 655
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v4, v0, Lwjh;->c:Ljava/lang/Object;

    .line 656
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v5, v0, Lwjh;->e:Ljava/lang/Object;

    .line 657
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v7, v6}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v6

    .line 658
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v7, v8}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v12

    .line 659
    new-instance v7, Lq4h;

    invoke-direct {v7}, Lq4h;-><init>()V

    iput-object v7, v0, Lwjh;->d:Ljava/lang/Object;

    .line 660
    sget-object v8, Lwjh;->h:Lhr5;

    iput-object v8, v0, Lwjh;->f:Ljava/lang/Object;

    .line 661
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 662
    invoke-static {v0}, Lhr5;->l(Landroid/content/Context;)I

    move-result v8

    const/4 v15, 0x0

    .line 663
    invoke-virtual {v3, v15}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    int-to-float v6, v6

    .line 664
    invoke-virtual {v3, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 665
    invoke-virtual {v3, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 666
    new-instance v8, Landroid/graphics/drawable/ScaleDrawable;

    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v10, -0x40800000    # -1.0f

    const/4 v11, 0x3

    invoke-direct {v8, v3, v11, v9, v10}, Landroid/graphics/drawable/ScaleDrawable;-><init>(Landroid/graphics/drawable/Drawable;IFF)V

    const v3, 0x7f0402ff

    const v9, 0x7f060b1b

    .line 667
    invoke-static {v3, v0, v9}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    .line 668
    invoke-virtual {v4, v15}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 669
    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 670
    invoke-virtual {v4, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 671
    new-array v0, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v4, v0, v15

    const/4 v4, 0x1

    aput-object v8, v0, v4

    .line 672
    new-instance v10, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v10, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/high16 v0, 0x1020000

    .line 673
    invoke-virtual {v10, v15, v0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    const v8, 0x102000d

    .line 674
    invoke-virtual {v10, v4, v8}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    if-gtz v12, :cond_8c

    move/from16 p0, v4

    move v4, v9

    goto :goto_9e

    :cond_8c
    move v11, v9

    .line 675
    new-instance v9, Landroid/graphics/drawable/InsetDrawable;

    move v13, v11

    const/4 v11, 0x0

    move v14, v13

    const/4 v13, 0x0

    move/from16 v16, v14

    move v14, v12

    move/from16 p0, v4

    move/from16 v4, v16

    invoke-direct/range {v9 .. v14}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    move-object v10, v9

    .line 676
    :goto_9e
    invoke-virtual {v1, v10}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 677
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 678
    invoke-static {v3, v9, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    .line 679
    invoke-static {v9}, Lhr5;->l(Landroid/content/Context;)I

    move-result v4

    .line 680
    invoke-virtual {v5, v15}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 681
    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 682
    invoke-virtual {v5, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 683
    invoke-virtual {v7, v15}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 684
    invoke-virtual {v7, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 685
    invoke-virtual {v7, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 686
    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v5, v2, v15

    aput-object v7, v2, p0

    .line 687
    new-instance v10, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v10, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 688
    invoke-virtual {v10, v15, v0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    move/from16 v0, p0

    .line 689
    invoke-virtual {v10, v0, v8}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    if-lez v12, :cond_dd

    .line 690
    new-instance v9, Landroid/graphics/drawable/InsetDrawable;

    const/4 v11, 0x0

    const/4 v13, 0x0

    move v14, v12

    invoke-direct/range {v9 .. v14}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    move-object v10, v9

    .line 691
    :cond_dd
    invoke-virtual {v1, v10}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lx5f;Lrr3;Lsy;)V
    .registers 6

    const/16 v0, 0x1c

    iput-byte v0, p0, Lwjh;->a:B

    .line 640
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 641
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 642
    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    .line 643
    new-instance p2, Ls9;

    const/16 v0, 0xe

    invoke-direct {p2, p0, v0}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lwjh;->d:Ljava/lang/Object;

    .line 644
    iput-object p4, p0, Lwjh;->e:Ljava/lang/Object;

    if-eqz p3, :cond_2a

    .line 645
    const-string p4, "enable_newsfeed"

    .line 646
    invoke-virtual {p1, p4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_2a

    .line 647
    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    .line 648
    new-instance p1, Lo59;

    invoke-direct {p1, p3}, Lo59;-><init>(Lrr3;)V

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    :cond_2a
    return-void
.end method

.method public constructor <init>(Ldb;Landroid/app/Activity;Lab;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 7

    const/4 v0, 0x4

    iput-byte v0, p0, Lwjh;->a:B

    .line 747
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwjh;->b:Ljava/lang/Object;

    iput-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    iput-object p4, p0, Lwjh;->d:Ljava/lang/Object;

    iput-object p5, p0, Lwjh;->e:Ljava/lang/Object;

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfe5;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Liv7;Lhd;Llv7;Llv7;Ljv3;)V
    .registers 25

    move-object/from16 v2, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    const/16 v0, 0x1a

    iput-byte v0, v2, Lwjh;->a:B

    .line 559
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 560
    iput-object v7, v2, Lwjh;->b:Ljava/lang/Object;

    move-object/from16 v0, p3

    .line 561
    iput-object v0, v2, Lwjh;->c:Ljava/lang/Object;

    .line 562
    iput-object v8, v2, Lwjh;->d:Ljava/lang/Object;

    .line 563
    iput-object v9, v2, Lwjh;->e:Ljava/lang/Object;

    .line 564
    new-instance v10, Lwf;

    .line 565
    new-instance v0, Lx77;

    const/4 v5, 0x5

    const/4 v4, 0x0

    move-object/from16 v1, p6

    move-object/from16 v3, p7

    invoke-direct/range {v0 .. v5}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    const/4 v1, 0x3

    .line 566
    invoke-direct {v10, v1}, Lwf;-><init>(B)V

    const/4 v3, 0x0

    .line 567
    invoke-virtual {v10, v3}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    .line 568
    new-instance v4, Lyt7;

    invoke-direct {v4, v3}, Lyt7;-><init>(B)V

    .line 569
    new-instance v5, Lau7;

    invoke-direct {v5, v0, v3}, Lau7;-><init>(Lx77;B)V

    .line 570
    new-instance v11, La3j;

    const/4 v12, 0x4

    invoke-direct {v11, v12}, La3j;-><init>(B)V

    .line 571
    const-class v13, Leu7;

    invoke-virtual {v10, v13, v4, v5, v11}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    .line 572
    new-instance v4, Lge5;

    const/16 v5, 0xf

    move-object/from16 v11, p8

    invoke-direct {v4, v0, v11, v5}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    .line 573
    new-instance v11, Lyt7;

    const/4 v13, 0x1

    invoke-direct {v11, v13}, Lyt7;-><init>(B)V

    .line 574
    new-instance v14, La3j;

    invoke-direct {v14, v12}, La3j;-><init>(B)V

    .line 575
    const-class v15, Ldu7;

    invoke-virtual {v10, v15, v4, v11, v14}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    .line 576
    new-instance v4, Lyt7;

    const/4 v11, 0x2

    invoke-direct {v4, v11}, Lyt7;-><init>(B)V

    .line 577
    new-instance v14, Lau7;

    invoke-direct {v14, v0, v13}, Lau7;-><init>(Lx77;B)V

    .line 578
    new-instance v15, La3j;

    invoke-direct {v15, v12}, La3j;-><init>(B)V

    .line 579
    const-class v13, Lcu7;

    invoke-virtual {v10, v13, v4, v14, v15}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    .line 580
    new-instance v4, Lau7;

    invoke-direct {v4, v0, v11}, Lau7;-><init>(Lx77;B)V

    .line 581
    new-instance v0, Lyt7;

    invoke-direct {v0, v1}, Lyt7;-><init>(B)V

    .line 582
    new-instance v1, La3j;

    invoke-direct {v1, v12}, La3j;-><init>(B)V

    .line 583
    const-class v11, Lfu7;

    invoke-virtual {v10, v11, v4, v0, v1}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    .line 584
    iput-object v10, v2, Lwjh;->f:Ljava/lang/Object;

    .line 585
    invoke-virtual {v7, v10}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    .line 586
    iget-object v0, v9, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lqde;

    .line 587
    new-instance v1, Lxt7;

    invoke-direct {v1, v2, v3}, Lxt7;-><init>(Lwjh;B)V

    new-instance v3, Lug;

    invoke-direct {v3, v1, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v6, v3}, Lekc;->j(Lndc;Lf7f;)V

    .line 588
    iget-object v0, v8, Liv7;->f:Lpde;

    .line 589
    new-instance v1, Lxt7;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lxt7;-><init>(Lwjh;B)V

    new-instance v3, Lug;

    invoke-direct {v3, v1, v5}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v6, v3}, Lekc;->j(Lndc;Lf7f;)V

    .line 590
    invoke-virtual {v2}, Lwjh;->C()V

    return-void
.end method

.method public constructor <init>(Lfe5;Lfyj;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingImageButton;Lm0a;Lpde;Lq2;)V
    .registers 10

    const/16 v0, 0x1b

    iput-byte v0, p0, Lwjh;->a:B

    .line 512
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 513
    iput-object p2, p0, Lwjh;->b:Ljava/lang/Object;

    .line 514
    iput-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    .line 515
    iput-object p4, p0, Lwjh;->d:Ljava/lang/Object;

    .line 516
    iput-object p5, p0, Lwjh;->e:Ljava/lang/Object;

    .line 517
    iput-object p7, p0, Lwjh;->f:Ljava/lang/Object;

    .line 518
    iget-object p2, p5, Lm0a;->e:Lpde;

    .line 519
    new-instance p5, Lru7;

    const/4 p7, 0x0

    invoke-direct {p5, p0, p7}, Lru7;-><init>(Lwjh;B)V

    new-instance v0, Lug;

    const/16 v1, 0x11

    invoke-direct {v0, p5, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v0}, Lekc;->j(Lndc;Lf7f;)V

    .line 520
    new-instance p2, Lru7;

    const/4 p5, 0x1

    invoke-direct {p2, p0, p5}, Lru7;-><init>(Lwjh;B)V

    new-instance v0, Lug;

    invoke-direct {v0, p2, v1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p6, p1, v0}, Lekc;->j(Lndc;Lf7f;)V

    .line 521
    new-instance p1, Lsu7;

    invoke-direct {p1, p0, p7}, Lsu7;-><init>(Lwjh;B)V

    invoke-virtual {p3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p4, :cond_43

    .line 522
    new-instance p1, Lsu7;

    invoke-direct {p1, p0, p5}, Lsu7;-><init>(Lwjh;B)V

    invoke-virtual {p4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_43
    return-void
.end method

.method public constructor <init>(Lgjm;Lfe5;Lisd;Lj1k;)V
    .registers 6

    const/16 v0, 0x10

    iput-byte v0, p0, Lwjh;->a:B

    .line 523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 524
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 525
    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    .line 526
    iput-object p3, p0, Lwjh;->d:Ljava/lang/Object;

    .line 527
    iput-object p4, p0, Lwjh;->e:Ljava/lang/Object;

    .line 528
    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 529
    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 530
    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    .line 510
    iput-byte p6, p0, Lwjh;->a:B

    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    iput-object p3, p0, Lwjh;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwjh;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwjh;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 11

    const/4 v0, 0x7

    iput-byte v0, p0, Lwjh;->a:B

    .line 719
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 720
    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    const/16 v1, 0xa

    .line 721
    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    const/16 v2, 0x10

    if-ge v1, v2, :cond_18

    move v1, v2

    .line 722
    :cond_18
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 723
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 724
    move-object v3, v1

    check-cast v3, Lgy0;

    .line 725
    invoke-virtual {v3}, Lgy0;->b()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 726
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 727
    :cond_3a
    iput-object v2, p0, Lwjh;->b:Ljava/lang/Object;

    .line 728
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    .line 729
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    .line 730
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    .line 731
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    .line 732
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/16 v1, 0xb

    const/4 v2, 0x0

    .line 733
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xc

    .line 734
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xd

    .line 735
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xe

    .line 736
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    const/4 v1, 0x6

    const/4 v2, 0x1

    .line 737
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 738
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 739
    sget-object v2, Lpn7;->b:Lon7;

    const/16 v2, 0x18

    sget-object v3, Lun7;->g:Lun7;

    invoke-static {v2, v3}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    .line 740
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8c
    :goto_8c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lgy0;

    .line 741
    iget-wide v5, v4, Lgy0;->b:J

    sub-long v5, v0, v5

    .line 742
    div-long/2addr v5, v2

    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-ltz v7, :cond_8c

    if-nez v7, :cond_ad

    .line 743
    iget-object v5, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8c

    :cond_ad
    const-wide/16 v7, 0x1

    cmp-long v5, v5, v7

    if-nez v5, :cond_bb

    .line 744
    iget-object v5, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8c

    .line 745
    :cond_bb
    iget-object v5, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8c

    :cond_c3
    return-void
.end method

.method public constructor <init>(Lju;Lumi;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lwjh;->a:B

    .line 746
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    iput-object p2, p0, Lwjh;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lke5;)V
    .registers 7

    const/16 v0, 0xf

    iput-byte v0, p0, Lwjh;->a:B

    .line 692
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 693
    iget-object v0, p1, Lke5;->a:Ljava/util/List;

    .line 694
    check-cast v0, Ljava/util/Collection;

    .line 695
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 696
    iput-object v1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 697
    iget-object v0, p1, Lke5;->b:Ljava/util/List;

    .line 698
    check-cast v0, Ljava/util/Collection;

    .line 699
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 700
    iput-object v1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 701
    iget-object v0, p1, Lke5;->c:Ljava/util/List;

    .line 702
    check-cast v0, Ljava/util/Collection;

    .line 703
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 704
    iput-object v1, p0, Lwjh;->d:Ljava/lang/Object;

    .line 705
    iget-object v0, p1, Lke5;->f:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 706
    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 707
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 708
    check-cast v2, Lkotlin/Pair;

    .line 709
    new-instance v3, Lr94;

    const/16 v4, 0xa

    invoke-direct {v3, v2, v4}, Lr94;-><init>(Ljava/lang/Object;B)V

    .line 710
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3b

    .line 711
    :cond_52
    iput-object v1, p0, Lwjh;->e:Ljava/lang/Object;

    .line 712
    iget-object p1, p1, Lke5;->g:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 713
    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 714
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_67
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 715
    check-cast v1, Ljj6;

    .line 716
    new-instance v2, Lje5;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Lje5;-><init>(Ljj6;B)V

    .line 717
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_67

    .line 718
    :cond_7d
    iput-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkze;Landroid/content/Context;Lumi;Lx5f;)V
    .registers 6

    const/16 v0, 0x11

    iput-byte v0, p0, Lwjh;->a:B

    .line 550
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 551
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 552
    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    .line 553
    iput-object p3, p0, Lwjh;->d:Ljava/lang/Object;

    .line 554
    iput-object p4, p0, Lwjh;->e:Ljava/lang/Object;

    .line 555
    new-instance p2, Lode;

    .line 556
    invoke-direct {p2}, Lekc;-><init>()V

    .line 557
    iput-object p2, p0, Lwjh;->f:Ljava/lang/Object;

    .line 558
    new-instance p2, Ltk6;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Ltk6;-><init>(Lwjh;B)V

    new-instance p0, Lcl4;

    const/4 p3, 0x7

    invoke-direct {p0, p2, p3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lmp6;Lr16;)V
    .registers 4

    const/16 v0, 0x13

    iput-byte v0, p0, Lwjh;->a:B

    .line 748
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 749
    iput-object p1, p0, Lwjh;->b:Ljava/lang/Object;

    .line 750
    iput-object p2, p0, Lwjh;->f:Ljava/lang/Object;

    .line 751
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 752
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lwjh;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Lk6l;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    const/4 v0, 0x6

    iput-byte v0, p0, Lwjh;->a:B

    .line 540
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 541
    iput-object p2, p0, Lwjh;->b:Ljava/lang/Object;

    .line 542
    iput-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    .line 543
    iput-object p4, p0, Lwjh;->d:Ljava/lang/Object;

    .line 544
    new-instance p3, Lc4;

    const/16 p4, 0xe

    invoke-direct {p3, p0, p4}, Lc4;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lwjh;->e:Ljava/lang/Object;

    .line 545
    iget-object p2, p2, Lk6l;->s:Lg6l;

    .line 546
    new-instance p3, Lqz;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lqz;-><init>(Ljava/lang/Object;B)V

    .line 547
    invoke-static {p2, p1, p3}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    .line 548
    new-instance p2, Lrz;

    invoke-direct {p2, p0, p4}, Lrz;-><init>(Ljava/lang/Object;B)V

    .line 549
    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Lzd4;Lzd4;Lwtk;)V
    .registers 5

    const/16 v0, 0x18

    iput-byte v0, p0, Lwjh;->a:B

    .line 649
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 650
    iput-object p1, p0, Lwjh;->c:Ljava/lang/Object;

    .line 651
    iput-object p2, p0, Lwjh;->d:Ljava/lang/Object;

    .line 652
    iput-object p3, p0, Lwjh;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([II[Lnyf;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const/4 v3, 0x1

    iput-byte v3, v0, Lwjh;->a:B

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v4, 0x3

    new-array v4, v4, [F

    iput-object v4, v0, Lwjh;->f:Ljava/lang/Object;

    move-object/from16 v4, p3

    iput-object v4, v0, Lwjh;->e:Ljava/lang/Object;

    const v4, 0x8000

    new-array v5, v4, [I

    iput-object v5, v0, Lwjh;->c:Ljava/lang/Object;

    const/4 v6, 0x0

    move v7, v6

    :goto_1e
    array-length v8, v1

    const/16 v9, 0x8

    const/4 v10, 0x5

    if-ge v7, v8, :cond_4d

    aget v8, v1, v7

    invoke-static {v8}, Landroid/graphics/Color;->red(I)I

    move-result v11

    invoke-static {v11, v9, v10}, Lwjh;->r(III)I

    move-result v11

    invoke-static {v8}, Landroid/graphics/Color;->green(I)I

    move-result v12

    invoke-static {v12, v9, v10}, Lwjh;->r(III)I

    move-result v12

    invoke-static {v8}, Landroid/graphics/Color;->blue(I)I

    move-result v8

    invoke-static {v8, v9, v10}, Lwjh;->r(III)I

    move-result v8

    shl-int/lit8 v11, v11, 0xa

    shl-int/2addr v12, v10

    or-int/2addr v11, v12

    or-int/2addr v11, v8

    aput v11, v1, v7

    aget v8, v5, v11

    add-int/2addr v8, v3

    aput v8, v5, v11

    add-int/lit8 v7, v7, 0x1

    goto :goto_1e

    :cond_4d
    move v1, v6

    move v7, v1

    :goto_4f
    if-ge v1, v4, :cond_93

    aget v8, v5, v1

    if-lez v8, :cond_8a

    shr-int/lit8 v8, v1, 0xa

    and-int/lit8 v8, v8, 0x1f

    shr-int/lit8 v11, v1, 0x5

    and-int/lit8 v11, v11, 0x1f

    and-int/lit8 v12, v1, 0x1f

    invoke-static {v8, v10, v9}, Lwjh;->r(III)I

    move-result v8

    invoke-static {v11, v10, v9}, Lwjh;->r(III)I

    move-result v11

    invoke-static {v12, v10, v9}, Lwjh;->r(III)I

    move-result v12

    invoke-static {v8, v11, v12}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    iget-object v11, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v11, [F

    invoke-static {v8}, Landroid/graphics/Color;->red(I)I

    move-result v12

    invoke-static {v8}, Landroid/graphics/Color;->green(I)I

    move-result v13

    invoke-static {v8}, Landroid/graphics/Color;->blue(I)I

    move-result v8

    invoke-static {v12, v13, v8, v11}, Lab5;->a(III[F)V

    invoke-virtual {v0, v11}, Lwjh;->z([F)Z

    move-result v8

    if-eqz v8, :cond_8a

    aput v6, v5, v1

    :cond_8a
    aget v8, v5, v1

    if-lez v8, :cond_90

    add-int/lit8 v7, v7, 0x1

    :cond_90
    add-int/lit8 v1, v1, 0x1

    goto :goto_4f

    :cond_93
    new-array v1, v7, [I

    iput-object v1, v0, Lwjh;->b:Ljava/lang/Object;

    move v8, v6

    move v11, v8

    :goto_99
    if-ge v8, v4, :cond_a7

    aget v12, v5, v8

    if-lez v12, :cond_a4

    add-int/lit8 v12, v11, 0x1

    aput v8, v1, v11

    move v11, v12

    :cond_a4
    add-int/lit8 v8, v8, 0x1

    goto :goto_99

    :cond_a7
    if-gt v7, v2, :cond_df

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Lwjh;->d:Ljava/lang/Object;

    :goto_b0
    if-ge v6, v7, :cond_1fd

    aget v2, v1, v6

    iget-object v3, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    new-instance v4, Loyf;

    shr-int/lit8 v8, v2, 0xa

    and-int/lit8 v8, v8, 0x1f

    shr-int/lit8 v11, v2, 0x5

    and-int/lit8 v11, v11, 0x1f

    and-int/lit8 v12, v2, 0x1f

    invoke-static {v8, v10, v9}, Lwjh;->r(III)I

    move-result v8

    invoke-static {v11, v10, v9}, Lwjh;->r(III)I

    move-result v11

    invoke-static {v12, v10, v9}, Lwjh;->r(III)I

    move-result v12

    invoke-static {v8, v11, v12}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    aget v2, v5, v2

    invoke-direct {v4, v8, v2}, Loyf;-><init>(II)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_b0

    :cond_df
    new-instance v1, Ljava/util/PriorityQueue;

    sget-object v4, Lwjh;->g:Lyg9;

    invoke-direct {v1, v2, v4}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    new-instance v4, Lia5;

    iget-object v5, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v5, [I

    array-length v5, v5

    sub-int/2addr v5, v3

    invoke-direct {v4, v0, v6, v5}, Lia5;-><init>(Lwjh;II)V

    invoke-virtual {v1, v4}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    :goto_f4
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->size()I

    move-result v4

    if-ge v4, v2, :cond_17c

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lia5;

    if-eqz v4, :cond_17c

    iget v5, v4, Lia5;->b:I

    add-int/lit8 v7, v5, 0x1

    iget v8, v4, Lia5;->a:I

    sub-int/2addr v7, v8

    if-le v7, v3, :cond_17c

    iget-object v7, v4, Lia5;->j:Lwjh;

    add-int/lit8 v11, v5, 0x1

    sub-int/2addr v11, v8

    if-le v11, v3, :cond_175

    iget v11, v4, Lia5;->e:I

    iget v12, v4, Lia5;->d:I

    sub-int/2addr v11, v12

    iget v12, v4, Lia5;->g:I

    iget v13, v4, Lia5;->f:I

    sub-int/2addr v12, v13

    iget v13, v4, Lia5;->i:I

    iget v14, v4, Lia5;->h:I

    sub-int/2addr v13, v14

    if-lt v11, v12, :cond_127

    if-lt v11, v13, :cond_127

    const/4 v11, -0x3

    goto :goto_12e

    :cond_127
    if-lt v12, v11, :cond_12d

    if-lt v12, v13, :cond_12d

    const/4 v11, -0x2

    goto :goto_12e

    :cond_12d
    const/4 v11, -0x1

    :goto_12e
    iget-object v12, v7, Lwjh;->b:Ljava/lang/Object;

    check-cast v12, [I

    iget-object v13, v7, Lwjh;->c:Ljava/lang/Object;

    check-cast v13, [I

    invoke-static {v11, v8, v5, v12}, Lwjh;->q(III[I)V

    iget v5, v4, Lia5;->b:I

    add-int/2addr v5, v3

    invoke-static {v12, v8, v5}, Ljava/util/Arrays;->sort([III)V

    iget v5, v4, Lia5;->b:I

    invoke-static {v11, v8, v5, v12}, Lwjh;->q(III[I)V

    iget v5, v4, Lia5;->c:I

    div-int/lit8 v5, v5, 0x2

    move v14, v6

    move v11, v8

    :goto_14a
    iget v15, v4, Lia5;->b:I

    if-gt v11, v15, :cond_160

    aget v16, v12, v11

    aget v16, v13, v16

    add-int v14, v14, v16

    if-lt v14, v5, :cond_15d

    add-int/lit8 v15, v15, -0x1

    invoke-static {v15, v11}, Ljava/lang/Math;->min(II)I

    move-result v8

    goto :goto_160

    :cond_15d
    add-int/lit8 v11, v11, 0x1

    goto :goto_14a

    :cond_160
    :goto_160
    new-instance v5, Lia5;

    add-int/lit8 v11, v8, 0x1

    iget v12, v4, Lia5;->b:I

    invoke-direct {v5, v7, v11, v12}, Lia5;-><init>(Lwjh;II)V

    iput v8, v4, Lia5;->b:I

    invoke-virtual {v4}, Lia5;->a()V

    invoke-virtual {v1, v5}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    invoke-virtual {v1, v4}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_f4

    :cond_175
    const-string v0, "Can not split a box with only 1 color"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 v0, 0x0

    throw v0

    :cond_17c
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_189
    :goto_189
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1fb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lia5;

    iget-object v4, v3, Lia5;->j:Lwjh;

    iget-object v5, v4, Lwjh;->b:Ljava/lang/Object;

    check-cast v5, [I

    iget-object v4, v4, Lwjh;->c:Ljava/lang/Object;

    check-cast v4, [I

    iget v7, v3, Lia5;->a:I

    move v8, v6

    move v11, v8

    move v12, v11

    move v13, v12

    :goto_1a5
    iget v14, v3, Lia5;->b:I

    if-gt v7, v14, :cond_1c5

    aget v14, v5, v7

    aget v15, v4, v14

    add-int/2addr v11, v15

    shr-int/lit8 v16, v14, 0xa

    and-int/lit8 v16, v16, 0x1f

    mul-int v16, v16, v15

    add-int v8, v16, v8

    shr-int/lit8 v16, v14, 0x5

    and-int/lit8 v16, v16, 0x1f

    mul-int v16, v16, v15

    add-int v12, v16, v12

    and-int/lit8 v14, v14, 0x1f

    mul-int/2addr v15, v14

    add-int/2addr v13, v15

    add-int/lit8 v7, v7, 0x1

    goto :goto_1a5

    :cond_1c5
    int-to-float v3, v8

    int-to-float v4, v11

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v5, v12

    div-float/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v7, v13

    div-float/2addr v7, v4

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v4

    new-instance v7, Loyf;

    invoke-static {v3, v10, v9}, Lwjh;->r(III)I

    move-result v3

    invoke-static {v5, v10, v9}, Lwjh;->r(III)I

    move-result v5

    invoke-static {v4, v10, v9}, Lwjh;->r(III)I

    move-result v4

    invoke-static {v3, v5, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    invoke-direct {v7, v3, v11}, Loyf;-><init>(II)V

    invoke-virtual {v7}, Loyf;->b()[F

    move-result-object v3

    invoke-virtual {v0, v3}, Lwjh;->z([F)Z

    move-result v3

    if-nez v3, :cond_189

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_189

    :cond_1fb
    iput-object v2, v0, Lwjh;->d:Ljava/lang/Object;

    :cond_1fd
    return-void
.end method

.method public static B(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    const-string v1, ": "

    if-eqz v0, :cond_1d

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-static {p0, v1}, Lp3p;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_1d
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-static {p0, v1}, Lp3p;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static h(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)Lwjh;
    .registers 10

    if-nez p0, :cond_f

    new-instance v0, Lwjh;

    const/4 v5, 0x0

    const/16 v6, 0xe

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_f
    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->hasBackgroundColor()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    iget v0, p0, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->backgroundColor:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v3, v0

    goto :goto_1f

    :cond_1e
    move-object v3, v1

    :goto_1f
    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->hasEdgeColor()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget v0, p0, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->edgeColor:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v4, v0

    goto :goto_2e

    :cond_2d
    move-object v4, v1

    :goto_2e
    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->hasEdgeType()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget v0, p0, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->edgeType:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v5, v0

    goto :goto_3d

    :cond_3c
    move-object v5, v1

    :goto_3d
    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->hasForegroundColor()Z

    move-result v0

    if-eqz v0, :cond_49

    iget v0, p0, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->foregroundColor:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_49
    move-object v6, v1

    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->hasWindowColor()Z

    new-instance v2, Lwjh;

    invoke-virtual {p0}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    const/16 v8, 0xe

    invoke-direct/range {v2 .. v8}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2
.end method

.method public static i(Ljava/lang/Object;Ldc8;)V
    .registers 5

    :try_start_0
    invoke-virtual {p1, p0}, Ldc8;->a(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_3} :catch_4

    return-void

    :catch_4
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not dispatch event: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " to handler "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lwjh;->B(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static j(Ldc8;Lcd8;)V
    .registers 4

    :try_start_0
    invoke-virtual {p1}, Lcd8;->a()Ljava/lang/Object;

    move-result-object p1
    :try_end_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_4} :catch_b

    if-nez p1, :cond_7

    return-void

    :cond_7
    invoke-static {p1, p0}, Lwjh;->i(Ljava/lang/Object;Ldc8;)V

    return-void

    :catch_b
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Producer "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " threw an exception."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lwjh;->B(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static q(III[I)V
    .registers 6

    const/4 v0, -0x2

    if-eq p0, v0, :cond_1f

    const/4 v0, -0x1

    if-ne p0, v0, :cond_38

    :goto_6
    if-gt p1, p2, :cond_38

    aget p0, p3, p1

    and-int/lit8 v0, p0, 0x1f

    shl-int/lit8 v0, v0, 0xa

    shr-int/lit8 v1, p0, 0x5

    and-int/lit8 v1, v1, 0x1f

    shl-int/lit8 v1, v1, 0x5

    or-int/2addr v0, v1

    shr-int/lit8 p0, p0, 0xa

    and-int/lit8 p0, p0, 0x1f

    or-int/2addr v0, p0

    aput v0, p3, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_6

    :cond_1f
    :goto_1f
    if-gt p1, p2, :cond_38

    aget p0, p3, p1

    shr-int/lit8 v0, p0, 0x5

    and-int/lit8 v0, v0, 0x1f

    shl-int/lit8 v0, v0, 0xa

    shr-int/lit8 v1, p0, 0xa

    and-int/lit8 v1, v1, 0x1f

    shl-int/lit8 v1, v1, 0x5

    or-int/2addr v0, v1

    and-int/lit8 p0, p0, 0x1f

    or-int/2addr v0, p0

    aput v0, p3, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1f

    :cond_38
    return-void
.end method

.method public static r(III)I
    .registers 3

    if-le p2, p1, :cond_6

    sub-int p1, p2, p1

    shl-int/2addr p0, p1

    goto :goto_8

    :cond_6
    sub-int/2addr p1, p2

    shr-int/2addr p0, p1

    :goto_8
    const/4 p1, 0x1

    shl-int p2, p1, p2

    sub-int/2addr p2, p1

    and-int/2addr p0, p2

    return p0
.end method


# virtual methods
.method public final A()V
    .registers 2

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lc4;

    invoke-static {v0}, LJ/N;->MLHk67wk(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    return-void
.end method

.method public final C()V
    .registers 6

    iget-byte v0, p0, Lwjh;->a:B

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_74

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v2, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v2, Lm0a;

    iget-object v2, v2, Lm0a;->e:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll0a;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v3, Lfyj;

    iget-object v3, v3, Lfyj;->a:Ldyj;

    sget-object v3, Ldyj;->a:Ldyj;

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p0, :cond_34

    iget-object v2, v2, Ll0a;->b:Lv08;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_37

    :cond_34
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_37
    return-void

    :pswitch_38
    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Liv7;

    invoke-virtual {v0}, Liv7;->b()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_59

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lhd;

    iget-object v0, v0, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lqde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_59

    const/4 v0, 0x1

    goto :goto_5a

    :cond_59
    move v0, v2

    :goto_5a
    iget-object v3, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_62

    move v4, v2

    goto :goto_63

    :cond_62
    move v4, v1

    :goto_63
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_72

    if-eqz v0, :cond_6f

    move v1, v2

    :cond_6f
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_72
    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x1a
        :pswitch_38
    .end packed-switch
.end method

.method public final a(Lpe6;Ls15;)V
    .registers 4

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, p1, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lfz8;Ls15;)V
    .registers 5

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v0, Lgb3;

    const/16 v1, 0x10

    invoke-direct {v0, p1, p2, v1}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Lfw2;Lkotlin/jvm/functions/Function0;)Lph4;
    .registers 10

    new-instance v0, Lnqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, -0x1

    iput v1, v0, Lnqh;->a:I

    iget-object v1, p0, Lwjh;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_b
    iget-object v2, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Throwable;

    if-eqz v2, :cond_18

    invoke-virtual {p1, v2}, Lfw2;->b(Ljava/lang/Throwable;)V

    sget-object p0, Lrbe;->q:Lt14;
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_96

    monitor-exit v1

    return-object p0

    :cond_18
    :try_start_18
    iget-object v2, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v2, Lcf2;

    :cond_1c
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_1c

    const v2, 0x7ffffff

    and-int/2addr v2, v4

    const/4 v3, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_32

    move v2, v3

    goto :goto_33

    :cond_32
    move v2, v5

    :goto_33
    ushr-int/lit8 v4, v4, 0x1b

    and-int/lit8 v4, v4, 0xf

    iput v4, v0, Lnqh;->a:I

    iget-object v4, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v4, Ldee;

    invoke-virtual {v4, p1}, Ldee;->a(Ljava/lang/Object;)V
    :try_end_40
    .catchall {:try_start_18 .. :try_end_40} :catchall_96

    monitor-exit v1

    if-eqz v2, :cond_8a

    :try_start_43
    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_46
    .catchall {:try_start_43 .. :try_end_46} :catchall_47

    goto :goto_8a

    :catchall_47
    move-exception p2

    iget-object v1, p0, Lwjh;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4b
    iget-object v2, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Throwable;

    if-nez v2, :cond_85

    iput-object p2, p0, Lwjh;->c:Ljava/lang/Object;

    iget-object v2, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v2, Ldee;

    iget-object v4, v2, Ldee;->a:[Ljava/lang/Object;

    iget v2, v2, Ldee;->b:I

    :goto_5b
    if-ge v5, v2, :cond_67

    aget-object v6, v4, v5

    check-cast v6, Lfw2;

    invoke-virtual {v6, p2}, Lfw2;->b(Ljava/lang/Throwable;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_5b

    :cond_67
    iget-object p2, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p2, Ldee;

    invoke-virtual {p2}, Ldee;->d()V

    iget-object p2, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p2, Lcf2;

    :cond_72
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    ushr-int/lit8 v4, v2, 0x1b

    and-int/lit8 v4, v4, 0xf

    add-int/2addr v4, v3

    and-int/lit8 v4, v4, 0xf

    shl-int/lit8 v4, v4, 0x1b

    invoke-virtual {p2, v2, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2
    :try_end_83
    .catchall {:try_start_4b .. :try_end_83} :catchall_87

    if-eqz v2, :cond_72

    :cond_85
    monitor-exit v1

    goto :goto_8a

    :catchall_87
    move-exception p0

    monitor-exit v1

    throw p0

    :cond_8a
    :goto_8a
    new-instance p2, Lk5o;

    new-instance v1, Lhv;

    const/4 v2, 0x4

    invoke-direct {v1, p1, p0, v0, v2}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, v1}, Lk5o;-><init>(Lhv;)V

    return-object p2

    :catchall_96
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final d()Lpo2;
    .registers 9

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Lg07;

    if-nez v0, :cond_9

    const-string v0, " surface"

    goto :goto_b

    :cond_9
    const-string v0, ""

    :goto_b
    iget-object v1, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_17

    const-string v1, " sharedSurfaces"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_17
    iget-object v1, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_23

    const-string v1, " mirrorMode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_23
    iget-object v1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-nez v1, :cond_2f

    const-string v1, " surfaceGroupId"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2f
    iget-object v1, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lip7;

    if-nez v1, :cond_3b

    const-string v1, " dynamicRange"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_3b
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_66

    new-instance v2, Lpo2;

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lg07;

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/util/List;

    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Lip7;

    invoke-direct/range {v2 .. v7}, Lpo2;-><init>(Lg07;Ljava/util/List;IILip7;)V

    return-object v2

    :cond_66
    const-string p0, "Missing required properties:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final e(Ljava/lang/String;IIIII)V
    .registers 11

    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    :try_start_f
    iget-object v2, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Lke4;

    if-eqz v2, :cond_1a

    invoke-virtual/range {p0 .. p6}, Lwjh;->w(Ljava/lang/String;IIIII)V

    goto/16 :goto_b0

    :cond_1a
    move v2, p3

    iget-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p3, Ljava/util/HashMap;

    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lh84;
    :try_end_25
    .catchall {:try_start_f .. :try_end_25} :catchall_b8

    if-nez p3, :cond_a7

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    :try_start_35
    iget-object p3, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p3, Lke4;

    if-nez p3, :cond_79

    iget-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p3, Ljava/util/HashMap;

    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lh84;

    if-nez p3, :cond_68

    iget-object p3, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p3, Ljava/util/HashMap;

    invoke-virtual {p3}, Ljava/util/HashMap;->size()I

    move-result p3

    const/16 v3, 0x100

    if-lt p3, v3, :cond_57

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    goto :goto_71

    :cond_57
    move p3, p4

    move p4, p5

    move p5, p6

    move-object p6, p1

    new-instance p1, Lh84;

    invoke-direct/range {p1 .. p6}, Lh84;-><init>(IIIILjava/lang/String;)V

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p3, p1

    :cond_68
    invoke-virtual {p3, v2}, Lh84;->a(I)Z

    move-result p0

    if-nez p0, :cond_71

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_71
    .catchall {:try_start_35 .. :try_end_71} :catchall_9d

    :cond_71
    :goto_71
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-void

    :cond_79
    :try_start_79
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_80
    .catchall {:try_start_79 .. :try_end_80} :catchall_9d

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    move p3, v2

    :try_start_88
    invoke-virtual/range {p0 .. p6}, Lwjh;->w(Ljava/lang/String;IIIII)V
    :try_end_8b
    .catchall {:try_start_88 .. :try_end_8b} :catchall_93

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return-void

    :catchall_93
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw p0

    :catchall_9d
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p0

    :cond_a7
    :try_start_a7
    invoke-virtual {p3, v2}, Lh84;->a(I)Z

    move-result p0

    if-nez p0, :cond_b0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_b0
    .catchall {:try_start_a7 .. :try_end_b0} :catchall_b8

    :cond_b0
    :goto_b0
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return-void

    :catchall_b8
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw p0
.end method

.method public final f(Lb2l;)V
    .registers 7

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_68

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MfdpAXw7(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "unavailable"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    iget-object p1, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_31

    iget-object p1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p1, Lc4;

    invoke-static {p1}, LJ/N;->MHJ6j1st(Ljava/lang/Object;)V

    :cond_31
    iput-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    return-void

    :cond_34
    invoke-virtual {p0}, Lwjh;->A()V

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_68

    const-string v0, "uncategorized"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_68

    const/16 v0, 0x3b

    const/4 v2, 0x1

    invoke-static {v2, v1, v0}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :catch_51
    :cond_51
    if-ge v3, v1, :cond_68

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    :try_start_5b
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_5f
    .catch Ljava/lang/NumberFormatException; {:try_start_5b .. :try_end_5f} :catch_51

    if-ne v4, v2, :cond_51

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_68
    return-void
.end method

.method public final g(Lzd4;Lzd4;Lntk;Lntk;Ljava/util/Map$Entry;)V
    .registers 16

    invoke-interface {p5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lntk;

    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v0, p3, Lntk;->g:Lto2;

    iget-object v4, v0, Lto2;->a:Landroid/util/Size;

    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldn2;

    iget-object v0, v0, Ldn2;->a:Lco2;

    iget-object v5, v0, Lco2;->d:Landroid/graphics/Rect;

    iget-boolean p3, p3, Lntk;->c:Z

    const/4 v0, 0x0

    if-eqz p3, :cond_1f

    move-object v6, p1

    goto :goto_20

    :cond_1f
    move-object v6, v0

    :goto_20
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->a:Lco2;

    iget v7, p1, Lco2;->f:I

    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->a:Lco2;

    iget-boolean v8, p1, Lco2;->g:Z

    new-instance v3, Luo2;

    invoke-direct/range {v3 .. v8}, Luo2;-><init>(Landroid/util/Size;Landroid/graphics/Rect;Lzd4;IZ)V

    iget-object p1, p4, Lntk;->g:Lto2;

    iget-object v5, p1, Lto2;->a:Landroid/util/Size;

    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->b:Lco2;

    iget-object v6, p1, Lco2;->d:Landroid/graphics/Rect;

    iget-boolean p1, p4, Lntk;->c:Z

    if-eqz p1, :cond_4d

    move-object v7, p2

    goto :goto_4e

    :cond_4d
    move-object v7, v0

    :goto_4e
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->b:Lco2;

    iget v8, p1, Lco2;->f:I

    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->b:Lco2;

    iget-boolean v9, p1, Lco2;->g:Z

    new-instance v4, Luo2;

    invoke-direct/range {v4 .. v9}, Luo2;-><init>(Landroid/util/Size;Landroid/graphics/Rect;Lzd4;IZ)V

    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldn2;

    iget-object p1, p1, Ldn2;->a:Lco2;

    iget-short p1, p1, Lco2;->c:S

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    invoke-virtual {v2}, Lntk;->b()V

    iget-boolean p2, v2, Lntk;->j:Z

    const/4 p3, 0x1

    xor-int/2addr p2, p3

    const-string p4, "Consumer can only be linked once."

    invoke-static {p4, p2}, Ljpo;->n(Ljava/lang/String;Z)V

    iput-boolean p3, v2, Lntk;->j:Z

    move-object v5, v3

    iget-object v3, v2, Lntk;->l:Lmtk;

    invoke-virtual {v3}, Lg07;->c()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p2

    new-instance v1, Lltk;

    move-object v6, v4

    move v4, p1

    invoke-direct/range {v1 .. v6}, Lltk;-><init>(Lntk;Lmtk;ILuo2;Luo2;)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p1

    invoke-static {p2, v1, p1}, Lk1g;->i0(Lcom/google/common/util/concurrent/ListenableFuture;Led2;Ljava/util/concurrent/Executor;)Lfr4;

    move-result-object p1

    new-instance p2, Li16;

    const/16 p3, 0xe

    const/4 p4, 0x0

    invoke-direct {p2, p3, p0, v2, p4}, Li16;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p0

    new-instance p3, Lwr9;

    invoke-direct {p3, p1, p2, p4}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p3, p0}, Lsr9;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public final get()Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Lo7h;

    invoke-interface {v0}, Ln7h;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/util/concurrent/Executor;

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Lo7h;

    invoke-interface {v0}, Ln7h;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lpxd;

    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Lshf;

    invoke-virtual {v0}, Lshf;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lx77;

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lo7h;

    invoke-interface {v0}, Ln7h;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lydi;

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lo7h;

    invoke-interface {p0}, Ln7h;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lydi;

    new-instance v1, Ldv6;

    invoke-direct/range {v1 .. v6}, Ldv6;-><init>(Ljava/util/concurrent/Executor;Lpxd;Lx77;Lydi;Lydi;)V

    return-object v1
.end method

.method public final k()V
    .registers 12

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Lumi;

    iget-object v1, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_23

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Lr9g;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-array v1, v3, [Lmkg;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lmkg;

    invoke-virtual {v0, p0}, Lr9g;->a([Lmkg;)V

    return-void

    :cond_23
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Legd;

    invoke-virtual {v7}, Legd;->b()Lo29;

    move-result-object v1

    sget-object v2, Lo29;->c:Lo29;

    iget-object v4, p0, Lwjh;->b:Ljava/lang/Object;

    move-object v6, v4

    check-cast v6, Landroid/content/Context;

    const/4 v10, 0x0

    if-ne v1, v2, :cond_5f

    invoke-virtual {v7}, Legd;->c()Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Lhu5;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v7, v3}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lzkg;->a:Ljava/util/regex/Pattern;

    new-instance p0, Low3;

    const/4 v3, 0x6

    invoke-direct {p0, v6, v1, v3}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, p0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    new-instance v1, Lr9g;

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, v10}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_5f
    new-instance v5, Lwu5;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lxm5;

    invoke-direct {v1, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    new-instance v8, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v8}, Landroid/media/MediaMetadata$Builder;-><init>()V

    invoke-virtual {v7}, Legd;->c()Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v7}, Legd;->b()Lo29;

    move-result-object p0

    sget-object v2, Lo29;->b:Lo29;

    if-eq p0, v2, :cond_a1

    invoke-static {v9}, Lzi4;->E(Landroid/net/Uri;)Z

    move-result p0

    if-eqz p0, :cond_99

    new-instance p0, Lz82;

    invoke-direct {p0, v5, v6, v9, v8}, Lz82;-><init>(Lwu5;Landroid/content/Context;Landroid/net/Uri;Landroid/media/MediaMetadata$Builder;)V

    invoke-interface {v0, p0}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    new-instance v2, Ldyd;

    invoke-direct {v2, v1, v7, v3}, Ldyd;-><init>(Lxm5;Legd;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, v10}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_99
    invoke-virtual {v8}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p0

    invoke-virtual {v1, v7, p0}, Lxm5;->D(Legd;Landroid/media/MediaMetadata;)V

    return-void

    :cond_a1
    new-instance v4, Leyd;

    invoke-direct/range {v4 .. v9}, Leyd;-><init>(Lwu5;Landroid/content/Context;Legd;Landroid/media/MediaMetadata$Builder;Landroid/net/Uri;)V

    invoke-interface {v0, v4}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    new-instance v2, Ldyd;

    const/4 v3, 0x1

    invoke-direct {v2, v1, v7, v3}, Ldyd;-><init>(Lxm5;Legd;B)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, v10}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final l(Lkotlin/jvm/functions/Function1;)V
    .registers 6

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v1, Ldee;

    iget-object v2, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Ldee;

    iput-object v2, p0, Lwjh;->e:Ljava/lang/Object;

    iput-object v1, p0, Lwjh;->f:Ljava/lang/Object;

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Lcf2;

    :cond_13
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    ushr-int/lit8 v3, v2, 0x1b

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x1

    and-int/lit8 v3, v3, 0xf

    shl-int/lit8 v3, v3, 0x1b

    invoke-virtual {p0, v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2

    if-eqz v2, :cond_13

    iget p0, v1, Ldee;->b:I

    const/4 v2, 0x0

    :goto_2a
    if-ge v2, p0, :cond_36

    invoke-virtual {v1, v2}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    :cond_36
    invoke-virtual {v1}, Ldee;->d()V
    :try_end_39
    .catchall {:try_start_3 .. :try_end_39} :catchall_3b

    monitor-exit v0

    return-void

    :catchall_3b
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final m(Ljava/util/Map;)V
    .registers 10

    invoke-interface {p1}, Ljava/util/Map;->size()I

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lh84;

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lke4;

    monitor-enter v1

    :try_start_1e
    iget-byte v0, v1, Lh84;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v0, v4, :cond_8f

    const/4 v4, 0x2

    if-eq v0, v4, :cond_6c

    const/4 v4, 0x3

    if-eq v0, v4, :cond_49

    const/4 v4, 0x4

    if-ne v0, v4, :cond_b1

    :goto_2d
    iget-object v0, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_b1

    iget-object v0, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v4, v1, Lh84;->b:Ljava/lang/String;

    invoke-virtual {v2, v0, v4}, Lke4;->f(ILjava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2d

    :cond_49
    move v0, v3

    :goto_4a
    iget-object v3, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_b1

    iget-object v3, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v7, v1, Lh84;->b:Ljava/lang/String;

    iget v4, v1, Lh84;->c:I

    iget v5, v1, Lh84;->d:I

    iget v6, v1, Lh84;->e:I

    invoke-virtual/range {v2 .. v7}, Lke4;->e(IIIILjava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    :cond_6c
    move v0, v3

    :goto_6d
    iget-object v3, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_b1

    iget-object v3, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v7, v1, Lh84;->b:Ljava/lang/String;

    iget v4, v1, Lh84;->c:I

    iget v5, v1, Lh84;->d:I

    iget v6, v1, Lh84;->e:I

    invoke-virtual/range {v2 .. v7}, Lke4;->d(IIIILjava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6d

    :cond_8f
    move v0, v3

    :goto_90
    iget-object v5, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_b1

    iget-object v5, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v6, v1, Lh84;->b:Ljava/lang/String;

    if-eqz v5, :cond_aa

    move v5, v4

    goto :goto_ab

    :cond_aa
    move v5, v3

    :goto_ab
    invoke-virtual {v2, v6, v5}, Lke4;->c(Ljava/lang/String;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_90

    :cond_b1
    iget-object v0, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    iget-object v0, v1, Lh84;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_bb
    .catchall {:try_start_1e .. :try_end_bb} :catchall_c0

    monitor-exit v1

    goto/16 :goto_b

    :goto_be
    :try_start_be
    monitor-exit v1
    :try_end_bf
    .catchall {:try_start_be .. :try_end_bf} :catchall_c0

    throw p0

    :catchall_c0
    move-exception v0

    move-object p0, v0

    goto :goto_be

    :cond_c3
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    return-void
.end method

.method public final n()Z
    .registers 2

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_18

    :cond_16
    const/4 p0, 0x0

    return p0

    :cond_18
    const/4 p0, 0x1

    return p0
.end method

.method public final o(I)Ldsk;
    .registers 7

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldsk;

    if-eqz v1, :cond_11

    return-object v1

    :cond_11
    iget-object v1, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v1, Lf1p;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lird;

    if-eqz p1, :cond_67

    const/4 v4, 0x1

    if-eq p1, v4, :cond_57

    const/4 v4, 0x2

    if-eq p1, v4, :cond_4b

    const/4 v4, 0x3

    if-eq p1, v4, :cond_3a

    const/4 v2, 0x4

    if-ne p1, v2, :cond_2f

    new-instance v2, Lrt6;

    invoke-direct {v2, p0, v1, v4}, Lrt6;-><init>(Ljava/lang/Object;Lf1p;B)V

    goto :goto_73

    :cond_2f
    const-string p0, "Unrecognized contentType: "

    invoke-static {p1, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_3a
    const-string p0, "androidx.media3.exoplayer.rtsp.RtspMediaSource$Factory"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    new-instance v1, Lst6;

    invoke-direct {v1, p0, v2}, Lst6;-><init>(Ljava/lang/Object;B)V

    move-object v2, v1

    goto :goto_73

    :cond_4b
    const-class p0, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;

    invoke-virtual {p0, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    new-instance v2, Lrt6;

    invoke-direct {v2, p0, v1, v4}, Lrt6;-><init>(Ljava/lang/Object;Lf1p;B)V

    goto :goto_73

    :cond_57
    const-string p0, "androidx.media3.exoplayer.smoothstreaming.SsMediaSource$Factory"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    new-instance v2, Lrt6;

    invoke-direct {v2, p0, v1, v4}, Lrt6;-><init>(Ljava/lang/Object;Lf1p;B)V

    goto :goto_73

    :cond_67
    const-class p0, Landroidx/media3/exoplayer/dash/DashMediaSource$Factory;

    invoke-virtual {p0, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    new-instance v3, Lrt6;

    invoke-direct {v3, p0, v1, v2}, Lrt6;-><init>(Ljava/lang/Object;Lf1p;B)V

    move-object v2, v3

    :goto_73
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v2
.end method

.method public final p()V
    .registers 34

    move-object/from16 v0, p0

    iget-object v1, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ls9;

    iget-object v2, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-object v3, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lo59;

    if-eqz v3, :cond_130

    iget-object v4, v3, Lo59;->c:Lie0;

    if-eqz v4, :cond_130

    iget-wide v5, v3, Lo59;->d:J

    const-wide/16 v7, -0x1

    cmp-long v9, v5, v7

    if-eqz v9, :cond_114

    iget-wide v11, v3, Lo59;->i:J

    cmp-long v9, v11, v7

    if-eqz v9, :cond_114

    iget-wide v13, v3, Lo59;->j:J

    cmp-long v9, v13, v7

    if-eqz v9, :cond_114

    move-wide v15, v7

    iget-wide v7, v3, Lo59;->k:J

    sget-object v9, Lie0;->g:Lie0;

    move-wide/from16 v17, v11

    if-ne v4, v9, :cond_3d

    iget-wide v10, v3, Lo59;->g:J

    cmp-long v10, v10, v15

    if-nez v10, :cond_3d

    iget-object v10, v3, Lo59;->o:Lie0;

    if-eqz v10, :cond_3d

    move-object v4, v10

    move-wide v7, v15

    :cond_3d
    iget-object v10, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v10, Lx5f;

    iget-boolean v11, v3, Lo59;->l:Z

    iget-boolean v12, v3, Lo59;->m:Z

    iget-boolean v9, v3, Lo59;->n:Z

    move-object/from16 v19, v1

    iget-wide v0, v3, Lo59;->a:J

    move-wide/from16 v20, v7

    iget-wide v7, v3, Lo59;->e:J

    move-wide/from16 v22, v13

    iget-wide v13, v3, Lo59;->f:J

    move-wide/from16 v24, v13

    iget-wide v13, v3, Lo59;->g:J

    move-object/from16 v26, v2

    iget-wide v2, v3, Lo59;->h:J

    move-wide/from16 v27, v15

    iget-boolean v15, v10, Lx5f;->h:Z

    if-nez v15, :cond_67

    :goto_61
    move-object/from16 v1, v19

    move-object/from16 v2, v26

    goto/16 :goto_10b

    :cond_67
    iget-object v15, v10, Lx5f;->d:Lzpa;

    move-object/from16 v16, v10

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    invoke-virtual {v10, v15}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v15

    move-object/from16 v29, v10

    new-instance v10, Lhe0;

    move-object/from16 v30, v15

    const/4 v15, -0x1

    move-wide/from16 v31, v2

    const/16 v2, 0xd

    const/16 v3, 0x98b

    invoke-direct {v10, v3, v15, v2}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v10, v2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v2, Lie0;->b:Lie0;

    if-ne v4, v2, :cond_8f

    invoke-virtual {v10, v3, v3, v11}, Ljf0;->r(IIZ)V

    :cond_8f
    const/4 v2, 0x2

    invoke-virtual {v10, v2, v3, v12}, Ljf0;->r(IIZ)V

    const/4 v2, 0x3

    invoke-virtual {v10, v2, v3, v9}, Ljf0;->r(IIZ)V

    const/4 v2, 0x4

    invoke-virtual {v10, v2, v3, v0, v1}, Ljf0;->p(IIJ)V

    const/4 v0, 0x5

    invoke-virtual {v10, v0, v3, v5, v6}, Ljf0;->p(IIJ)V

    cmp-long v0, v7, v27

    if-lez v0, :cond_a7

    const/4 v0, 0x6

    invoke-virtual {v10, v0, v3, v7, v8}, Ljf0;->p(IIJ)V

    :cond_a7
    cmp-long v0, v24, v27

    if-lez v0, :cond_b1

    const/4 v0, 0x7

    move-wide/from16 v1, v24

    invoke-virtual {v10, v0, v3, v1, v2}, Ljf0;->p(IIJ)V

    :cond_b1
    cmp-long v0, v13, v27

    if-lez v0, :cond_ba

    const/16 v0, 0x8

    invoke-virtual {v10, v0, v3, v13, v14}, Ljf0;->p(IIJ)V

    :cond_ba
    cmp-long v0, v31, v27

    if-lez v0, :cond_c5

    const/16 v0, 0x9

    move-wide/from16 v1, v31

    invoke-virtual {v10, v0, v3, v1, v2}, Ljf0;->p(IIJ)V

    :cond_c5
    const/16 v0, 0xa

    move-wide/from16 v1, v17

    invoke-virtual {v10, v0, v3, v1, v2}, Ljf0;->p(IIJ)V

    const/16 v0, 0xb

    move-wide/from16 v1, v22

    invoke-virtual {v10, v0, v3, v1, v2}, Ljf0;->p(IIJ)V

    cmp-long v0, v20, v27

    if-lez v0, :cond_de

    const/16 v0, 0xc

    move-wide/from16 v7, v20

    invoke-virtual {v10, v0, v3, v7, v8}, Ljf0;->p(IIJ)V

    :cond_de
    const/16 v0, 0x27

    move-object/from16 v1, v30

    invoke-virtual {v1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_f6

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_f6

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_ff

    :cond_f6
    invoke-static {v1, v0, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_ff
    invoke-virtual {v3, v10}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    move-object/from16 v10, v16

    move-object/from16 v0, v29

    invoke-virtual {v10, v0}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_61

    :goto_10b
    invoke-virtual {v2, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lwjh;->f:Ljava/lang/Object;

    return-void

    :cond_114
    iget-object v3, v0, Lwjh;->e:Ljava/lang/Object;

    check-cast v3, Lsy;

    invoke-virtual {v3}, Lsy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_130

    iget-object v3, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lo59;

    if-eqz v3, :cond_130

    invoke-virtual {v2, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 v9, 0x0

    iput-object v9, v0, Lwjh;->f:Ljava/lang/Object;

    :cond_130
    return-void
.end method

.method public final s(Lfji;)V
    .registers 3

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmta;

    if-eqz p0, :cond_2b

    iget-object p0, p0, Lmta;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lota;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Lota;->b()V

    :cond_19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lota;

    if-eqz p0, :cond_2b

    iget-object p0, p0, Lota;->b:Ljava/util/LinkedList;

    sget-object p1, Lnta;->e:Lnta;

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-gez p1, :cond_2c

    :cond_2b
    return-void

    :cond_2c
    sget-object v0, Lnta;->d:Lnta;

    invoke-virtual {p0, p1, v0}, Ljava/util/LinkedList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final t(Ljava/lang/CharSequence;)V
    .registers 6

    iget-object v0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Ldb;

    const/4 v2, 0x0

    iput-object v2, v1, Ldb;->f:Ln1;

    iget-object v1, v1, Ldb;->e:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_11
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcb;

    invoke-virtual {v3}, Lcb;->b()V

    goto :goto_11

    :cond_21
    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Lab;

    if-nez p0, :cond_72

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_71

    if-eqz p1, :cond_35

    new-instance p0, Lqxh;

    invoke-direct {p0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_36

    :cond_35
    move-object p0, v2

    :goto_36
    new-instance p1, Lgkj;

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1}, Lnz0;-><init>(ZZ)V

    iput-object v2, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->c:Ljava/lang/String;

    iput-object v2, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v2, p1, Lgkj;->e:Lekj;

    iput-object v2, p1, Lgkj;->f:Lfkj;

    iput-object v2, p1, Lgkj;->g:Lqp2;

    iput-object v2, p1, Lgkj;->h:Ldkj;

    iput-object v2, p1, Lgkj;->i:Ldkj;

    iput-object v2, p1, Lgkj;->j:Lql;

    const v2, 0x7f140bbb

    iput v2, p1, Lgkj;->k:I

    iput v1, p1, Lgkj;->l:I

    const v1, 0x7f141157

    iput v1, p1, Lgkj;->m:I

    const/4 v1, 0x1

    iput-boolean v1, p1, Lgkj;->n:Z

    iput-object p0, p1, Lgkj;->o:Lpxh;

    const-string p0, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v0, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_71
    return-void

    :cond_72
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lab;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lwjh;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    const-string p0, "[Bus \"main-bus\"]"

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0xc
        :pswitch_a
    .end packed-switch
.end method

.method public final u(I)V
    .registers 9

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_1c

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v1}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v1

    const/16 v4, 0xb

    int-to-long v5, p1

    invoke-virtual {v1, v4, v2, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_1c
    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lode;

    if-gtz p1, :cond_23

    const/4 v2, 0x0

    :cond_23
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    return-void
.end method

.method public final v(Ljava/lang/Object;)V
    .registers 9

    iget-object v0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Lf30;

    if-eqz p1, :cond_f4

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_e0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iget-object v2, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    const/4 v4, 0x0

    if-nez v3, :cond_51

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_2e
    :goto_2e
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_47

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    if-eqz v6, :cond_2e

    invoke-virtual {v3, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_47
    invoke-virtual {v2, v1, v5}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/util/Set;

    if-nez v3, :cond_51

    move-object v3, v5

    :cond_51
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_55
    :goto_55
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_95

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    iget-object v3, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    if-eqz v2, :cond_55

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_55

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_77
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_92

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldc8;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v5, Lu14;

    invoke-direct {v5, p1, v3}, Lu14;-><init>(Ljava/lang/Object;Ldc8;)V

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_77

    :cond_92
    const/4 v2, 0x1

    move v4, v2

    goto :goto_55

    :cond_95
    if-nez v4, :cond_a3

    instance-of v1, p1, Lpi6;

    if-nez v1, :cond_a3

    new-instance v1, Lpi6;

    invoke-direct {v1, p0, p1}, Lpi6;-><init>(Lwjh;Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lwjh;->v(Ljava/lang/Object;)V

    :cond_a3
    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lf30;

    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_b4

    return-void

    :cond_b4
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_b9
    :goto_b9
    :try_start_b9
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lu14;
    :try_end_c5
    .catchall {:try_start_b9 .. :try_end_c5} :catchall_d9

    if-nez p1, :cond_cd

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void

    :cond_cd
    :try_start_cd
    iget-object v1, p1, Lu14;->b:Ldc8;

    iget-boolean v2, v1, Ldc8;->d:Z

    if-eqz v2, :cond_b9

    iget-object p1, p1, Lu14;->a:Ljava/lang/Object;

    invoke-static {p1, v1}, Lwjh;->i(Ljava/lang/Object;Ldc8;)V
    :try_end_d8
    .catchall {:try_start_cd .. :try_end_d8} :catchall_d9

    goto :goto_b9

    :catchall_d9
    move-exception p1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw p1

    :cond_e0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Event bus "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " accessed from non-main thread "

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {p1, p0, v0}, Lt14;->g(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_f4
    const-string p0, "Event to post must not be null."

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final w(Ljava/lang/String;IIIII)V
    .registers 8

    const/4 v0, 0x1

    if-eq p2, v0, :cond_3a

    const/4 v0, 0x2

    if-eq p2, v0, :cond_2c

    const/4 v0, 0x3

    if-eq p2, v0, :cond_1e

    const/4 p4, 0x4

    if-ne p2, p4, :cond_14

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lke4;

    invoke-virtual {p0, p3, p1}, Lke4;->f(ILjava/lang/String;)V

    return-void

    :cond_14
    const-string p0, "Unknown histogram type "

    invoke-static {p2, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-void

    :cond_1e
    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lke4;

    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move-object p6, p1

    move-object p1, p0

    invoke-virtual/range {p1 .. p6}, Lke4;->e(IIIILjava/lang/String;)V

    return-void

    :cond_2c
    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move-object p6, p1

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    move-object p1, p0

    check-cast p1, Lke4;

    invoke-virtual/range {p1 .. p6}, Lke4;->d(IIIILjava/lang/String;)V

    return-void

    :cond_3a
    move-object p6, p1

    move p2, p3

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lke4;

    if-nez p2, :cond_43

    const/4 v0, 0x0

    :cond_43
    invoke-virtual {p0, p6, v0}, Lke4;->c(Ljava/lang/String;Z)V

    return-void
.end method

.method public final x(ILjava/lang/String;)V
    .registers 10

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x4

    const/4 v4, 0x0

    move-object v0, p0

    move v3, p1

    move-object v1, p2

    invoke-virtual/range {v0 .. v6}, Lwjh;->e(Ljava/lang/String;IIIII)V

    return-void
.end method

.method public final y(Lie0;)V
    .registers 4

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Lo59;

    if-eqz v0, :cond_a

    iget-object v1, v0, Lo59;->c:Lie0;

    if-eqz v1, :cond_b

    :cond_a
    return-void

    :cond_b
    iput-object p1, v0, Lo59;->c:Lie0;

    invoke-virtual {p0}, Lwjh;->p()V

    return-void
.end method

.method public final z([F)Z
    .registers 8

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, [Lnyf;

    const/4 v0, 0x0

    if-eqz p0, :cond_40

    array-length v1, p0

    if-lez v1, :cond_40

    array-length v1, p0

    move v2, v0

    :goto_c
    if-ge v2, v1, :cond_40

    aget-object v3, p0, v2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x2

    aget v3, p1, v3

    const v4, 0x3f733333    # 0.95f

    cmpl-float v4, v3, v4

    const/4 v5, 0x1

    if-gez v4, :cond_3c

    const v4, 0x3d4ccccd    # 0.05f

    cmpg-float v3, v3, v4

    if-lez v3, :cond_3c

    aget v3, p1, v0

    const/high16 v4, 0x41200000    # 10.0f

    cmpl-float v4, v3, v4

    if-ltz v4, :cond_3d

    const/high16 v4, 0x42140000    # 37.0f

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_3d

    aget v3, p1, v5

    const v4, 0x3f51eb85    # 0.82f

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_3d

    :cond_3c
    return v5

    :cond_3d
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_40
    return v0
.end method
