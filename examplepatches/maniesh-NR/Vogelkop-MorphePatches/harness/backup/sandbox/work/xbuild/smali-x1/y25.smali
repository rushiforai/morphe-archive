.class public final Ly25;
.super Lr25;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public constructor <init>()V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Ly25;->f:B

    new-instance v3, Lrxh;

    const v0, 0x7f140da5

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const v0, 0x7f140da6

    invoke-direct {v4, v0}, Lrxh;-><init>(I)V

    const v5, 0x7f0805e5

    sget-object v6, La35;->g:La35;

    const-string v2, "RecentSearches"

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V
    .registers 7

    .line 31
    const/4 v0, 0x1

    iput-byte v0, p0, Ly25;->f:B

    invoke-direct/range {p0 .. p5}, Lr25;-><init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V

    return-void
.end method


# virtual methods
.method public final a(Ls25;Ljava/lang/Runnable;)V
    .registers 5

    iget-byte p0, p0, Ly25;->f:B

    packed-switch p0, :pswitch_data_1a

    iget-object p0, p1, Ls25;->b:Lumi;

    new-instance v0, Lwx;

    const/16 v1, 0x1b

    invoke-direct {v0, p1, p2, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;

    invoke-direct {p1, p0, v0}, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;-><init>(Lumi;Lwx;)V

    return-void

    :pswitch_14
    iget-object p0, p1, Ls25;->e:Ls28;

    invoke-virtual {p0, p2}, Ls28;->b(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final c(Ls25;Lcom/opera/api/Callback;)V
    .registers 5

    iget-byte p0, p0, Ly25;->f:B

    packed-switch p0, :pswitch_data_38

    iget-object p0, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const p1, 0x7f140439

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    check-cast p2, Liu2;

    invoke-virtual {p2, p0}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    iget-object p0, p1, Ls25;->e:Ls28;

    new-instance v0, Lk25;

    check-cast p2, Liu2;

    const/4 v1, 0x1

    invoke-direct {v0, p2, p1, v1}, Lk25;-><init>(Liu2;Ls25;B)V

    iget-boolean p1, p0, Ls28;->d:Z

    if-nez p1, :cond_2b

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Lk25;->run(Ljava/lang/Object;)V

    goto :goto_37

    :cond_2b
    iget-object p1, p0, Ls28;->h:Ljava/lang/Object;

    check-cast p1, Lko7;

    new-instance p2, Lvr9;

    invoke-direct {p2, p0, v0}, Lvr9;-><init>(Ls28;Lk25;)V

    invoke-virtual {p1, p2}, Lldk;->f(Ljava/lang/Runnable;)V

    :goto_37
    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final d(Ls25;)Z
    .registers 3

    iget-byte v0, p0, Ly25;->f:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Lr25;->d(Ls25;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p1, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "onboarding_deleted"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
