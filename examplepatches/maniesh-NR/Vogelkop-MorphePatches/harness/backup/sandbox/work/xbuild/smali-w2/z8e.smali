.class public final synthetic Lz8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/fragment/app/Fragment;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/Fragment;B)V
    .registers 3

    iput-byte p2, p0, Lz8e;->a:B

    iput-object p1, p0, Lz8e;->b:Landroidx/fragment/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final q(Landroid/content/IntentSender;I)V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lz8e;->a:B

    packed-switch v1, :pswitch_data_28

    const/4 v9, 0x0

    iget-object v2, v0, Lz8e;->b:Landroidx/fragment/app/Fragment;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v3, p1

    move/from16 v4, p2

    invoke-virtual/range {v2 .. v9}, Landroidx/fragment/app/Fragment;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    return-void

    :pswitch_16
    const/16 v17, 0x0

    iget-object v10, v0, Lz8e;->b:Landroidx/fragment/app/Fragment;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v11, p1

    move/from16 v12, p2

    invoke-virtual/range {v10 .. v17}, Landroidx/fragment/app/Fragment;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
