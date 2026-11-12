.class public final synthetic Lbw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/account/auth/EditProfileAuthActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/account/auth/EditProfileAuthActivity;B)V
    .registers 3

    iput-byte p2, p0, Lbw7;->a:B

    iput-object p1, p0, Lbw7;->b:Lcom/opera/android/account/auth/EditProfileAuthActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lbw7;->a:B

    const/4 v1, 0x0

    sget-object v2, Laf9;->a:Laf9;

    iget-object p0, p0, Lbw7;->b:Lcom/opera/android/account/auth/EditProfileAuthActivity;

    check-cast p1, Laf9;

    packed-switch v0, :pswitch_data_3a

    sget v0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->V:I

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->U:Z

    if-nez v0, :cond_1d

    if-ne p1, v2, :cond_1d

    invoke-virtual {p0}, Lcom/opera/android/account/auth/EditProfileAuthActivity;->F0()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1d

    invoke-virtual {p0, p1, v1, v1}, Lcom/opera/android/FullscreenWebActivity;->s0(Landroid/net/Uri;II)V

    :cond_1d
    return-void

    :pswitch_1e
    sget v0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->V:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->R:Z

    if-eq p1, v2, :cond_26

    move v0, v1

    :cond_26
    iput-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->S:Z

    iget-boolean p1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->Q:Z

    if-eqz p1, :cond_39

    iget-boolean p1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->U:Z

    if-nez p1, :cond_39

    invoke-virtual {p0}, Lcom/opera/android/account/auth/EditProfileAuthActivity;->F0()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_39

    invoke-virtual {p0, p1, v1, v1}, Lcom/opera/android/FullscreenWebActivity;->s0(Landroid/net/Uri;II)V

    :cond_39
    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
