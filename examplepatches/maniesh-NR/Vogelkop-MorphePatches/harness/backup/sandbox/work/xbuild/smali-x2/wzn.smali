.class public final Lwzn;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/WelcomeActivity;B)V
    .registers 3

    iput-byte p2, p0, Lwzn;->e:B

    iput-object p1, p0, Lwzn;->f:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lwzn;->e:B

    packed-switch v0, :pswitch_data_32

    new-instance v0, Lu9k;

    iget-object p0, p0, Lwzn;->f:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {v0, p0}, Lu9k;-><init>(Lcom/opera/android/startup/WelcomeActivity;)V

    return-object v0

    :pswitch_d
    new-instance v1, Lm9k;

    sget-object v3, Lvml;->d:Lumi;

    iget-object v2, p0, Lwzn;->f:Lcom/opera/android/startup/WelcomeActivity;

    iget-object p0, v2, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lm9k;-><init>(Landroid/app/Activity;Lumi;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;Lm9c;)V

    return-object v1

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
