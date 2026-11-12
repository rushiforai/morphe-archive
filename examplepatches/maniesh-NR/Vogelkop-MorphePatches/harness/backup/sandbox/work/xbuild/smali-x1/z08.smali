.class public final Lz08;
.super Lze;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(BI)V
    .registers 3

    iput-byte p1, p0, Lz08;->b:B

    invoke-direct {p0, p2}, Lze;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lz08;->b:B

    packed-switch v0, :pswitch_data_2a

    invoke-super {p0, p1, p2, p3}, Lze;->b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 p1, 0x400

    invoke-virtual {p0, p1}, Lwnh;->b(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1f
    invoke-static {}, Li0l;->g()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_a
    .end packed-switch
.end method

.method public final c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;
    .registers 3

    iget-byte p0, p0, Lz08;->b:B

    packed-switch p0, :pswitch_data_50

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "enable_newsfeed"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1c
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p1, "live_scores_enabled"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_33
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object p0

    sget-object p1, Lb7j;->d:Lb7j;

    if-ne p0, p1, :cond_49

    const/4 p0, 0x1

    goto :goto_4a

    :cond_49
    const/4 p0, 0x0

    :goto_4a
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_33
        :pswitch_1c
    .end packed-switch
.end method
