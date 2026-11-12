.class public final synthetic Lgi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmi;


# direct methods
.method public synthetic constructor <init>(Lmi;B)V
    .registers 3

    iput-byte p2, p0, Lgi;->a:B

    iput-object p1, p0, Lgi;->b:Lmi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lgi;->a:B

    iget-object p0, p0, Lgi;->b:Lmi;

    packed-switch v0, :pswitch_data_38

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lmi;->a:Lhjf;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lctl;

    invoke-virtual {p0}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object p0, p0, Lmi;->C:Lhi;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Likc;

    sget-object v4, Lz7f;->k:Lrqd;

    invoke-static {v1}, Lipe;->E(Landroid/content/Context;)Lz7f;

    move-result-object v1

    invoke-direct {v2, v0, v3, p0, v1}, Lctl;-><init>(Lhjf;Lcom/opera/android/settings/SettingsManager;Likc;Lz7f;)V

    return-object v2

    :pswitch_29
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lmi;->a:Lhjf;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p0

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
