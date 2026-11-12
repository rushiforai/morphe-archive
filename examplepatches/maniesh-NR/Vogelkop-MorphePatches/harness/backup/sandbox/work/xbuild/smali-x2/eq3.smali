.class public final Leq3;
.super Lpp3;
.source "SourceFile"


# instance fields
.field public final synthetic u:B


# direct methods
.method public synthetic constructor <init>(Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lcom/opera/android/bar/BottomBar;Lnwf;Lysl;Lv1f;Lesk;Lcom/opera/android/BrowserActivity;Lpde;Ljava/util/Set;B)V
    .registers 14

    iput-byte p13, p0, Leq3;->u:B

    invoke-direct/range {p0 .. p12}, Lpp3;-><init>(Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lcom/opera/android/bar/BottomBar;Lnwf;Lysl;Lv1f;Lesk;Lcom/opera/android/BrowserActivity;Lpde;Ljava/util/Set;)V

    return-void
.end method


# virtual methods
.method public final b(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)Lv73;
    .registers 24

    iget-byte p0, p0, Leq3;->u:B

    packed-switch p0, :pswitch_data_38

    new-instance v0, Lfq3;

    const/4 v11, 0x1

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lfq3;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;B)V

    return-object v0

    :pswitch_1e
    new-instance v1, Lfq3;

    const/4 v12, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-direct/range {v1 .. v12}, Lfq3;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;B)V

    return-object v1

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method

.method public final o()Z
    .registers 2

    iget-byte v0, p0, Leq3;->u:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Lz43;->o()Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
