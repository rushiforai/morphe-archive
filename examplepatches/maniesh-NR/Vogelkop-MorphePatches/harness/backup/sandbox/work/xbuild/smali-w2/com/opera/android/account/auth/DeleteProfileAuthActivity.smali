.class public Lcom/opera/android/account/auth/DeleteProfileAuthActivity;
.super Lcom/opera/android/account/auth/EditProfileAuthActivity;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/opera/android/account/auth/EditProfileAuthActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public final F0()Landroid/net/Uri;
    .registers 2

    iget-boolean p0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->R:Z

    if-eqz p0, :cond_1a

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1a
    const/4 p0, 0x0

    return-object p0
.end method
