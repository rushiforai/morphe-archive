.class public final Lpyl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;
.implements Lqvi;


# instance fields
.field public final synthetic a:B

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 4

    iput-byte p1, p0, Lpyl;->a:B

    packed-switch p1, :pswitch_data_4a

    .line 762
    :pswitch_5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 763
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 764
    invoke-static {}, Lfee;->k()Lfee;

    move-result-object p1

    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    const/4 p1, -0x1

    .line 765
    iput p1, p0, Lpyl;->b:I

    .line 766
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    .line 767
    invoke-static {}, Lbfe;->a()Lbfe;

    move-result-object p1

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    return-void

    .line 768
    :pswitch_26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 769
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    .line 770
    new-instance p1, Lsa2;

    .line 771
    sget-object v0, Luyj;->k:Lzyk;

    .line 772
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/16 v1, 0x12

    .line 773
    invoke-direct {p1, v1, v0}, Lsa2;-><init>(BI)V

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    return-void

    .line 774
    :pswitch_46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_4a
    .packed-switch 0x7
        :pswitch_46
        :pswitch_5
        :pswitch_26
    .end packed-switch
.end method

.method public constructor <init>(ILcom/google/ads/interactivemedia/v3/impl/data/zzc;)V
    .registers 4

    const/16 v0, 0xf

    iput-byte v0, p0, Lpyl;->a:B

    .line 665
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    iput p1, p0, Lpyl;->b:I

    iput-object p2, p0, Lpyl;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lagm;ILtjn;)V
    .registers 6

    const/16 v0, 0xc

    iput-byte v0, p0, Lpyl;->a:B

    .line 749
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 750
    iput-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    .line 751
    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    .line 752
    iput-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    .line 753
    iput p3, p0, Lpyl;->b:I

    .line 754
    iput-object p4, p0, Lpyl;->f:Ljava/lang/Object;

    .line 755
    new-instance p2, Lsvk;

    const/16 p3, 0x12

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public constructor <init>(Lb94;Ljava/lang/String;ILshf;Lfvh;)V
    .registers 7

    const/16 v0, 0xa

    iput-byte v0, p0, Lpyl;->a:B

    .line 775
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 776
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    iput-object p2, p0, Lpyl;->d:Ljava/lang/Object;

    iput p3, p0, Lpyl;->b:I

    iput-object p4, p0, Lpyl;->e:Ljava/lang/Object;

    iput-object p5, p0, Lpyl;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lfqe;Lx77;)V
    .registers 5

    const/16 v0, 0x8

    iput-byte v0, p0, Lpyl;->a:B

    .line 675
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 676
    new-instance v0, Lau9;

    const/4 v1, 0x7

    .line 677
    invoke-direct {v0, v1}, Lau9;-><init>(B)V

    .line 678
    iput-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    .line 679
    iput-object p2, p0, Lpyl;->c:Ljava/lang/Object;

    .line 680
    iget-object p2, p2, Lx77;->b:Ljava/lang/Object;

    check-cast p2, Lg77;

    .line 681
    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    if-eqz p2, :cond_27

    .line 682
    iget-object p1, p1, Luqe;->g:Ls9i;

    .line 683
    new-instance v0, Ls14;

    .line 684
    iget-object p1, p1, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lga6;

    .line 685
    invoke-direct {v0, p1, p2}, Ls14;-><init>(Lywh;Lg77;)V

    goto :goto_28

    :cond_27
    const/4 v0, 0x0

    .line 686
    :goto_28
    iput-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    const/4 v0, 0x4

    iput-byte v0, p0, Lpyl;->a:B

    .line 687
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 688
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v0

    iput v0, p0, Lpyl;->b:I

    .line 689
    invoke-static {}, Lfr3;->p()V

    const v1, 0x8b31

    .line 690
    invoke-static {v0, v1, p1}, Lpyl;->g(IILjava/lang/String;)V

    const p1, 0x8b30

    .line 691
    invoke-static {v0, p1, p2}, Lpyl;->g(IILjava/lang/String;)V

    .line 692
    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    const/4 p1, 0x0

    .line 693
    filled-new-array {p1}, [I

    move-result-object p2

    const v1, 0x8b82

    .line 694
    invoke-static {v0, v1, p2, p1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 695
    aget p2, p2, p1

    const/4 v1, 0x1

    if-ne p2, v1, :cond_30

    move p2, v1

    goto :goto_31

    :cond_30
    move p2, p1

    :goto_31
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to link shader program: \n"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 696
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 697
    invoke-static {v2, p2}, Lfr3;->q(Ljava/lang/String;Z)V

    .line 698
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 699
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    .line 700
    new-array p2, v1, [I

    const v2, 0x8b89

    .line 701
    invoke-static {v0, v2, p2, p1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 702
    aget v0, p2, p1

    new-array v0, v0, [Lhr5;

    iput-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    move v3, p1

    .line 703
    :goto_5f
    aget v0, p2, p1

    if-ge v3, v0, :cond_a7

    .line 704
    iget v2, p0, Lpyl;->b:I

    .line 705
    new-array v0, v1, [I

    const v4, 0x8b8a

    .line 706
    invoke-static {v2, v4, v0, p1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 707
    aget v4, v0, p1

    new-array v11, v4, [B

    .line 708
    new-array v5, v1, [I

    new-array v7, v1, [I

    new-array v9, v1, [I

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v2 .. v12}, Landroid/opengl/GLES20;->glGetActiveAttrib(III[II[II[II[BI)V

    .line 709
    new-instance v0, Ljava/lang/String;

    move v5, p1

    :goto_81
    if-ge v5, v4, :cond_8c

    .line 710
    aget-byte v6, v11, v5

    if-nez v6, :cond_89

    move v4, v5

    goto :goto_8c

    :cond_89
    add-int/lit8 v5, v5, 0x1

    goto :goto_81

    .line 711
    :cond_8c
    :goto_8c
    invoke-direct {v0, v11, p1, v4}, Ljava/lang/String;-><init>([BII)V

    .line 712
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 713
    new-instance v2, Lhr5;

    .line 714
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 715
    iget-object v4, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v4, [Lhr5;

    aput-object v2, v4, v3

    .line 716
    iget-object v4, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_5f

    .line 717
    :cond_a7
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lpyl;->f:Ljava/lang/Object;

    .line 718
    new-array p2, v1, [I

    .line 719
    iget v0, p0, Lpyl;->b:I

    const v2, 0x8b86

    invoke-static {v0, v2, p2, p1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 720
    aget v0, p2, p1

    new-array v0, v0, [Lir5;

    iput-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    move v3, p1

    .line 721
    :goto_bf
    aget v0, p2, p1

    if-ge v3, v0, :cond_107

    .line 722
    iget v2, p0, Lpyl;->b:I

    .line 723
    new-array v0, v1, [I

    const v4, 0x8b87

    .line 724
    invoke-static {v2, v4, v0, p1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 725
    new-array v9, v1, [I

    .line 726
    aget v4, v0, p1

    new-array v11, v4, [B

    .line 727
    new-array v5, v1, [I

    new-array v7, v1, [I

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v2 .. v12}, Landroid/opengl/GLES20;->glGetActiveUniform(III[II[II[II[BI)V

    .line 728
    new-instance v0, Ljava/lang/String;

    move v5, p1

    :goto_e1
    if-ge v5, v4, :cond_ec

    .line 729
    aget-byte v6, v11, v5

    if-nez v6, :cond_e9

    move v4, v5

    goto :goto_ec

    :cond_e9
    add-int/lit8 v5, v5, 0x1

    goto :goto_e1

    .line 730
    :cond_ec
    :goto_ec
    invoke-direct {v0, v11, p1, v4}, Ljava/lang/String;-><init>([BII)V

    .line 731
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 732
    new-instance v2, Lir5;

    .line 733
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 734
    iget-object v4, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v4, [Lir5;

    aput-object v2, v4, v3

    .line 735
    iget-object v4, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_bf

    .line 736
    :cond_107
    invoke-static {}, Lfr3;->p()V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/os/Bundle;)V
    .registers 15

    const/16 v0, 0xe

    iput-byte v0, p0, Lpyl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_14
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo0o;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    iget-object v1, v1, Lo0o;->c:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1, v0}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_14

    :cond_32
    const/4 p1, 0x0

    if-eqz p2, :cond_3c

    const-string v1, "key.welcome_onboarding_flow.shown_leaves"

    invoke-virtual {p2, v1}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    goto :goto_3d

    :cond_3c
    move-object v1, p1

    :goto_3d
    const/4 v2, 0x0

    const/16 v3, 0xa

    if-eqz v1, :cond_1ab

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    array-length v5, v1

    move v6, v2

    :goto_49
    if-ge v6, v5, :cond_7b

    aget-object v7, v1, v6

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v2

    :cond_52
    if-ge v9, v8, :cond_6a

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    move-object v11, v10

    check-cast v11, Lo0o;

    iget-object v11, v11, Lo0o;->a:Lm0o;

    invoke-virtual {v11}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_52

    goto :goto_6b

    :cond_6a
    move-object v10, p1

    :goto_6b
    check-cast v10, Lo0o;

    if-eqz v10, :cond_72

    iget-object v7, v10, Lo0o;->a:Lm0o;

    goto :goto_73

    :cond_72
    move-object v7, p1

    :goto_73
    if-eqz v7, :cond_78

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_78
    add-int/lit8 v6, v6, 0x1

    goto :goto_49

    :cond_7b
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-static {v4, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-static {v0}, Lqbd;->a(I)I

    move-result v0

    const/16 v1, 0x10

    if-ge v0, v1, :cond_8a

    move v0, v1

    :cond_8a
    invoke-direct {p1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v5, v2

    :goto_92
    if-ge v5, v0, :cond_a3

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    move-object v7, v6

    check-cast v7, Lm0o;

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_92

    :cond_a3
    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-static {v0}, Lqbd;->a(I)I

    move-result v0

    if-lt v0, v1, :cond_b6

    move v1, v0

    :cond_b6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_bf
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_113

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo0o;

    iget-object v5, v1, Lo0o;->a:Lm0o;

    iget-object v1, v1, Lo0o;->c:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    new-instance v6, Ljava/util/ArrayList;

    invoke-static {v1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_de
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lo0o;

    iget-object v7, v7, Lo0o;->a:Lm0o;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_de

    :cond_f0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v2

    :cond_fa
    :goto_fa
    if-ge v8, v7, :cond_10f

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    move-object v10, v9

    check-cast v10, Lm0o;

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_fa

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_fa

    :cond_10f
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_bf

    :cond_113
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_120
    :goto_120
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_146

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_120

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v5, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_120

    :cond_146
    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_157
    :goto_157
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_181

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lo0o;

    iget-object v6, v5, Lo0o;->c:Ljava/util/List;

    iget-object v5, v5, Lo0o;->a:Lm0o;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_173

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    goto :goto_17b

    :cond_173
    iget-object v6, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashMap;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    :goto_17b
    if-eqz v5, :cond_157

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_157

    :cond_181
    new-instance p1, Ljava/util/ArrayList;

    invoke-static {v0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v2

    :goto_18f
    if-ge v3, v1, :cond_19f

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lo0o;

    iget-object v4, v4, Lo0o;->a:Lm0o;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18f

    :cond_19f
    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    const-string p1, "key.welcome_onboarding_flow.current_index"

    invoke-virtual {p2, p1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lpyl;->b:I

    goto/16 :goto_298

    :cond_1ab
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1c2
    :goto_1c2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_292

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lo0o;

    iget-object v5, v4, Lo0o;->c:Ljava/util/List;

    iget-object v6, v4, Lo0o;->a:Lm0o;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1d6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1f0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lo0o;

    iget-object v9, v8, Lo0o;->a:Lm0o;

    invoke-virtual {v8}, Lo0o;->a()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v0, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d6

    :cond_1f0
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1fb

    invoke-virtual {v4}, Lo0o;->a()Z

    move-result v4

    goto :goto_232

    :cond_1fb
    move-object v7, v5

    check-cast v7, Ljava/lang/Iterable;

    instance-of v8, v7, Ljava/util/Collection;

    if-eqz v8, :cond_20b

    move-object v8, v7

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_231

    :cond_20b
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_20f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_231

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lo0o;

    iget-object v8, v8, Lo0o;->a:Lm0o;

    invoke-virtual {v0, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_20f

    invoke-virtual {v4}, Lo0o;->a()Z

    move-result v4

    if-eqz v4, :cond_231

    const/4 v4, 0x1

    goto :goto_232

    :cond_231
    move v4, v2

    :goto_232
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v4, :cond_1c2

    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v4, v5

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1c2

    check-cast v5, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v5, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_256
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_268

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lo0o;

    iget-object v7, v7, Lo0o;->a:Lm0o;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_256

    :cond_268
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v2

    :cond_272
    :goto_272
    if-ge v8, v7, :cond_28d

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    move-object v10, v9

    check-cast v10, Lm0o;

    invoke-virtual {v0, v10}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v10, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_272

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_272

    :cond_28d
    invoke-interface {p2, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1c2

    :cond_292
    iput-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    iput-object p2, p0, Lpyl;->f:Ljava/lang/Object;

    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    :goto_298
    return-void
.end method

.method public constructor <init>(Ljcn;Loji;[B[Ll5b;I)V
    .registers 7

    const/16 v0, 0xd

    iput-byte v0, p0, Lpyl;->a:B

    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 757
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 758
    iput-object p2, p0, Lpyl;->d:Ljava/lang/Object;

    .line 759
    iput-object p3, p0, Lpyl;->e:Ljava/lang/Object;

    .line 760
    iput-object p4, p0, Lpyl;->f:Ljava/lang/Object;

    .line 761
    iput p5, p0, Lpyl;->b:I

    return-void
.end method

.method public constructor <init>(Lp7m;I)V
    .registers 5

    const/16 v0, 0xb

    iput-byte v0, p0, Lpyl;->a:B

    .line 779
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    .line 780
    new-instance p1, Lbq4;

    const/4 v0, 0x5

    new-array v1, v0, [B

    .line 781
    invoke-direct {p1, v1, v0}, Lbq4;-><init>([BI)V

    .line 782
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 783
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    .line 784
    new-instance p1, Landroid/util/SparseIntArray;

    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    .line 785
    iput p2, p0, Lpyl;->b:I

    return-void
.end method

.method public constructor <init>(Lq4a;[Lo4a;)V
    .registers 11

    const/4 v0, 0x6

    iput-byte v0, p0, Lpyl;->a:B

    .line 786
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    .line 787
    array-length v0, p2

    new-array v1, v0, [Lo4a;

    iput-object v1, p0, Lpyl;->c:Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    .line 788
    iput v0, p0, Lpyl;->b:I

    .line 789
    invoke-virtual {p1}, Lq4a;->f()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    .line 790
    new-array v0, p1, [[Lo4a;

    .line 791
    new-array v1, p1, [I

    .line 792
    array-length v2, p2

    const/4 v3, 0x0

    move v4, v3

    :goto_1e
    if-ge v4, v2, :cond_2f

    aget-object v5, p2, v4

    .line 793
    iget-object v5, v5, Lo4a;->a:Ls4a;

    iget v5, v5, Ls4a;->a:I

    aget v6, v1, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    :cond_2f
    move v2, v3

    :goto_30
    if-ge v2, p1, :cond_3b

    .line 794
    aget v4, v1, v2

    new-array v4, v4, [Lo4a;

    aput-object v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_30

    .line 795
    :cond_3b
    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([II)V

    .line 796
    array-length p1, p2

    :goto_3f
    if-ge v3, p1, :cond_54

    aget-object v2, p2, v3

    .line 797
    iget-object v4, v2, Lo4a;->a:Ls4a;

    iget v4, v4, Ls4a;->a:I

    .line 798
    aget-object v5, v0, v4

    aget v6, v1, v4

    add-int/lit8 v7, v6, 0x1

    aput v7, v1, v4

    aput-object v2, v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_3f

    .line 799
    :cond_54
    iput-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    .line 800
    iget-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p1, Lq4a;

    invoke-virtual {p1}, Lq4a;->f()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    new-array p1, p1, [I

    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lsa4;)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lpyl;->a:B

    .line 666
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 667
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 668
    sget-object p1, Lf3a;->a:Lbf2;

    .line 669
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 670
    sget-object v0, Lbf2;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I

    move-result p1

    .line 671
    iput p1, p0, Lpyl;->b:I

    const/4 p1, 0x0

    .line 672
    invoke-static {p1}, Lc26;->i(Z)Laf2;

    move-result-object p1

    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    .line 673
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    .line 674
    new-instance p1, Lxm5;

    invoke-direct {p1, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lun;ILjava/lang/String;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lpyl;->a:B

    .line 777
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lpyl;->b:I

    iput-object p3, p0, Lpyl;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    .line 778
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwjh;Lx5f;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lpyl;->a:B

    .line 744
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 745
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    .line 746
    new-instance v0, Ljec;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljec;-><init>(I)V

    iput-object v0, p0, Lpyl;->f:Ljava/lang/Object;

    .line 747
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 748
    iput-object p2, p0, Lpyl;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Lluh;[Lbj8;Lfzl;Lpr;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lpyl;->a:B

    .line 737
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 738
    array-length v1, p1

    array-length v2, p2

    if-ne v1, v2, :cond_b

    const/4 v0, 0x1

    :cond_b
    invoke-static {v0}, Lz4o;->w(Z)V

    .line 739
    iput-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    .line 740
    invoke-virtual {p2}, [Lbj8;->clone()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lbj8;

    iput-object p2, p0, Lpyl;->d:Ljava/lang/Object;

    .line 741
    iput-object p3, p0, Lpyl;->e:Ljava/lang/Object;

    .line 742
    iput-object p4, p0, Lpyl;->f:Ljava/lang/Object;

    .line 743
    array-length p1, p1

    iput p1, p0, Lpyl;->b:I

    return-void
.end method

.method public static g(IILjava/lang/String;)V
    .registers 6

    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const/4 v0, 0x0

    filled-new-array {v0}, [I

    move-result-object v1

    const v2, 0x8b81

    invoke-static {p1, v2, v1, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    aget v1, v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1b

    move v0, v2

    :cond_1b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", source: \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v0}, Lfr3;->q(Ljava/lang/String;Z)V

    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    invoke-static {}, Lfr3;->p()V

    return-void
.end method

.method public static i(Landroid/content/Context;Laln;Landroid/view/View;Lagm;II)V
    .registers 14

    new-instance v0, Lo2c;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p5, p5, v2}, Lo2c;-><init>(ZIIZ)V

    invoke-interface {p1, p0, v0}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v3

    new-instance v4, Lvk2;

    const/16 v5, 0x19

    invoke-direct {v4, v5}, Lvk2;-><init>(B)V

    new-instance v6, Lqjn;

    invoke-direct {v6, p3, v3, v4, v0}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    invoke-virtual {v6, p4, p0}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v3

    invoke-interface {p1}, Laln;->a()Z

    move-result v4

    if-eqz v4, :cond_55

    new-instance v4, Lo2c;

    invoke-direct {v4, v1, p5, p5, v1}, Lo2c;-><init>(ZIIZ)V

    invoke-interface {p1, p0, v4}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object p5

    new-instance v7, Lvk2;

    invoke-direct {v7, v5}, Lvk2;-><init>(B)V

    new-instance v5, Lqjn;

    invoke-direct {v5, p3, p5, v7, v4}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    invoke-virtual {v5, p4, p0}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object p3

    new-instance p5, Landroid/graphics/drawable/ClipDrawable;

    const v4, 0x800005

    invoke-direct {p5, p3, v4, v1}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    const/16 p3, 0x1388

    invoke-virtual {p5, p3}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    const/4 p3, 0x2

    new-array p3, p3, [Landroid/graphics/drawable/Drawable;

    aput-object v3, p3, v2

    aput-object p5, p3, v1

    new-instance p5, Ll92;

    invoke-direct {p5, p3, v1}, Ll92;-><init>([Landroid/graphics/drawable/Drawable;B)V

    invoke-virtual {p2, p5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_58

    :cond_55
    invoke-virtual {p2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_58
    invoke-interface {p1, p0, v0}, Laln;->g(Landroid/content/Context;Lo2c;)Lh06;

    move-result-object p1

    const/4 p3, 0x0

    if-eqz p1, :cond_62

    iget-object p1, p1, Lh06;->a:Ljava/lang/String;

    goto :goto_63

    :cond_62
    move-object p1, p3

    :goto_63
    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, v6, Lqjn;->a:Lxkn;

    iget-boolean p1, p1, Lxkn;->g:Z

    if-eqz p1, :cond_70

    const p1, 0x7f060f8c

    goto :goto_73

    :cond_70
    const p1, 0x7f060f8d

    :goto_73
    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-static {p3, p0, p4}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final a(Lg1g;)V
    .registers 39

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    iget-object v3, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v3, Landroid/util/SparseIntArray;

    iget-object v4, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v4, Lbq4;

    iget-object v5, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast v5, Lp7m;

    iget-object v6, v5, Lp7m;->h:Landroid/util/SparseArray;

    iget-object v7, v5, Lp7m;->i:Landroid/util/SparseBooleanArray;

    iget-object v8, v5, Lp7m;->f:Lgl;

    iget-object v9, v5, Lp7m;->c:Ljava/util/List;

    iget-byte v10, v5, Lp7m;->a:B

    invoke-virtual {v1}, Lg1g;->A()I

    move-result v11

    const/4 v12, 0x2

    if-ne v11, v12, :cond_2e3

    const/4 v11, 0x0

    const/4 v13, 0x1

    if-eq v10, v13, :cond_42

    if-eq v10, v12, :cond_42

    iget v14, v5, Lp7m;->n:I

    if-eq v14, v13, :cond_42

    new-instance v14, Lpql;

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lpql;

    invoke-virtual {v15}, Lpql;->d()J

    move-result-wide v12

    invoke-direct {v14, v12, v13}, Lpql;-><init>(J)V

    invoke-interface {v9, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_42
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v14, v9

    check-cast v14, Lpql;

    :goto_49
    invoke-virtual {v1}, Lg1g;->A()I

    move-result v9

    and-int/lit16 v9, v9, 0x80

    if-eqz v9, :cond_2e3

    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Lg1g;->O(I)V

    invoke-virtual {v1}, Lg1g;->H()I

    move-result v9

    const/4 v12, 0x3

    invoke-virtual {v1, v12}, Lg1g;->O(I)V

    iget-object v13, v4, Lbq4;->b:[B

    const/4 v15, 0x2

    invoke-virtual {v1, v13, v11, v15}, Lg1g;->k([BII)V

    invoke-virtual {v4, v11}, Lbq4;->q(I)V

    invoke-virtual {v4, v12}, Lbq4;->t(I)V

    const/16 v13, 0xd

    invoke-virtual {v4, v13}, Lbq4;->i(I)I

    move-result v12

    iput v12, v5, Lp7m;->t:I

    iget-object v12, v4, Lbq4;->b:[B

    invoke-virtual {v1, v12, v11, v15}, Lg1g;->k([BII)V

    invoke-virtual {v4, v11}, Lbq4;->q(I)V

    const/4 v12, 0x4

    invoke-virtual {v4, v12}, Lbq4;->t(I)V

    const/16 v12, 0xc

    invoke-virtual {v4, v12}, Lbq4;->i(I)I

    move-result v13

    invoke-virtual {v1, v13}, Lg1g;->O(I)V

    const/16 v13, 0x2000

    const/16 v12, 0x15

    if-ne v10, v15, :cond_b3

    iget-object v15, v5, Lp7m;->r:Lt7m;

    if-nez v15, :cond_b3

    new-instance v18, Lr7m;

    const/16 v22, 0x0

    sget-object v23, Ltym;->b:[B

    const/16 v19, 0x15

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v23}, Lr7m;-><init>(ILjava/lang/String;ILjava/util/ArrayList;[B)V

    move-object/from16 v15, v18

    invoke-virtual {v8, v12, v15}, Lgl;->a(ILr7m;)Lt7m;

    move-result-object v15

    iput-object v15, v5, Lp7m;->r:Lt7m;

    if-eqz v15, :cond_b3

    iget-object v11, v5, Lp7m;->m:Len8;

    new-instance v0, Ls7m;

    invoke-direct {v0, v9, v12, v13}, Ls7m;-><init>(III)V

    invoke-interface {v15, v14, v11, v0}, Lt7m;->e(Lpql;Len8;Ls7m;)V

    :cond_b3
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->clear()V

    invoke-virtual {v1}, Lg1g;->a()I

    move-result v0

    :goto_bd
    if-lez v0, :cond_25d

    iget-object v11, v4, Lbq4;->b:[B

    const/4 v15, 0x5

    const/4 v13, 0x0

    invoke-virtual {v1, v11, v13, v15}, Lg1g;->k([BII)V

    invoke-virtual {v4, v13}, Lbq4;->q(I)V

    const/16 v11, 0x8

    invoke-virtual {v4, v11}, Lbq4;->i(I)I

    move-result v11

    const/4 v13, 0x3

    invoke-virtual {v4, v13}, Lbq4;->t(I)V

    const/16 v13, 0xd

    invoke-virtual {v4, v13}, Lbq4;->i(I)I

    move-result v12

    const/4 v13, 0x4

    invoke-virtual {v4, v13}, Lbq4;->t(I)V

    const/16 v13, 0xc

    invoke-virtual {v4, v13}, Lbq4;->i(I)I

    move-result v17

    iget v13, v1, Lg1g;->b:I

    add-int v15, v13, v17

    const/16 v23, -0x1

    const/16 v24, 0x0

    move/from16 v26, v23

    move-object/from16 v27, v24

    move-object/from16 v29, v27

    const/16 v28, 0x0

    move/from16 v23, v0

    :goto_f5
    iget v0, v1, Lg1g;->b:I

    if-ge v0, v15, :cond_209

    invoke-virtual {v1}, Lg1g;->A()I

    move-result v0

    invoke-virtual {v1}, Lg1g;->A()I

    move-result v24

    move-object/from16 v31, v4

    iget v4, v1, Lg1g;->b:I

    add-int v4, v4, v24

    if-le v4, v15, :cond_111

    :goto_109
    move-object/from16 v32, v6

    move/from16 v33, v9

    move-object/from16 v16, v14

    goto/16 :goto_20d

    :cond_111
    const/16 v24, 0xac

    const/16 v25, 0x87

    const/16 v30, 0x81

    move-object/from16 v32, v6

    const/4 v6, 0x5

    if-ne v0, v6, :cond_145

    invoke-virtual {v1}, Lg1g;->C()J

    move-result-wide v33

    const-wide/32 v35, 0x41432d33

    cmp-long v0, v33, v35

    if-nez v0, :cond_12a

    move/from16 v26, v30

    goto :goto_17d

    :cond_12a
    const-wide/32 v35, 0x45414333

    cmp-long v0, v33, v35

    if-nez v0, :cond_134

    move/from16 v26, v25

    goto :goto_17d

    :cond_134
    const-wide/32 v35, 0x41432d34

    cmp-long v0, v33, v35

    if-eqz v0, :cond_16d

    const-wide/32 v24, 0x48455643

    cmp-long v0, v33, v24

    if-nez v0, :cond_17d

    const/16 v26, 0x24

    goto :goto_17d

    :cond_145
    const/16 v6, 0x6a

    if-ne v0, v6, :cond_153

    move/from16 v25, v4

    move/from16 v33, v9

    move-object/from16 v16, v14

    move/from16 v26, v30

    goto/16 :goto_1f8

    :cond_153
    const/16 v6, 0x7a

    if-ne v0, v6, :cond_161

    move/from16 v33, v9

    move-object/from16 v16, v14

    move/from16 v26, v25

    move/from16 v25, v4

    goto/16 :goto_1f8

    :cond_161
    const/16 v6, 0x7f

    if-ne v0, v6, :cond_185

    invoke-virtual {v1}, Lg1g;->A()I

    move-result v0

    const/16 v6, 0x15

    if-ne v0, v6, :cond_170

    :cond_16d
    move/from16 v26, v24

    goto :goto_17d

    :cond_170
    const/16 v6, 0xe

    if-ne v0, v6, :cond_177

    const/16 v26, 0x88

    goto :goto_17d

    :cond_177
    const/16 v6, 0x21

    if-ne v0, v6, :cond_17d

    const/16 v26, 0x8b

    :cond_17d
    :goto_17d
    move/from16 v25, v4

    :goto_17f
    move/from16 v33, v9

    move-object/from16 v16, v14

    goto/16 :goto_1f8

    :cond_185
    const/16 v6, 0x7b

    if-ne v0, v6, :cond_18e

    const/16 v0, 0x8a

    move/from16 v26, v0

    goto :goto_17d

    :cond_18e
    const/16 v6, 0xa

    if-ne v0, v6, :cond_1a8

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const/4 v6, 0x3

    invoke-virtual {v1, v6, v0}, Lg1g;->y(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Lg1g;->A()I

    move-result v6

    move-object/from16 v27, v0

    move/from16 v25, v4

    move/from16 v28, v6

    goto :goto_17f

    :cond_1a8
    const/16 v6, 0x59

    if-ne v0, v6, :cond_1ea

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1b1
    iget v6, v1, Lg1g;->b:I

    if-ge v6, v4, :cond_1df

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    move/from16 v25, v4

    const/4 v4, 0x3

    invoke-virtual {v1, v4, v6}, Lg1g;->y(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Lg1g;->A()I

    move-object/from16 v16, v14

    const/4 v4, 0x4

    new-array v14, v4, [B

    move/from16 v33, v9

    const/4 v9, 0x0

    invoke-virtual {v1, v14, v9, v4}, Lg1g;->k([BII)V

    new-instance v9, Lq7m;

    invoke-direct {v9, v6, v14}, Lq7m;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v14, v16

    move/from16 v4, v25

    move/from16 v9, v33

    goto :goto_1b1

    :cond_1df
    move/from16 v25, v4

    move/from16 v33, v9

    move-object/from16 v16, v14

    move-object/from16 v29, v0

    const/16 v26, 0x59

    goto :goto_1f8

    :cond_1ea
    move/from16 v25, v4

    move/from16 v33, v9

    move-object/from16 v16, v14

    const/16 v6, 0x6f

    if-ne v0, v6, :cond_1f8

    const/16 v0, 0x101

    move/from16 v26, v0

    :cond_1f8
    :goto_1f8
    iget v0, v1, Lg1g;->b:I

    sub-int v0, v25, v0

    invoke-virtual {v1, v0}, Lg1g;->O(I)V

    move-object/from16 v14, v16

    move-object/from16 v4, v31

    move-object/from16 v6, v32

    move/from16 v9, v33

    goto/16 :goto_f5

    :cond_209
    move-object/from16 v31, v4

    goto/16 :goto_109

    :goto_20d
    invoke-virtual {v1, v15}, Lg1g;->N(I)V

    new-instance v25, Lr7m;

    iget-object v0, v1, Lg1g;->a:[B

    invoke-static {v0, v13, v15}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v30

    invoke-direct/range {v25 .. v30}, Lr7m;-><init>(ILjava/lang/String;ILjava/util/ArrayList;[B)V

    move-object/from16 v0, v25

    const/4 v6, 0x6

    if-eq v11, v6, :cond_223

    const/4 v6, 0x5

    if-ne v11, v6, :cond_225

    :cond_223
    move/from16 v11, v26

    :cond_225
    add-int/lit8 v17, v17, 0x5

    sub-int v6, v23, v17

    const/4 v15, 0x2

    if-ne v10, v15, :cond_22e

    move v9, v11

    goto :goto_22f

    :cond_22e
    move v9, v12

    :goto_22f
    invoke-virtual {v7, v9}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v13

    if-nez v13, :cond_252

    if-ne v10, v15, :cond_23e

    const/16 v13, 0x15

    if-ne v11, v13, :cond_23e

    iget-object v0, v5, Lp7m;->r:Lt7m;

    goto :goto_242

    :cond_23e
    invoke-virtual {v8, v11, v0}, Lgl;->a(ILr7m;)Lt7m;

    move-result-object v0

    :goto_242
    if-ne v10, v15, :cond_24c

    const/16 v11, 0x2000

    invoke-virtual {v3, v9, v11}, Landroid/util/SparseIntArray;->get(II)I

    move-result v14

    if-ge v12, v14, :cond_252

    :cond_24c
    invoke-virtual {v3, v9, v12}, Landroid/util/SparseIntArray;->put(II)V

    invoke-virtual {v2, v9, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_252
    move v0, v6

    move-object/from16 v14, v16

    move-object/from16 v4, v31

    move-object/from16 v6, v32

    move/from16 v9, v33

    goto/16 :goto_bd

    :cond_25d
    move-object/from16 v32, v6

    move/from16 v33, v9

    move-object/from16 v16, v14

    invoke-virtual {v3}, Landroid/util/SparseIntArray;->size()I

    move-result v0

    const/4 v13, 0x0

    :goto_268
    if-ge v13, v0, :cond_2b2

    invoke-virtual {v3, v13}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v1

    invoke-virtual {v3, v13}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    const/4 v9, 0x1

    invoke-virtual {v7, v1, v9}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object v6, v5, Lp7m;->j:Landroid/util/SparseBooleanArray;

    invoke-virtual {v6, v4, v9}, Landroid/util/SparseBooleanArray;->put(IZ)V

    invoke-virtual {v2, v13}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lt7m;

    if-eqz v6, :cond_2a3

    iget-object v8, v5, Lp7m;->r:Lt7m;

    if-eq v6, v8, :cond_29a

    iget-object v8, v5, Lp7m;->m:Len8;

    new-instance v9, Ls7m;

    move/from16 v11, v33

    const/16 v12, 0x2000

    invoke-direct {v9, v11, v1, v12}, Ls7m;-><init>(III)V

    move-object/from16 v14, v16

    invoke-interface {v6, v14, v8, v9}, Lt7m;->e(Lpql;Len8;Ls7m;)V

    :goto_297
    move-object/from16 v1, v32

    goto :goto_29f

    :cond_29a
    move-object/from16 v14, v16

    move/from16 v11, v33

    goto :goto_297

    :goto_29f
    invoke-virtual {v1, v4, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2a9

    :cond_2a3
    move-object/from16 v14, v16

    move-object/from16 v1, v32

    move/from16 v11, v33

    :goto_2a9
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v32, v1

    move/from16 v33, v11

    move-object/from16 v16, v14

    goto :goto_268

    :cond_2b2
    move-object/from16 v1, v32

    const/4 v15, 0x2

    if-ne v10, v15, :cond_2c7

    iget-boolean v0, v5, Lp7m;->o:Z

    if-nez v0, :cond_2e3

    iget-object v0, v5, Lp7m;->m:Len8;

    invoke-interface {v0}, Len8;->endTracks()V

    const/4 v9, 0x0

    iput v9, v5, Lp7m;->n:I

    const/4 v0, 0x1

    iput-boolean v0, v5, Lp7m;->o:Z

    return-void

    :cond_2c7
    move-object/from16 v2, p0

    const/4 v0, 0x1

    const/4 v9, 0x0

    iget v2, v2, Lpyl;->b:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->remove(I)V

    if-ne v10, v0, :cond_2d4

    move v11, v9

    goto :goto_2d8

    :cond_2d4
    iget v1, v5, Lp7m;->n:I

    add-int/lit8 v11, v1, -0x1

    :goto_2d8
    iput v11, v5, Lp7m;->n:I

    if-nez v11, :cond_2e3

    iget-object v1, v5, Lp7m;->m:Len8;

    invoke-interface {v1}, Len8;->endTracks()V

    iput-boolean v0, v5, Lp7m;->o:Z

    :cond_2e3
    return-void
.end method

.method public final b()V
    .registers 11

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_5
    iget-object v1, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_b8

    monitor-exit v0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lra4;

    const-string v2, "InvokeInternalListeners"

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object v2, v1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_32
    if-ge v4, v2, :cond_5c

    iget-object v5, v1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lowh;

    iget-object v6, v1, Lra4;->e:Ljava/util/List;

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v6

    move v7, v3

    :goto_45
    if-ge v7, v6, :cond_59

    iget-object v8, v1, Lra4;->e:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Livh;

    invoke-interface {v5}, Lowh;->getRequest()Llvh;

    move-result-object v9

    invoke-interface {v8, v9}, Livh;->E(Llvh;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_45

    :cond_59
    add-int/lit8 v4, v4, 0x1

    goto :goto_32

    :cond_5c
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string v2, "InvokeRequestListeners"

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object v2, v1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v4, v3

    :goto_6b
    if-ge v4, v2, :cond_9d

    iget-object v5, v1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lowh;

    invoke-interface {v5}, Lowh;->getRequest()Llvh;

    move-result-object v6

    iget-object v6, v6, Llvh;->d:Ljava/util/List;

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v6

    move v7, v3

    :goto_82
    if-ge v7, v6, :cond_9a

    invoke-interface {v5}, Lowh;->getRequest()Llvh;

    move-result-object v8

    iget-object v8, v8, Llvh;->d:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Livh;

    invoke-interface {v5}, Lowh;->getRequest()Llvh;

    move-result-object v9

    invoke-interface {v8, v9}, Livh;->E(Llvh;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_82

    :cond_9a
    add-int/lit8 v4, v4, 0x1

    goto :goto_6b

    :cond_9d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    goto/16 :goto_19

    :cond_a2
    iget-object p0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p0, Lsa4;

    iget-object v0, p0, Lsa4;->k:Ljava/lang/Object;

    monitor-enter v0

    :try_start_a9
    invoke-virtual {p0}, Lsa4;->toString()Ljava/lang/String;

    iget-object p0, p0, Lsa4;->e:Ljava/lang/Object;

    check-cast p0, Lac4;

    invoke-interface {p0}, Lac4;->O()Z
    :try_end_b3
    .catchall {:try_start_a9 .. :try_end_b3} :catchall_b5

    monitor-exit v0

    return-void

    :catchall_b5
    move-exception p0

    monitor-exit v0

    throw p0

    :catchall_b8
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final c(Ljava/util/Collection;)V
    .registers 3

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrb4;

    invoke-virtual {p0, v0}, Lpyl;->d(Lrb4;)V

    goto :goto_4

    :cond_14
    return-void
.end method

.method public final d(Lrb4;)V
    .registers 3

    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final e(Lpql;Len8;Ls7m;)V
    .registers 4

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Lpyl;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_a
    const/4 v0, 0x0

    if-eqz p1, :cond_13

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p0, p1, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzafo;->b(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z

    move-result v0

    :cond_13
    return v0

    :pswitch_data_14
    .packed-switch 0xf
        :pswitch_a
    .end packed-switch
.end method

.method public final f(Ltj5;)V
    .registers 7

    invoke-interface {p1}, Ltj5;->d()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lan2;

    iget-object v2, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Lfee;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p1, v1}, Ltj5;->i(Lan2;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v3, Lfee;

    invoke-interface {p1, v1}, Ltj5;->h(Lan2;)Lsj5;

    move-result-object v4

    invoke-virtual {v3, v1, v4, v2}, Lfee;->q(Lan2;Lsj5;Ljava/lang/Object;)V

    goto :goto_8

    :cond_2c
    return-void
.end method

.method public final h(ILjava/lang/String;)Ltyj;
    .registers 8

    new-instance v0, Ltyj;

    iget-object v1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget v2, p0, Lpyl;->b:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2, p1}, Ltyj;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    iget p1, p0, Lpyl;->b:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lpyl;->b:I

    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lpyl;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_a
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzafq;->a(Ljava/lang/Object;[Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_data_12
    .packed-switch 0xf
        :pswitch_a
    .end packed-switch
.end method

.method public final j()Lai4;
    .registers 10

    new-instance v0, Lai4;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashSet;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v2, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Lfee;

    invoke-static {v2}, Lwrf;->f(Ltj5;)Lwrf;

    move-result-object v2

    iget v3, p0, Lpyl;->b:I

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Lbfe;

    sget-object v5, Lhbl;->b:Lhbl;

    new-instance v5, Landroid/util/ArrayMap;

    invoke-direct {v5}, Landroid/util/ArrayMap;-><init>()V

    iget-object p0, p0, Lhbl;->a:Landroid/util/ArrayMap;

    invoke-virtual {p0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_33
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_47

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p0, v7}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_47
    new-instance p0, Lhbl;

    invoke-direct {p0, v5}, Lhbl;-><init>(Landroid/util/ArrayMap;)V

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lai4;-><init>(Ljava/util/ArrayList;Lwrf;ILjava/util/ArrayList;Lhbl;)V

    return-object v0
.end method

.method public final k(Ljava/lang/String;)I
    .registers 2

    iget p0, p0, Lpyl;->b:I

    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p0

    invoke-static {p0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    invoke-static {}, Lfr3;->p()V

    return p0
.end method

.method public final l()Ltyj;
    .registers 1

    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltyj;

    return-object p0
.end method

.method public final m()V
    .registers 3

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ld7l;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/LoadingView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/LoadingView;->a(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    return-void
.end method

.method public final n(Lk6l;Lcom/opera/android/LoadingView;Li16;)V
    .registers 6

    iput-object p1, p0, Lpyl;->d:Ljava/lang/Object;

    new-instance v0, Lqz;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, Lpyl;->f:Ljava/lang/Object;

    iput-object p2, p0, Lpyl;->c:Ljava/lang/Object;

    new-instance p0, Ltah;

    invoke-direct {p0, p3}, Ltah;-><init>(Li16;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/LoadingView;->b(Ltah;)V

    return-void
.end method

.method public final o(Lpyl;I)Z
    .registers 5

    iget-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v0, [Lluh;

    aget-object v0, v0, p2

    iget-object v1, p1, Lpyl;->c:Ljava/lang/Object;

    check-cast v1, [Lluh;

    aget-object v1, v1, p2

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p0, [Lbj8;

    aget-object p0, p0, p2

    iget-object p1, p1, Lpyl;->d:Ljava/lang/Object;

    check-cast p1, [Lbj8;

    aget-object p1, p1, p2

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_8

    const-string p1, "Unknown failure"

    :cond_8
    invoke-virtual {p0, p1}, Lpyl;->t(Ljava/lang/String;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 5

    :try_start_0
    iget-boolean p1, p2, Lpzh;->q:Z

    if-eqz p1, :cond_15

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p1, Lb94;

    new-instance v0, Lorh;

    iget-object p0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v0, p0}, Lorh;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lb94;->run(Ljava/lang/Object;)V

    goto :goto_32

    :cond_15
    iget p1, p2, Lpzh;->d:I

    const/16 v0, 0x199

    if-ne p1, v0, :cond_1f

    invoke-virtual {p0, p2}, Lpyl;->q(Lpzh;)V

    goto :goto_32

    :cond_1f
    iget-object p1, p2, Lpzh;->c:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bad response: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpyl;->t(Ljava/lang/String;)V
    :try_end_32
    .catchall {:try_start_0 .. :try_end_32} :catchall_36

    :goto_32
    invoke-virtual {p2}, Lpzh;->close()V

    return-void

    :catchall_36
    move-exception p0

    invoke-virtual {p2}, Lpzh;->close()V

    throw p0
.end method

.method public final p(I)Z
    .registers 2

    iget-object p0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p0, [Lluh;

    aget-object p0, p0, p1

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final q(Lpzh;)V
    .registers 5

    iget-object v0, p1, Lpzh;->g:Lvzh;

    invoke-virtual {v0}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    :try_start_6
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "code"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "token_registered"

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v0, Lb94;

    new-instance v1, Lorh;

    iget-object v2, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Lorh;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :cond_34
    new-instance v0, Lorg/json/JSONException;

    const-string v1, "code is null"

    invoke-direct {v0, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3c
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_3c} :catch_3c

    :catch_3c
    :cond_3c
    iget-object p1, p1, Lpzh;->c:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bad response: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpyl;->t(Ljava/lang/String;)V

    return-void
.end method

.method public final r(Lf65;)V
    .registers 12

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_91

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lo0o;

    iget-object v3, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    iget-object v4, v2, Lo0o;->a:Lm0o;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    iget v4, p0, Lpyl;->b:I

    if-lt v3, v4, :cond_c

    iget-object v3, v2, Lo0o;->a:Lm0o;

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    iget-object v3, v2, Lo0o;->f:Li07;

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    if-nez v3, :cond_46

    new-instance v3, Ln0o;

    invoke-direct {v3, v2, v6, v4}, Ln0o;-><init>(Lo0o;Lmt5;B)V

    invoke-static {p1, v6, v6, v3, v5}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v3

    iput-object v3, v2, Lo0o;->f:Li07;

    :cond_46
    iget-object v2, v2, Lo0o;->c:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_53
    :goto_53
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_72

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Lo0o;

    iget-object v8, v8, Lo0o;->a:Lm0o;

    invoke-virtual {v0, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_53

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_53

    :cond_72
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v7, v4

    :cond_77
    :goto_77
    if-ge v7, v2, :cond_c

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lo0o;

    iget-object v9, v8, Lo0o;->f:Li07;

    if-nez v9, :cond_77

    new-instance v9, Ln0o;

    invoke-direct {v9, v8, v6, v4}, Ln0o;-><init>(Lo0o;Lmt5;B)V

    invoke-static {p1, v6, v6, v9, v5}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v9

    iput-object v9, v8, Lo0o;->f:Li07;

    goto :goto_77

    :cond_91
    return-void
.end method

.method public final s(IZZLjava/lang/String;Lv50;JLjava/lang/Long;)V
    .registers 27

    move-object/from16 v0, p0

    iget-object v1, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    iget-object v2, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lwjh;

    iget-object v3, v2, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lo59;

    if-eqz p2, :cond_2b

    if-eqz v3, :cond_3d

    iget-wide v4, v3, Lo59;->g:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3d

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v6, v2, Lwjh;->f:Ljava/lang/Object;

    check-cast v6, Lo59;

    iget-wide v6, v6, Lo59;->b:J

    sub-long/2addr v4, v6

    iput-wide v4, v3, Lo59;->g:J

    invoke-virtual {v2}, Lwjh;->p()V

    goto :goto_3d

    :cond_2b
    if-eqz v3, :cond_3d

    iget-object v4, v3, Lo59;->o:Lie0;

    if-nez v4, :cond_3d

    if-eqz p3, :cond_36

    sget-object v4, Lie0;->e:Lie0;

    goto :goto_38

    :cond_36
    sget-object v4, Lie0;->f:Lie0;

    :goto_38
    iput-object v4, v3, Lo59;->o:Lie0;

    invoke-virtual {v2}, Lwjh;->p()V

    :cond_3d
    :goto_3d
    move/from16 v2, p1

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v2

    if-ltz v2, :cond_5a

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljp;

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->removeAt(I)V

    iget-object v1, v3, Ljp;->b:Lyo;

    iget-object v8, v3, Ljp;->d:Ljava/lang/String;

    iget-object v7, v3, Ljp;->c:Lq50;

    iget-wide v4, v3, Ljp;->f:J

    sget-object v2, Lyo;->g:Lyo;

    if-ne v1, v2, :cond_5b

    :cond_5a
    return-void

    :cond_5b
    iget-object v2, v0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Lx5f;

    iget-object v6, v3, Ljp;->a:Ljava/lang/String;

    if-eqz p2, :cond_85

    move-object v9, v8

    move-object v8, v7

    invoke-static {v1}, Lyo;->h(Lyo;)Lu50;

    move-result-object v7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    sub-long/2addr v10, v4

    iget-boolean v1, v2, Lx5f;->h:Z

    if-nez v1, :cond_75

    move-wide/from16 v16, v4

    goto :goto_9f

    :cond_75
    move-wide v12, v4

    sget-object v5, Lg60;->b:Lg60;

    move-object/from16 v15, p8

    move-object v4, v2

    move-wide/from16 v16, v12

    move-object/from16 v12, p5

    move-wide/from16 v13, p6

    invoke-virtual/range {v4 .. v15}, Lx5f;->t(Lg60;Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JLv50;JLjava/lang/Long;)V

    goto :goto_9f

    :cond_85
    move-wide/from16 v16, v4

    move-object v5, v6

    move-object v9, v8

    move-object v4, v2

    invoke-static {v1}, Lyo;->h(Lyo;)Lu50;

    move-result-object v6

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sub-long v1, v1, v16

    move/from16 v11, p3

    move-object/from16 v12, p5

    move-object/from16 v13, p8

    move-object v8, v9

    move-wide v9, v1

    invoke-virtual/range {v4 .. v13}, Lx5f;->p(Ljava/lang/String;Lu50;Lq50;Ljava/lang/String;JZLv50;Ljava/lang/Long;)V

    :goto_9f
    if-eqz p2, :cond_a4

    const-string v1, "fill"

    goto :goto_ba

    :cond_a4
    if-eqz p3, :cond_a9

    const-string v1, "no-fill"

    goto :goto_ba

    :cond_a9
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b8

    const-string v1, "error: "

    move-object/from16 v2, p4

    invoke-static {v1, v2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_ba

    :cond_b8
    const-string v1, "error"

    :goto_ba
    iget-object v0, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast v0, Ljec;

    new-instance v2, Lip;

    iget-object v4, v3, Ljp;->a:Ljava/lang/String;

    iget-wide v5, v3, Ljp;->e:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long v7, v7, v16

    add-long/2addr v7, v5

    move-object/from16 p6, v1

    move-object/from16 p0, v2

    move-object/from16 p5, v4

    move-wide/from16 p1, v5

    move-wide/from16 p3, v7

    invoke-direct/range {p0 .. p6}, Lip;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final t(Ljava/lang/String;)V
    .registers 14

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lb94;

    iget v5, p0, Lpyl;->b:I

    const/4 p1, 0x4

    if-ge v5, p1, :cond_3d

    add-int/lit8 p1, v5, 0x1

    const-wide/16 v0, 0x1

    shl-long/2addr v0, p1

    const-wide/16 v2, 0x5

    mul-long v8, v2, v0

    iget-object p1, p0, Lpyl;->e:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lshf;

    iget-object p1, v1, Lshf;->b:Ljava/lang/Object;

    check-cast p1, Lumi;

    iget-object v0, p0, Lpyl;->f:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lfvh;

    iget-object p0, p0, Lpyl;->d:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljava/lang/String;

    new-instance v0, Lvn;

    const/4 v6, 0x2

    invoke-direct/range {v0 .. v6}, Lvn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v6, Loml;

    invoke-direct {v6, p0}, Loml;-><init>(Lnml;)V

    sget-object v10, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v11, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v6 .. v11}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void

    :cond_3d
    new-instance p1, Lnrh;

    iget-object p0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-direct {p1, p0}, Lnrh;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Lb94;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lpyl;->a:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GraphRequestProcessor-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lpyl;->b:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x5
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Lb2l;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/LoadingView;

    iget-boolean v2, v2, Lcom/opera/android/LoadingView;->c:Z

    if-eqz v2, :cond_12

    iget-object v2, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v2, Ld7l;

    if-eq v2, v1, :cond_40d

    :cond_12
    iget v2, v0, Lpyl;->b:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v3, :cond_1b

    move v2, v4

    goto :goto_1c

    :cond_1b
    move v2, v5

    :goto_1c
    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->o0()Z

    move-result v6

    if-nez v6, :cond_30

    if-eqz v2, :cond_2e

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->S()Z

    move-result v2

    if-eqz v2, :cond_30

    :cond_2e
    move v2, v5

    goto :goto_31

    :cond_30
    move v2, v4

    :goto_31
    iget-object v6, v1, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->isLoading()Z

    move-result v6

    if-eqz v6, :cond_40d

    if-eqz v2, :cond_40d

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_40d

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lwqm;->z(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_40d

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->I()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_40d

    iget-object v2, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/LoadingView;

    invoke-virtual {v1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Ld7l;->j:Le7l;

    invoke-interface {v7}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1}, Lb9l;->T()Lp6l;

    move-result-object v8

    iget-object v2, v2, Lcom/opera/android/LoadingView;->a:Ltah;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v9

    if-eqz v9, :cond_80

    invoke-virtual {v9}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    :cond_80
    iput-object v6, v2, Ltah;->b:Ljava/lang/Object;

    iput-object v7, v2, Ltah;->e:Ljava/lang/Object;

    iput-object v8, v2, Ltah;->f:Ljava/lang/Object;

    iget-object v2, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v2, Ld7l;

    if-nez v2, :cond_8e

    move v2, v4

    goto :goto_8f

    :cond_8e
    move v2, v5

    :goto_8f
    iget-object v6, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/LoadingView;

    iget-boolean v7, v6, Lcom/opera/android/LoadingView;->c:Z

    if-nez v7, :cond_40b

    iput-boolean v4, v6, Lcom/opera/android/LoadingView;->c:Z

    iget-object v7, v6, Lcom/opera/android/LoadingView;->a:Ltah;

    iget-object v8, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/LoadingView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070892

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    add-int/2addr v8, v3

    invoke-direct {v9, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v8, 0xd

    invoke-virtual {v9, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v8, v7, Ltah;->g:Ljava/lang/Object;

    check-cast v8, Landroid/widget/FrameLayout;

    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v8, v7, Ltah;->g:Ljava/lang/Object;

    check-cast v8, Landroid/widget/FrameLayout;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-virtual {v8, v9}, Landroid/view/View;->setAlpha(F)V

    iget-object v8, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/LoadingView;

    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v8, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/LoadingView;

    invoke-virtual {v8, v9}, Landroid/view/View;->setAlpha(F)V

    iget-object v8, v7, Ltah;->e:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    const-string v10, "article_id"

    invoke-static {v8, v10}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v10, v7, Ltah;->e:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    const/16 v11, 0x8

    const v13, 0x7f0602c4

    if-eqz v8, :cond_14d

    invoke-static {v10}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v8

    iget-object v10, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/LoadingView;

    const v14, 0x7f0806f8

    if-eqz v8, :cond_111

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v14, v8}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iget-object v10, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/LoadingView;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10, v13}, Landroid/content/Context;->getColor(I)I

    move-result v10

    invoke-static {v8, v10}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_12c

    :cond_111
    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v14, v8}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iget-object v10, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/LoadingView;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v10

    invoke-static {v8, v10}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :goto_12c
    iget-object v10, v7, Ltah;->i:Ljava/lang/Object;

    check-cast v10, Lwmj;

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_148
    :goto_148
    move/from16 p1, v9

    :goto_14a
    const/4 v9, 0x0

    goto/16 :goto_355

    :cond_14d
    invoke-static {v10}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_18e

    iget-object v8, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/LoadingView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const v10, 0x7f0803ec

    invoke-static {v10, v8}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iget-object v10, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v10, Lcom/opera/android/LoadingView;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10, v13}, Landroid/content/Context;->getColor(I)I

    move-result v10

    invoke-static {v8, v10}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    iget-object v10, v7, Ltah;->i:Ljava/lang/Object;

    check-cast v10, Lwmj;

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v10, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v10, Landroid/widget/ImageView;

    invoke-virtual {v10, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_148

    :cond_18e
    iget-object v8, v7, Ltah;->b:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_148

    iget-object v8, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/LoadingView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v10, v7, Ltah;->b:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    iget-object v13, v7, Ltah;->f:Ljava/lang/Object;

    check-cast v13, Lp6l;

    iget-object v14, v7, Ltah;->c:Ljava/lang/Object;

    check-cast v14, Li16;

    sget-object v15, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v8}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v8

    invoke-virtual {v8, v10, v13}, Lnr8;->c(Ljava/lang/String;Lp6l;)Lhq8;

    move-result-object v15

    if-eqz v15, :cond_1c2

    invoke-virtual {v15}, Lhq8;->g()Ljava/lang/String;

    move-result-object v8

    move/from16 p1, v9

    goto/16 :goto_2f6

    :cond_1c2
    iget-object v15, v14, Li16;->c:Ljava/lang/Object;

    check-cast v15, Lcom/opera/android/OperaApplication;

    iget-object v14, v14, Li16;->b:Ljava/lang/Object;

    check-cast v14, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v15}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v15

    iget-object v15, v15, Lmdh;->h:Lh42;

    invoke-virtual {v15}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    if-eqz v15, :cond_1f9

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_1dc
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1f9

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move/from16 p1, v9

    move-object/from16 v9, v16

    check-cast v9, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    invoke-virtual {v9, v13}, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->i(Lp6l;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12, v4, v5}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v12

    if-nez v12, :cond_1fc

    move/from16 v9, p1

    goto :goto_1dc

    :cond_1f9
    move/from16 p1, v9

    const/4 v9, 0x0

    :cond_1fc
    if-eqz v9, :cond_204

    iget-object v8, v9, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object v8, v8, Ltqi;->g:Ljava/lang/String;

    goto/16 :goto_2f6

    :cond_204
    invoke-virtual {v14}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v9

    iget-object v9, v9, Lipk;->a:Lxbf;

    iget-object v9, v9, Lxbf;->b:Ljava/lang/Object;

    check-cast v9, Lode;

    invoke-virtual {v9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_247

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_21a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_247

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Look;

    iget-byte v13, v12, Look;->d:B

    const/4 v15, 0x7

    if-eq v13, v15, :cond_22f

    if-eq v13, v11, :cond_22f

    move v13, v5

    goto :goto_230

    :cond_22f
    move v13, v4

    :goto_230
    iget-object v15, v12, Look;->g:Ljava/lang/String;

    if-nez v13, :cond_21a

    iget-object v13, v12, Look;->c:Ljava/lang/String;

    invoke-static {v13, v10, v5, v5}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v13

    if-nez v13, :cond_244

    iget-object v12, v12, Look;->b:Ljava/lang/String;

    invoke-static {v12, v10, v5, v5}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v12

    if-eqz v12, :cond_21a

    :cond_244
    move-object v8, v15

    goto/16 :goto_2f6

    :cond_247
    invoke-virtual {v14}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v9

    iget-object v9, v9, Lipk;->k:Lxbf;

    iget-object v9, v9, Lxbf;->e:Ljava/lang/Object;

    check-cast v9, Lode;

    invoke-virtual {v9}, Lekc;->g()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_27e

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_25d
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_27e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ll2g;

    iget-object v13, v12, Ll2g;->b:Ljava/lang/String;

    iget-object v14, v12, Ll2g;->f:Ljava/lang/String;

    invoke-static {v13, v10, v4, v5}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v13

    if-nez v13, :cond_27b

    iget-object v12, v12, Ll2g;->c:Ljava/lang/String;

    invoke-static {v12, v10, v4, v5}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v12

    if-eqz v12, :cond_25d

    :cond_27b
    move-object v8, v14

    goto/16 :goto_2f6

    :cond_27e
    sget-object v9, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v10}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_2f5

    new-instance v10, Lei2;

    invoke-direct {v10, v3, v9, v5}, Lei2;-><init>(BLjava/lang/String;Z)V

    check-cast v8, Lcom/opera/android/favorites/e;

    iget-object v12, v8, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v10, v12}, Lnr8;->h(Lei2;Ltq8;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v12

    move v13, v5

    :cond_29c
    if-ge v13, v12, :cond_2b5

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    add-int/lit8 v13, v13, 0x1

    check-cast v14, Lhq8;

    invoke-virtual {v14}, Lhq8;->g()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_29c

    invoke-virtual {v14}, Lhq8;->g()Ljava/lang/String;

    move-result-object v8

    goto :goto_2f6

    :cond_2b5
    sget-object v10, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MvOn9nLK()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz v10, :cond_2c5

    new-instance v12, Lcom/opera/android/favorites/b;

    invoke-direct {v12, v10, v8}, Lcom/opera/android/favorites/b;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Folder;Lcom/opera/android/favorites/e;)V

    goto :goto_2c6

    :cond_2c5
    const/4 v12, 0x0

    :goto_2c6
    if-nez v12, :cond_2ce

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    goto :goto_2d7

    :cond_2ce
    new-instance v8, Lei2;

    invoke-direct {v8, v3, v9, v4}, Lei2;-><init>(BLjava/lang/String;Z)V

    invoke-static {v8, v12}, Lnr8;->h(Lei2;Ltq8;)Ljava/util/ArrayList;

    move-result-object v8

    :goto_2d7
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    move v10, v5

    :cond_2dc
    if-ge v10, v9, :cond_2f5

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v10, v10, 0x1

    check-cast v12, Lhq8;

    invoke-virtual {v12}, Lhq8;->g()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_2dc

    invoke-virtual {v12}, Lhq8;->g()Ljava/lang/String;

    move-result-object v8

    goto :goto_2f6

    :cond_2f5
    const/4 v8, 0x0

    :goto_2f6
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    iget-object v10, v7, Ltah;->b:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    if-nez v9, :cond_33b

    iget-object v9, v7, Ltah;->i:Ljava/lang/Object;

    check-cast v9, Lwmj;

    invoke-virtual {v9, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v9, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v9, Landroid/widget/ImageView;

    invoke-virtual {v9, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    iget-object v9, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v9, Landroid/widget/ImageView;

    invoke-virtual {v9, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v9, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v9, Landroid/widget/ImageView;

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v5, v8}, Lqbe;->G(Landroid/content/Context;ILjava/lang/String;)Ldwh;

    move-result-object v8

    iget-object v9, v7, Ltah;->k:Ljava/lang/Object;

    check-cast v9, Le3g;

    new-instance v11, Lq2g;

    const/16 v12, 0x10

    invoke-direct {v11, v7, v10, v12}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v10, Lyne;->b:Ldeg;

    invoke-virtual {v10, v9}, Ldeg;->a(Ljava/lang/Object;)V

    iput-object v11, v9, Le3g;->c:Ljava/lang/Object;

    invoke-virtual {v8, v9}, Ldwh;->f(Lacl;)V

    goto/16 :goto_14a

    :cond_33b
    iget-object v8, v7, Ltah;->h:Ljava/lang/Object;

    check-cast v8, Landroid/widget/ImageView;

    invoke-virtual {v8, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v8, v7, Ltah;->i:Ljava/lang/Object;

    check-cast v8, Lwmj;

    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v8, v7, Ltah;->i:Ljava/lang/Object;

    check-cast v8, Lwmj;

    iput-object v10, v8, Lwmj;->a:Ljava/lang/String;

    const/4 v9, 0x0

    iput-object v9, v8, Lwmj;->b:Lvmj;

    invoke-virtual {v8}, Landroid/view/View;->requestLayout()V

    :goto_355
    iget-object v8, v7, Ltah;->j:Ljava/lang/Object;

    check-cast v8, Landroid/animation/AnimatorSet;

    if-eqz v8, :cond_360

    invoke-virtual {v8}, Landroid/animation/AnimatorSet;->cancel()V

    iput-object v9, v7, Ltah;->j:Ljava/lang/Object;

    :cond_360
    iget-object v8, v7, Ltah;->g:Ljava/lang/Object;

    check-cast v8, Landroid/widget/FrameLayout;

    new-array v10, v3, [F

    fill-array-data v10, :array_40e

    const-string v11, "alpha"

    invoke-static {v8, v11, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v8

    iget-object v10, v7, Ltah;->g:Ljava/lang/Object;

    check-cast v10, Landroid/widget/FrameLayout;

    new-array v12, v3, [F

    fill-array-data v12, :array_416

    const-string v13, "scaleX"

    invoke-static {v10, v13, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    iget-object v12, v7, Ltah;->g:Ljava/lang/Object;

    check-cast v12, Landroid/widget/FrameLayout;

    new-array v13, v3, [F

    fill-array-data v13, :array_41e

    const-string v14, "scaleY"

    invoke-static {v12, v14, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v12

    iget-object v13, v7, Ltah;->d:Ljava/lang/Object;

    check-cast v13, Lcom/opera/android/LoadingView;

    if-eqz v2, :cond_395

    const/4 v2, 0x0

    goto :goto_397

    :cond_395
    move/from16 v2, p1

    :goto_397
    new-array v14, v3, [F

    aput v2, v14, v5

    aput p1, v14, v4

    invoke-static {v13, v11, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v13, 0x488

    invoke-virtual {v8, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {v10, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    invoke-virtual {v12, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v11, -0x1

    invoke-virtual {v8, v11}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    invoke-virtual {v10, v11}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    invoke-virtual {v12, v11}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    sget-object v11, Ltah;->l:Lalb;

    invoke-virtual {v8, v11}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v10, v11}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v12, v11}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget-object v11, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v2, v11}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v13, 0x64

    invoke-virtual {v2, v13, v14}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v11, Landroid/animation/AnimatorSet;

    invoke-direct {v11}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v11, v7, Ltah;->j:Ljava/lang/Object;

    const/4 v13, 0x4

    new-array v13, v13, [Landroid/animation/Animator;

    aput-object v8, v13, v5

    aput-object v10, v13, v4

    aput-object v12, v13, v3

    const/4 v3, 0x3

    aput-object v2, v13, v3

    invoke-virtual {v11, v13}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v2, v7, Ltah;->j:Ljava/lang/Object;

    check-cast v2, Landroid/animation/AnimatorSet;

    new-instance v3, Lin8;

    invoke-direct {v3, v7}, Lin8;-><init>(Ltah;)V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v2, v7, Ltah;->j:Ljava/lang/Object;

    check-cast v2, Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    iget-object v2, v6, Lcom/opera/android/LoadingView;->b:Llv3;

    if-eqz v2, :cond_40b

    iget-object v2, v2, Llv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v2, v2, Lcom/opera/android/BrowserActivity;->T:Ld5k;

    if-nez v2, :cond_400

    move-object v12, v9

    goto :goto_401

    :cond_400
    move-object v12, v2

    :goto_401
    iget-object v2, v12, Ld5k;->b:Lm4k;

    invoke-virtual {v2}, Ln1;->T()V

    iget-object v2, v12, Ld5k;->c:Lm4k;

    invoke-virtual {v2}, Ln1;->T()V

    :cond_40b
    iput-object v1, v0, Lpyl;->e:Ljava/lang/Object;

    :cond_40d
    return-void

    :array_40e
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    :array_416
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    :array_41e
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final v()Lkotlin/Unit;
    .registers 2

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    iget-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v0, Laf2;

    invoke-virtual {v0}, Laf2;->a()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object p0, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p0, Lsa4;

    invoke-virtual {p0}, Lsa4;->e()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object v0, Lpx5;->a:Lpx5;

    return-object p0

    :cond_19
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final w(ZLjava/util/List;Lu9d;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)Z
    .registers 17

    iget-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v0, Laf2;

    invoke-virtual {v0}, Laf2;->b()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    return v1

    :cond_12
    const-string v0, "CXCP#buildCaptureSequence"

    :try_start_14
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object v0, p0, Lpyl;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lsa4;

    iget-object v0, p0, Lpyl;->f:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lxm5;

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v9, p6

    invoke-virtual/range {v2 .. v9}, Lsa4;->a(ZLjava/util/List;Lu9d;Ljava/util/Map;Ljava/util/Map;Lxm5;Ljava/util/List;)Lra4;

    move-result-object p1
    :try_end_2c
    .catchall {:try_start_14 .. :try_end_2c} :catchall_46c

    invoke-static {}, Landroid/os/Trace;->endSection()V

    const/4 p3, 0x1

    if-nez p1, :cond_c8

    move-object p1, p2

    check-cast p1, Ljava/lang/Iterable;

    instance-of p4, p1, Ljava/util/Collection;

    if-eqz p4, :cond_42

    move-object p4, p1

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_c1

    :cond_42
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_46
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_c1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Llvh;

    iget-object p4, p4, Llvh;->f:Lf9b;

    if-eqz p4, :cond_46

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_5a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_c0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llvh;

    iget-object p2, p1, Llvh;->f:Lf9b;

    if-eqz p2, :cond_aa

    iget-object p2, p2, Lf9b;->a:Li71;

    instance-of p4, p2, Ljava/lang/AutoCloseable;

    if-eqz p4, :cond_74

    invoke-virtual {p2}, Li71;->close()V

    goto :goto_aa

    :cond_74
    instance-of p4, p2, Ljava/util/concurrent/ExecutorService;

    if-eqz p4, :cond_a6

    check-cast p2, Ljava/util/concurrent/ExecutorService;

    invoke-static {}, Ljava/util/concurrent/ForkJoinPool;->commonPool()Ljava/util/concurrent/ForkJoinPool;

    move-result-object p4

    if-eq p2, p4, :cond_aa

    invoke-interface {p2}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result p4

    if-nez p4, :cond_aa

    invoke-interface {p2}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    move v0, v1

    :cond_8a
    :goto_8a
    if-nez p4, :cond_9c

    :try_start_8c
    sget-object v2, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    invoke-interface {p2, v3, v4, v2}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result p4
    :try_end_94
    .catch Ljava/lang/InterruptedException; {:try_start_8c .. :try_end_94} :catch_95

    goto :goto_8a

    :catch_95
    if-nez v0, :cond_8a

    invoke-interface {p2}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    move v0, p3

    goto :goto_8a

    :cond_9c
    if-eqz v0, :cond_aa

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_aa

    :cond_a6
    invoke-static {}, Lhai;->d()V

    return v1

    :cond_aa
    :goto_aa
    iget-object p2, p1, Llvh;->d:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_b0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_5a

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Livh;

    invoke-interface {p4, p1}, Livh;->E(Llvh;)V

    goto :goto_b0

    :cond_c0
    return p3

    :cond_c1
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    return v1

    :cond_c8
    iget-object p4, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p4, Laf2;

    invoke-virtual {p4}, Laf2;->b()Z

    move-result p4

    if-eqz p4, :cond_d9

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    return v1

    :cond_d9
    iget-boolean p2, p1, Lra4;->b:Z

    if-nez p2, :cond_ef

    iget-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    monitor-enter p2

    :try_start_e2
    iget-object p4, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p4, Ljava/util/ArrayList;

    invoke-virtual {p4, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e9
    .catchall {:try_start_e2 .. :try_end_e9} :catchall_eb

    monitor-exit p2

    goto :goto_ef

    :catchall_eb
    move-exception v0

    move-object p0, v0

    monitor-exit p2

    throw p0

    :cond_ef
    :goto_ef
    :try_start_ef
    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    invoke-virtual {p1}, Lra4;->toString()Ljava/lang/String;

    const-string p2, "InvokeInternalListeners"

    invoke-static {p2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p2, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    move p4, v1

    :goto_101
    if-ge p4, p2, :cond_127

    iget-object v0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowh;

    iget-object v2, p1, Lra4;->e:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_114
    if-ge v3, v2, :cond_124

    iget-object v4, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Livh;

    invoke-interface {v4, v0}, Livh;->o(Lowh;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_114

    :cond_124
    add-int/lit8 p4, p4, 0x1

    goto :goto_101

    :cond_127
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p2, "InvokeRequestListeners"

    invoke-static {p2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p2, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    move p4, v1

    :goto_136
    if-ge p4, p2, :cond_164

    iget-object v0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowh;

    invoke-interface {v0}, Lowh;->getRequest()Llvh;

    move-result-object v2

    iget-object v2, v2, Llvh;->d:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_14d
    if-ge v3, v2, :cond_161

    invoke-interface {v0}, Lowh;->getRequest()Llvh;

    move-result-object v4

    iget-object v4, v4, Llvh;->d:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Livh;

    invoke-interface {v4, v0}, Livh;->o(Lowh;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_14d

    :cond_161
    add-int/lit8 p4, p4, 0x1

    goto :goto_136

    :cond_164
    invoke-static {}, Landroid/os/Trace;->endSection()V

    monitor-enter p1
    :try_end_168
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_ef .. :try_end_168} :catch_3db
    .catchall {:try_start_ef .. :try_end_168} :catchall_345

    :try_start_168
    iget-object p2, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast p2, Laf2;

    invoke-virtual {p2}, Laf2;->b()Z

    move-result p2

    if-eqz p2, :cond_205

    invoke-virtual {p1}, Lra4;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;
    :try_end_178
    .catchall {:try_start_168 .. :try_end_178} :catchall_341

    :try_start_178
    monitor-exit p1
    :try_end_179
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_178 .. :try_end_179} :catch_3db
    .catchall {:try_start_178 .. :try_end_179} :catchall_345

    iget-boolean p2, p1, Lra4;->b:Z

    if-nez p2, :cond_46b

    iget-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    monitor-enter p2

    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit p2

    const-string p0, "InvokeInternalListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_196
    if-ge p2, p0, :cond_1c0

    iget-object p3, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lowh;

    iget-object p4, p1, Lra4;->e:Ljava/util/List;

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result p4

    move v0, v1

    :goto_1a9
    if-ge v0, p4, :cond_1bd

    iget-object v2, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Livh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v3

    invoke-interface {v2, v3}, Livh;->E(Llvh;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a9

    :cond_1bd
    add-int/lit8 p2, p2, 0x1

    goto :goto_196

    :cond_1c0
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p0, "InvokeRequestListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_1cf
    if-ge p2, p0, :cond_201

    iget-object p3, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lowh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object p4

    iget-object p4, p4, Llvh;->d:Ljava/util/List;

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result p4

    move v0, v1

    :goto_1e6
    if-ge v0, p4, :cond_1fe

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v2

    iget-object v2, v2, Llvh;->d:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Livh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v3

    invoke-interface {v2, v3}, Livh;->E(Llvh;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1e6

    :cond_1fe
    add-int/lit8 p2, p2, 0x1

    goto :goto_1cf

    :cond_201
    invoke-static {}, Landroid/os/Trace;->endSection()V

    return v1

    :cond_205
    :try_start_205
    const-string p2, "CXCP#submit(CaptureSequence)"
    :try_end_207
    .catchall {:try_start_205 .. :try_end_207} :catchall_341

    :try_start_207
    invoke-static {p2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p2, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p2, Lsa4;

    invoke-virtual {p2, p1}, Lsa4;->h(Lra4;)Ljava/lang/Integer;

    move-result-object p2

    const/4 p4, -0x1

    if-eqz p2, :cond_21a

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_21b

    :cond_21a
    move p2, p4

    :goto_21b
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Lra4;->m:Ljava/lang/Integer;
    :try_end_221
    .catchall {:try_start_207 .. :try_end_221} :catchall_33b

    :try_start_221
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_224
    .catchall {:try_start_221 .. :try_end_224} :catchall_341

    :try_start_224
    monitor-exit p1

    if-eq p2, p4, :cond_2a5

    const-string p2, "InvokeInternalListeners"

    invoke-static {p2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p2, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    move p4, v1

    :goto_233
    if-ge p4, p2, :cond_259

    iget-object v0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowh;

    iget-object v2, p1, Lra4;->e:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_246
    if-ge v3, v2, :cond_256

    iget-object v4, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Livh;

    invoke-interface {v4, v0}, Livh;->m(Lowh;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_246

    :cond_256
    add-int/lit8 p4, p4, 0x1

    goto :goto_233

    :cond_259
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p2, "InvokeRequestListeners"

    invoke-static {p2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p2, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    move p4, v1

    :goto_268
    if-ge p4, p2, :cond_296

    iget-object v0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lowh;

    invoke-interface {v0}, Lowh;->getRequest()Llvh;

    move-result-object v2

    iget-object v2, v2, Llvh;->d:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v1

    :goto_27f
    if-ge v3, v2, :cond_293

    invoke-interface {v0}, Lowh;->getRequest()Llvh;

    move-result-object v4

    iget-object v4, v4, Llvh;->d:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Livh;

    invoke-interface {v4, v0}, Livh;->m(Lowh;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_27f

    :cond_293
    add-int/lit8 p4, p4, 0x1

    goto :goto_268

    :cond_296
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_299
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_224 .. :try_end_299} :catch_3db
    .catchall {:try_start_224 .. :try_end_299} :catchall_345

    :try_start_299
    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;

    invoke-virtual {p1}, Lra4;->toString()Ljava/lang/String;
    :try_end_29f
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_299 .. :try_end_29f} :catch_46b
    .catchall {:try_start_299 .. :try_end_29f} :catchall_2a1

    move p2, p3

    goto :goto_2ad

    :catchall_2a1
    move-exception v0

    move-object p2, v0

    goto/16 :goto_348

    :cond_2a5
    :try_start_2a5
    invoke-virtual {p1}, Lra4;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Lpyl;->toString()Ljava/lang/String;
    :try_end_2ab
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2a5 .. :try_end_2ab} :catch_3db
    .catchall {:try_start_2a5 .. :try_end_2ab} :catchall_345

    move p2, v1

    move p3, p2

    :goto_2ad
    if-nez p2, :cond_33a

    iget-boolean p2, p1, Lra4;->b:Z

    if-nez p2, :cond_33a

    iget-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    monitor-enter p2

    :try_start_2b8
    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_2bf
    .catchall {:try_start_2b8 .. :try_end_2bf} :catchall_467

    monitor-exit p2

    const-string p0, "InvokeInternalListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_2cc
    if-ge p2, p0, :cond_2f6

    iget-object p4, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lowh;

    iget-object v0, p1, Lra4;->e:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    move v2, v1

    :goto_2df
    if-ge v2, v0, :cond_2f3

    iget-object v3, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Livh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v4

    invoke-interface {v3, v4}, Livh;->E(Llvh;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2df

    :cond_2f3
    add-int/lit8 p2, p2, 0x1

    goto :goto_2cc

    :cond_2f6
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p0, "InvokeRequestListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_305
    if-ge p2, p0, :cond_337

    iget-object p4, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lowh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v0

    iget-object v0, v0, Llvh;->d:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    move v2, v1

    :goto_31c
    if-ge v2, v0, :cond_334

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v3

    iget-object v3, v3, Llvh;->d:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Livh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v4

    invoke-interface {v3, v4}, Livh;->E(Llvh;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_31c

    :cond_334
    add-int/lit8 p2, p2, 0x1

    goto :goto_305

    :cond_337
    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_33a
    return p3

    :catchall_33b
    move-exception v0

    move-object p2, v0

    :try_start_33d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p2
    :try_end_341
    .catchall {:try_start_33d .. :try_end_341} :catchall_341

    :catchall_341
    move-exception v0

    move-object p2, v0

    :try_start_343
    monitor-exit p1

    throw p2
    :try_end_345
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_343 .. :try_end_345} :catch_3db
    .catchall {:try_start_343 .. :try_end_345} :catchall_345

    :catchall_345
    move-exception v0

    move-object p2, v0

    move p3, v1

    :goto_348
    if-nez p3, :cond_3da

    iget-boolean p3, p1, Lra4;->b:Z

    if-nez p3, :cond_3da

    iget-object p3, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    monitor-enter p3

    :try_start_353
    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_35a
    .catchall {:try_start_353 .. :try_end_35a} :catchall_3d6

    monitor-exit p3

    const-string p0, "InvokeInternalListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p3, v1

    :goto_367
    if-ge p3, p0, :cond_391

    iget-object p4, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lowh;

    iget-object v0, p1, Lra4;->e:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    move v2, v1

    :goto_37a
    if-ge v2, v0, :cond_38e

    iget-object v3, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Livh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v4

    invoke-interface {v3, v4}, Livh;->E(Llvh;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_37a

    :cond_38e
    add-int/lit8 p3, p3, 0x1

    goto :goto_367

    :cond_391
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p0, "InvokeRequestListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p3, v1

    :goto_3a0
    if-ge p3, p0, :cond_3d2

    iget-object p4, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lowh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v0

    iget-object v0, v0, Llvh;->d:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    move v2, v1

    :goto_3b7
    if-ge v2, v0, :cond_3cf

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v3

    iget-object v3, v3, Llvh;->d:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Livh;

    invoke-interface {p4}, Lowh;->getRequest()Llvh;

    move-result-object v4

    invoke-interface {v3, v4}, Livh;->E(Llvh;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3b7

    :cond_3cf
    add-int/lit8 p3, p3, 0x1

    goto :goto_3a0

    :cond_3d2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    goto :goto_3da

    :catchall_3d6
    move-exception v0

    move-object p0, v0

    monitor-exit p3

    throw p0

    :cond_3da
    :goto_3da
    throw p2

    :catch_3db
    iget-boolean p2, p1, Lra4;->b:Z

    if-nez p2, :cond_46b

    iget-object p2, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    monitor-enter p2

    :try_start_3e4
    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_3eb
    .catchall {:try_start_3e4 .. :try_end_3eb} :catchall_467

    monitor-exit p2

    const-string p0, "InvokeInternalListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_3f8
    if-ge p2, p0, :cond_422

    iget-object p3, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lowh;

    iget-object p4, p1, Lra4;->e:Ljava/util/List;

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result p4

    move v0, v1

    :goto_40b
    if-ge v0, p4, :cond_41f

    iget-object v2, p1, Lra4;->e:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Livh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v3

    invoke-interface {v2, v3}, Livh;->E(Llvh;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_40b

    :cond_41f
    add-int/lit8 p2, p2, 0x1

    goto :goto_3f8

    :cond_422
    invoke-static {}, Landroid/os/Trace;->endSection()V

    const-string p0, "InvokeRequestListeners"

    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object p0, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    move p2, v1

    :goto_431
    if-ge p2, p0, :cond_463

    iget-object p3, p1, Lra4;->d:Ljava/util/ArrayList;

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lowh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object p4

    iget-object p4, p4, Llvh;->d:Ljava/util/List;

    check-cast p4, Ljava/util/Collection;

    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result p4

    move v0, v1

    :goto_448
    if-ge v0, p4, :cond_460

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v2

    iget-object v2, v2, Llvh;->d:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Livh;

    invoke-interface {p3}, Lowh;->getRequest()Llvh;

    move-result-object v3

    invoke-interface {v2, v3}, Livh;->E(Llvh;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_448

    :cond_460
    add-int/lit8 p2, p2, 0x1

    goto :goto_431

    :cond_463
    invoke-static {}, Landroid/os/Trace;->endSection()V

    goto :goto_46b

    :catchall_467
    move-exception v0

    move-object p0, v0

    monitor-exit p2

    throw p0

    :catch_46b
    :cond_46b
    :goto_46b
    return v1

    :catchall_46c
    move-exception v0

    move-object p0, v0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw p0
.end method

.method public final x(I)V
    .registers 10

    iget-object v0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast v0, [I

    aget v1, v0, p1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const/4 v1, 0x1

    aput v1, v0, p1

    iget-object v1, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v1, [[Lo4a;

    aget-object v1, v1, p1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_14
    if-ge v3, v2, :cond_2e

    aget-object v4, v1, v3

    iget-object v5, v4, Lo4a;->a:Ls4a;

    iget v5, v5, Ls4a;->b:I

    invoke-virtual {p0, v5}, Lpyl;->x(I)V

    iget-object v5, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast v5, [Lo4a;

    iget v6, p0, Lpyl;->b:I

    add-int/lit8 v7, v6, -0x1

    iput v7, p0, Lpyl;->b:I

    aput-object v4, v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    :cond_2e
    const/4 p0, 0x2

    aput p0, v0, p1

    return-void
.end method
