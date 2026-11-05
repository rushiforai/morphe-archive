.class public Lcom/sauzask/nicoid/NicoidSetting$i;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidSetting;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidSetting;


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 4

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.sauzask.nicoid.hls"

    const-string v1, "com.sauzask.nicoid.NicoidInAppBillingActivity"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$i;->a:Lcom/sauzask/nicoid/NicoidSetting;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceActivity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1
.end method
