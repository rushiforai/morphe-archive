.class public final synthetic Lkab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmab;


# direct methods
.method public synthetic constructor <init>(Lmab;B)V
    .registers 3

    iput-byte p2, p0, Lkab;->a:B

    iput-object p1, p0, Lkab;->b:Lmab;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lkab;->a:B

    iget-object p0, p0, Lkab;->b:Lmab;

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/InstallSplitLocaleActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->J()V

    return-void

    :pswitch_11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/InstallSplitLocaleActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->J()V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
