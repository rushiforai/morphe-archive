.class public final Lyx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzx3;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyx3;->a:Ljava/lang/String;

    iput-boolean p2, p0, Lyx3;->b:Z

    return-void
.end method


# virtual methods
.method public final a(Lay3;Leri;Lzpa;Lsk6;Lp6l;)Llsc;
    .registers 20

    iget-object v1, p0, Lyx3;->a:Ljava/lang/String;

    iget-boolean p0, p0, Lyx3;->b:Z

    iget-byte v2, p1, Lay3;->o:B

    iget-object v3, p1, Lay3;->a:Llqm;

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v4

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v4, :cond_81

    invoke-static {v1}, Lwqm;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_81

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v10

    const-string v11, "ads-debug"

    const-string v12, "tester"

    const/4 v13, -0x1

    sparse-switch v10, :sswitch_data_124

    goto :goto_5d

    :sswitch_26
    const-string v10, "scoring"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    const/4 v13, 0x5

    goto :goto_5d

    :sswitch_30
    const-string v10, "vpnfull"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    move v13, v5

    goto :goto_5d

    :sswitch_3a
    const-string v10, "forceupdate"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    move v13, v6

    goto :goto_5d

    :sswitch_44
    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    move v13, v7

    goto :goto_5d

    :sswitch_4c
    const-string v10, "vpnoff"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    move v13, v9

    goto :goto_5d

    :sswitch_56
    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    move v13, v8

    :cond_5d
    :goto_5d
    packed-switch v13, :pswitch_data_13e

    goto :goto_81

    :pswitch_61
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-boolean v4, Lrbe;->z:Z

    xor-int/2addr v4, v9

    sput-boolean v4, Lrbe;->z:Z

    goto :goto_81

    :pswitch_6a
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_81

    :pswitch_6e
    sput-boolean v9, Lmom;->a:Z

    goto :goto_81

    :pswitch_71
    invoke-static {v11}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_113

    :pswitch_77
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_81

    :pswitch_7b
    invoke-static {v12}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_113

    :cond_81
    :goto_81
    invoke-static {v1}, Lwqm;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Lbtb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9e

    const/4 p0, 0x0

    if-eqz v1, :cond_97

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_98

    :cond_97
    move-object v1, p0

    :goto_98
    invoke-static {v1, p0, p0, v8}, Lbtb;->d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_113

    :cond_9e
    invoke-static {v1}, Lwqm;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v8, "referrer"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b0

    invoke-static {v8}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_113

    :cond_b0
    invoke-static {v1}, Lwqm;->k(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v8, "subscription"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c1

    invoke-static {v8}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_113

    :cond_c1
    if-eqz p0, :cond_c9

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->isMangled(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_cf

    :cond_c9
    invoke-static {v1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_d9

    :cond_cf
    move-object/from16 p0, p4

    invoke-virtual {p0, v1}, Lsk6;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_113

    move-object v1, p0

    goto :goto_113

    :cond_d9
    if-eqz v2, :cond_e3

    if-ne v2, v9, :cond_fb

    const/4 v5, 0x6

    :cond_de
    :goto_de
    move-object/from16 p0, p2

    move-object/from16 v2, p5

    goto :goto_10f

    :cond_e3
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/16 v2, 0xb

    if-eq p0, v2, :cond_10a

    const/16 v2, 0x11

    if-eq p0, v2, :cond_107

    const/16 v2, 0x21

    if-eq p0, v2, :cond_107

    const/16 v2, 0x2a

    if-eq p0, v2, :cond_101

    const/16 v2, 0x2b

    if-eq p0, v2, :cond_de

    :cond_fb
    move-object/from16 p0, p2

    move-object/from16 v2, p5

    move v5, v7

    goto :goto_10f

    :cond_101
    move-object/from16 p0, p2

    move-object/from16 v2, p5

    move v5, v6

    goto :goto_10f

    :cond_107
    const/16 v5, 0xa

    goto :goto_de

    :cond_10a
    move-object/from16 p0, p2

    move-object/from16 v2, p5

    move v5, v9

    :goto_10f
    invoke-interface {p0, v5, v2, v1}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_113
    :goto_113
    iget-object p0, p1, Lay3;->l:Lsqh;

    iget-object v2, p1, Lay3;->a:Llqm;

    invoke-static {v1, p0, v2}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p0

    iget-byte v0, p1, Lay3;->o:B

    if-eq v0, v9, :cond_120

    return-object p0

    :cond_120
    iput-boolean v9, p0, Lksc;->l:Z

    return-object p0

    nop

    :sswitch_data_124
    .sparse-switch
        -0x34488b41 -> :sswitch_56
        -0x30463005 -> :sswitch_4c
        -0x2835210a -> :sswitch_44
        0x1e5aa774 -> :sswitch_3a
        0x277c5183 -> :sswitch_30
        0x72adfecf -> :sswitch_26
    .end sparse-switch

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_7b
        :pswitch_77
        :pswitch_71
        :pswitch_6e
        :pswitch_6a
        :pswitch_61
    .end packed-switch
.end method
