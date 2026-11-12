.class public final Lxg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;
.implements Lmkf;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lnw3;Lnw3;Lnw3;Lgx3;Lnw3;Lfx3;)V
    .registers 17

    const/4 v0, 0x2

    iput-byte v0, p0, Lxg7;->a:B

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v1, Lywe;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lywe;-><init>(Landroid/content/Context;Lnw3;Lnw3;Lnw3;Lgx3;Lnw3;Lfx3;)V

    iput-object v1, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnw3;Lnw3;Lkze;Lzv3;Lsw3;Lsw3;Lcom/opera/android/Lazy;Lsw3;Lj4c;Lrw3;Lrw3;Lsw3;Lzv3;Lcom/opera/android/Lazy;Lzv3;Lnw3;Lnw3;)V
    .registers 40

    move-object/from16 v0, p0

    const/4 v1, 0x7

    iput-byte v1, v0, Lxg7;->a:B

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lsrn;

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    move-object/from16 v16, p14

    move-object/from16 v17, p15

    move-object/from16 v18, p16

    move-object/from16 v19, p17

    move-object/from16 v20, p18

    invoke-direct/range {v2 .. v20}, Lsrn;-><init>(Lcom/opera/android/BrowserActivity;Lnw3;Lnw3;Lkze;Lzv3;Lsw3;Lsw3;Lcom/opera/android/Lazy;Lsw3;Lj4c;Lrw3;Lrw3;Lsw3;Lzv3;Lcom/opera/android/Lazy;Lzv3;Lnw3;Lnw3;)V

    iput-object v2, v0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/uninstall/UninstallActivity;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lxg7;->a:B

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldw3;Ldw3;Lew3;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lxg7;->a:B

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lmm3;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p3, v1}, Lmm3;-><init>(Lesk;Lesk;Lesk;B)V

    iput-object v0, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ldx3;Ldw3;Lj4c;Ldw3;Luu1;Ldw3;Lew3;Lew3;Lwyn;Lumi;Ldw3;Ldw3;Ldw3;Ldw3;Ldw3;)V
    .registers 34

    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-byte v1, v0, Lxg7;->a:B

    .line 60
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v2, Lzqc;

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    move-object/from16 v16, p14

    move-object/from16 v17, p15

    invoke-direct/range {v2 .. v17}, Lzqc;-><init>(Ldx3;Ldw3;Lj4c;Ldw3;Luu1;Ldw3;Lew3;Lew3;Lwyn;Lumi;Ldw3;Ldw3;Ldw3;Ldw3;Ldw3;)V

    iput-object v2, v0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgjm;)V
    .registers 4

    const/4 v0, 0x6

    iput-byte v0, p0, Lxg7;->a:B

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lgxk;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lgxk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lki;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lxg7;->a:B

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lgxk;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lgxk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lj4c;Lmw3;Lnw3;Lmw3;Lumi;Lgjm;Lj4c;Lcom/opera/android/Lazy;Le4i;)V
    .registers 27

    const/4 v0, 0x5

    iput-byte v0, p0, Lxg7;->a:B

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v1, Luln;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v1 .. v13}, Luln;-><init>(Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lj4c;Lmw3;Lnw3;Lmw3;Lumi;Lgjm;Lj4c;Lcom/opera/android/Lazy;Le4i;)V

    iput-object v1, p0, Lxg7;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 4

    iget-byte v0, p0, Lxg7;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_20

    :pswitch_6
    return-object v1

    :pswitch_7
    const-class v0, Lrlm;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    new-instance p1, Lrlm;

    iget-object p0, p0, Lxg7;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/uninstall/UninstallActivity;

    iget-object p0, p0, Lcom/opera/android/uninstall/UninstallActivity;->d:Lw6j;

    if-eqz p0, :cond_1a

    move-object v1, p0

    :cond_1a
    invoke-direct {p1, v1}, Lrlm;-><init>(Lw6j;)V

    move-object v1, p1

    :cond_1e
    :pswitch_1e
    return-object v1

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_1e
        :pswitch_1e
        :pswitch_1e
        :pswitch_7
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 3

    iget-byte v0, p0, Lxg7;->a:B

    iget-object p0, p0, Lxg7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    check-cast p0, Lsrn;

    invoke-virtual {p0, p1}, Lsrn;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_e
    check-cast p0, Lgxk;

    invoke-virtual {p0, p1}, Lgxk;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_15
    check-cast p0, Luln;

    invoke-virtual {p0, p1}, Luln;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_1c
    const-class p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2a

    new-instance p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    invoke-direct {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;-><init>()V

    goto :goto_2b

    :cond_2a
    const/4 p0, 0x0

    :goto_2b
    return-object p0

    :pswitch_2c
    check-cast p0, Lgxk;

    invoke-virtual {p0, p1}, Lgxk;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_33
    check-cast p0, Lywe;

    invoke-virtual {p0, p1}, Lywe;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_3a
    check-cast p0, Lzqc;

    invoke-virtual {p0, p1}, Lzqc;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_41
    check-cast p0, Lmm3;

    invoke-virtual {p0, p1}, Lmm3;->b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_41
        :pswitch_3a
        :pswitch_33
        :pswitch_2c
        :pswitch_1c
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method
