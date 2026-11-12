.class public final Lbu6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lbu6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Z)Ljava/lang/String;
    .registers 4

    iget-byte p0, p0, Lbu6;->a:B

    packed-switch p0, :pswitch_data_36

    invoke-static {p1}, Ls6e;->b(Landroid/content/Context;)Ls6e;

    move-result-object p0

    iget-object p0, p0, Ls6e;->b:Lvq8;

    iget-object p0, p0, Lvq8;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Laik;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_14
    const/4 p0, 0x0

    :try_start_15
    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/TelephonyManager;

    if-eqz p1, :cond_35

    const/4 v0, 0x2

    if-eqz p2, :cond_28

    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result p2

    if-eq p2, v0, :cond_35

    :cond_28
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_35

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2
    :try_end_32
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_32} :catch_35

    if-ne p2, v0, :cond_35

    move-object p0, p1

    :catch_35
    :cond_35
    return-object p0

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
