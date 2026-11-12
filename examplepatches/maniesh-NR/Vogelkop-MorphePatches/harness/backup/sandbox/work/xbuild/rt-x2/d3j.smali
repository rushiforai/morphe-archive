.class public final Ld3j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lffd;


# instance fields
.field public final a:Landroid/util/SparseArray;

.field public final b:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld3j;->a:Landroid/util/SparseArray;

    iput-object p2, p0, Ld3j;->b:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public final a([I)Ljava/util/ArrayList;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_7
    array-length v2, p1

    if-ge v1, v2, :cond_1c

    iget-object v2, p0, Ld3j;->a:Landroid/util/SparseArray;

    aget v3, p1, v1

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1c
    return-object v0
.end method

.method public final b(I)Lqsh;
    .registers 4

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_30

    throw v0

    :pswitch_5
    const/16 p1, 0x36

    goto :goto_16

    :pswitch_8
    const/16 p1, 0x26

    goto :goto_16

    :pswitch_b
    const/16 p1, 0x19

    goto :goto_16

    :pswitch_e
    const/16 p1, 0x14

    goto :goto_16

    :pswitch_11
    const/16 p1, 0xb

    goto :goto_16

    :pswitch_14
    const/16 p1, 0x8

    :goto_16
    iget-object v1, p0, Ld3j;->b:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb3j;

    if-nez p1, :cond_21

    return-object v0

    :cond_21
    new-instance v0, Lqsh;

    iget-object v1, p1, Lb3j;->b:Ljava/lang/String;

    iget-object p1, p1, Lb3j;->c:[I

    invoke-virtual {p0, p1}, Ld3j;->a([I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lqsh;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v0

    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public final c(I)Lc3j;
    .registers 5

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_4c

    throw v0

    :pswitch_5
    const/16 p1, 0x35

    goto :goto_1c

    :pswitch_8
    const/16 p1, 0x31

    goto :goto_1c

    :pswitch_b
    const/16 p1, 0x2d

    goto :goto_1c

    :pswitch_e
    const/16 p1, 0x2a

    goto :goto_1c

    :pswitch_11
    const/16 p1, 0x23

    goto :goto_1c

    :pswitch_14
    const/16 p1, 0x18

    goto :goto_1c

    :pswitch_17
    const/16 p1, 0x10

    goto :goto_1c

    :pswitch_1a
    const/16 p1, 0xf

    :goto_1c
    iget-object v1, p0, Ld3j;->b:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb3j;

    if-eqz p1, :cond_4b

    iget-object v1, p1, Lb3j;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4b

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4b

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4b

    new-instance v0, Lc3j;

    iget-object v2, p1, Lb3j;->b:Ljava/lang/String;

    iget-object p1, p1, Lb3j;->c:[I

    invoke-virtual {p0, p1}, Ld3j;->a([I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-direct {v0, v1, v2, p0}, Lc3j;-><init>(Ljava/lang/Comparable;Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_4b
    return-object v0

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public final d(IZ)Lc3j;
    .registers 9

    const/16 v0, 0x2f

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_da

    throw v1

    :pswitch_7
    const/16 p1, 0x3d

    goto/16 :goto_97

    :pswitch_b
    const/16 p1, 0x3c

    goto/16 :goto_97

    :pswitch_f
    const/16 p1, 0x3b

    goto/16 :goto_97

    :pswitch_13
    const/16 p1, 0x3a

    goto/16 :goto_97

    :pswitch_17
    const/16 p1, 0x39

    goto/16 :goto_97

    :pswitch_1b
    const/16 p1, 0x38

    goto/16 :goto_97

    :pswitch_1f
    const/16 p1, 0x37

    goto/16 :goto_97

    :pswitch_23
    const/16 p1, 0x33

    goto/16 :goto_97

    :pswitch_27
    const/16 p1, 0x32

    goto/16 :goto_97

    :pswitch_2b
    const/16 p1, 0x30

    goto/16 :goto_97

    :pswitch_2f
    move p1, v0

    goto/16 :goto_97

    :pswitch_32
    const/16 p1, 0x2e

    goto/16 :goto_97

    :pswitch_36
    const/16 p1, 0x2c

    goto/16 :goto_97

    :pswitch_3a
    const/16 p1, 0x2b

    goto/16 :goto_97

    :pswitch_3e
    const/16 p1, 0x29

    goto/16 :goto_97

    :pswitch_42
    const/16 p1, 0x27

    goto/16 :goto_97

    :pswitch_46
    const/16 p1, 0x25

    goto/16 :goto_97

    :pswitch_4a
    const/16 p1, 0x24

    goto/16 :goto_97

    :pswitch_4e
    const/16 p1, 0x22

    goto :goto_97

    :pswitch_51
    const/16 p1, 0x21

    goto :goto_97

    :pswitch_54
    const/16 p1, 0x20

    goto :goto_97

    :pswitch_57
    const/16 p1, 0x1f

    goto :goto_97

    :pswitch_5a
    const/16 p1, 0x1e

    goto :goto_97

    :pswitch_5d
    const/16 p1, 0x1d

    goto :goto_97

    :pswitch_60
    const/16 p1, 0x1c

    goto :goto_97

    :pswitch_63
    const/16 p1, 0x1b

    goto :goto_97

    :pswitch_66
    const/16 p1, 0x1a

    goto :goto_97

    :pswitch_69
    const/16 p1, 0x17

    goto :goto_97

    :pswitch_6c
    const/16 p1, 0x16

    goto :goto_97

    :pswitch_6f
    const/16 p1, 0x15

    goto :goto_97

    :pswitch_72
    const/16 p1, 0x13

    goto :goto_97

    :pswitch_75
    const/16 p1, 0x12

    goto :goto_97

    :pswitch_78
    const/16 p1, 0x11

    goto :goto_97

    :pswitch_7b
    const/16 p1, 0xe

    goto :goto_97

    :pswitch_7e
    const/16 p1, 0xd

    goto :goto_97

    :pswitch_81
    const/16 p1, 0xc

    goto :goto_97

    :pswitch_84
    const/16 p1, 0xa

    goto :goto_97

    :pswitch_87
    const/16 p1, 0x9

    goto :goto_97

    :pswitch_8a
    const/4 p1, 0x7

    goto :goto_97

    :pswitch_8c
    const/4 p1, 0x6

    goto :goto_97

    :pswitch_8e
    const/4 p1, 0x5

    goto :goto_97

    :pswitch_90
    const/4 p1, 0x4

    goto :goto_97

    :pswitch_92
    const/4 p1, 0x3

    goto :goto_97

    :pswitch_94
    const/4 p1, 0x2

    goto :goto_97

    :pswitch_96
    const/4 p1, 0x1

    :goto_97
    iget-object v2, p0, Ld3j;->b:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb3j;

    if-eqz p1, :cond_d8

    iget-object v2, p1, Lb3j;->c:[I

    iget-object v3, p1, Lb3j;->b:Ljava/lang/String;

    iget-object p1, p1, Lb3j;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    const-string v5, ""

    if-eqz v4, :cond_bb

    if-eqz p2, :cond_d8

    new-instance p1, Lc3j;

    invoke-virtual {p0, v2}, Ld3j;->a([I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-direct {p1, v5, v3, p0}, Lc3j;-><init>(Ljava/lang/Comparable;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object p1

    :cond_bb
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v4, -0x1

    if-ne v0, v4, :cond_cc

    new-instance p2, Lc3j;

    invoke-virtual {p0, v2}, Ld3j;->a([I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-direct {p2, p1, v3, p0}, Lc3j;-><init>(Ljava/lang/Comparable;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object p2

    :cond_cc
    if-eqz p2, :cond_d8

    new-instance p1, Lc3j;

    invoke-virtual {p0, v2}, Ld3j;->a([I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-direct {p1, v5, v3, p0}, Lc3j;-><init>(Ljava/lang/Comparable;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object p1

    :cond_d8
    return-object v1

    nop

    :pswitch_data_da
    .packed-switch 0x1
        :pswitch_96
        :pswitch_94
        :pswitch_92
        :pswitch_90
        :pswitch_8e
        :pswitch_8c
        :pswitch_8a
        :pswitch_87
        :pswitch_84
        :pswitch_81
        :pswitch_7e
        :pswitch_7b
        :pswitch_78
        :pswitch_75
        :pswitch_72
        :pswitch_6f
        :pswitch_6c
        :pswitch_69
        :pswitch_66
        :pswitch_63
        :pswitch_60
        :pswitch_5d
        :pswitch_5a
        :pswitch_57
        :pswitch_54
        :pswitch_51
        :pswitch_4e
        :pswitch_4a
        :pswitch_46
        :pswitch_42
        :pswitch_3e
        :pswitch_3a
        :pswitch_36
        :pswitch_32
        :pswitch_2f
        :pswitch_2b
        :pswitch_27
        :pswitch_23
        :pswitch_1f
        :pswitch_1b
        :pswitch_17
        :pswitch_13
        :pswitch_f
        :pswitch_b
        :pswitch_7
    .end packed-switch
.end method

.method public final isEmpty()Z
    .registers 1

    iget-object p0, p0, Ld3j;->b:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
