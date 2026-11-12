.class public final Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayDeque;

.field public final b:Lns5;

.field public c:J

.field public d:Lms5;

.field public e:Lge5;

.field public f:Lge5;


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Lns5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->a:Ljava/util/ArrayDeque;

    invoke-static {p0, p1}, LJ/N;->Mb0oOccr(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->c:J

    iput-object p2, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->b:Lns5;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->a:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lms5;

    iput-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->d:Lms5;

    iget-wide v1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->c:J

    iget p0, v0, Lms5;->a:I

    iget-object v0, v0, Lms5;->b:Lks5;

    iget-boolean v0, v0, Lks5;->a:Z

    invoke-static {v1, v2, p0, v0}, LJ/N;->MqnTJ088(JII)V

    return-void
.end method

.method public final destroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->c:J

    return-void
.end method

.method public final receiveImage([BLjava/lang/String;)V
    .registers 4
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->f:Lge5;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0, p2, p1}, Lge5;->p(Ljava/lang/String;[B)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->f:Lge5;

    return-void
.end method

.method public final receiveImageExtension(Ljava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->e:Lge5;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0, p1}, Lge5;->n(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->e:Lge5;

    return-void
.end method

.method public final receiveThumbnail(II[BII)V
    .registers 13
    .param p3    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->d:Lms5;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, v0, Lms5;->c:Lls5;

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v1 .. v6}, Lls5;->e(II[BII)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->d:Lms5;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->a()V

    return-void
.end method

.method public final showContextMenu(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;IIILjava/lang/String;ZIIII)Z
    .registers 42
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p15    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    move-object v13, v1

    goto :goto_30

    :cond_9
    new-instance v0, Lsqh;

    packed-switch p12, :pswitch_data_62

    :goto_e
    move-object/from16 v2, p11

    goto :goto_2c

    :pswitch_11
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_14
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->SAME_ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_17
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->STRICT_ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_1a
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN_WHEN_CROSSORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_1d
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->ORIGIN:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_20
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->NEVER:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_23
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->NO_REFERRER_WHEN_DOWNGRADE:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_26
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->DEFAULT:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :pswitch_29
    sget-object v1, Lcom/opera/android/browser/Referrer$Policy;->ALWAYS:Lcom/opera/android/browser/Referrer$Policy;

    goto :goto_e

    :goto_2c
    invoke-direct {v0, v2, v1}, Lsqh;-><init>(Ljava/lang/String;Lcom/opera/android/browser/Referrer$Policy;)V

    move-object v13, v0

    :goto_30
    new-instance v2, Lqs5;

    move/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move/from16 v12, p10

    move/from16 v14, p13

    move/from16 v15, p14

    move-object/from16 v16, p15

    move/from16 v17, p17

    move/from16 v18, p18

    move/from16 v19, p19

    move/from16 v20, p20

    invoke-direct/range {v2 .. v20}, Lqs5;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLsqh;IILjava/lang/String;IIII)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/opera/android/browser/chromium/contextmenu/ContextMenuHelperBridge;->b:Lns5;

    move/from16 v1, p16

    invoke-virtual {v0, v2, v1}, Lns5;->y(Lqs5;Z)Z

    move-result v0

    return v0

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
    .end packed-switch
.end method
