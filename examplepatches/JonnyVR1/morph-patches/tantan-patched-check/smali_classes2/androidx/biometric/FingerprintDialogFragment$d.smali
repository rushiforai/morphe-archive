.class public final Landroidx/biometric/FingerprintDialogFragment$d;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/biometric/FingerprintDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/FingerprintDialogFragment;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintDialogFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget-object p1, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/aok0;->g(Landroid/content/Context;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-static {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->Z3(Landroidx/biometric/FingerprintDialogFragment;Z)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :pswitch_1
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/biometric/FingerprintDialogFragment;->e4()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_2
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 39
    .line 40
    invoke-static {p0}, Landroidx/biometric/FingerprintDialogFragment;->Y3(Landroidx/biometric/FingerprintDialogFragment;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :pswitch_3
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 45
    .line 46
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p1, Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-static {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->X3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :pswitch_4
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 55
    .line 56
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast p1, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->W3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_5
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$d;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 65
    .line 66
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p1, Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-static {p0, p1}, Landroidx/biometric/FingerprintDialogFragment;->V3(Landroidx/biometric/FingerprintDialogFragment;Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    nop

    .line 75
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
