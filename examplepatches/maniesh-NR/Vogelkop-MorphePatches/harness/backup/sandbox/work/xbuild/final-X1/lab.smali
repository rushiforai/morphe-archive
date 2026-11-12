.class public final synthetic Llab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmab;

.field public final synthetic c:Lx5f;


# direct methods
.method public synthetic constructor <init>(Lmab;Lx5f;B)V
    .registers 4

    iput-byte p3, p0, Llab;->a:B

    iput-object p1, p0, Llab;->b:Lmab;

    iput-object p2, p0, Llab;->c:Lx5f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Llab;->a:B

    const-string v1, "Install fail: "

    const/4 v2, 0x4

    iget-object v3, p0, Llab;->c:Lx5f;

    iget-object p0, p0, Llab;->b:Lmab;

    check-cast p1, Ljava/lang/String;

    packed-switch v0, :pswitch_data_40

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v2, p1}, Lx5f;->R(ILjava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/InstallSplitLocaleActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->J()V

    return-void

    :pswitch_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v2, p1}, Lx5f;->R(ILjava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/InstallSplitLocaleActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->J()V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
