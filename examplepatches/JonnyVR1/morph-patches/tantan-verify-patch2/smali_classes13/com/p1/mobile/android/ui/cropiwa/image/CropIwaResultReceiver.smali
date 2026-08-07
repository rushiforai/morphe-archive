.class public Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;
    }
.end annotation


# static fields
.field private static final ACTION_CROP_COMPLETED:Ljava/lang/String; = "cropIwa_action_crop_completed"

.field private static final EXTRA_ERROR:Ljava/lang/String; = "extra_error"

.field private static final EXTRA_INVALID:Ljava/lang/String; = "extra_invalid"

.field private static final EXTRA_URI:Ljava/lang/String; = "extra_uri"

.field public static final TAG:Ljava/lang/String; = "CropIwaResultReceiver"


# instance fields
.field private listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

.field private registered:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->registered:Z

    .line 6
    .line 7
    return-void
.end method

.method public static onCropCompleted(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    .line 1
    const-string v0, "CropIwaResultReceiver"

    .line 2
    .line 3
    const-string v1, "CropIwaResultReceiver-onCropCompleted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v1, "cropIwa_action_crop_completed"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "extra_uri"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static onCropFailed(Landroid/content/Context;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-string v0, "CropIwaResultReceiver"

    .line 2
    .line 3
    const-string v1, "CropIwaResultReceiver-onCropFailed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v1, "cropIwa_action_crop_completed"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "extra_error"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static onCropInvalid(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "CropIwaResultReceiver"

    .line 2
    .line 3
    const-string v1, "CropIwaResultReceiver-onCropInvalid"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v1, "cropIwa_action_crop_completed"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "extra_invalid"

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    const-string p1, "CropIwaResultReceiver-onReceive"

    .line 2
    .line 3
    const-string v0, "CropIwaResultReceiver"

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    const-string p2, "extra_invalid"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    const-string p1, "CropIwaResultReceiver-EXTRA_INVALID"

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

    .line 30
    .line 31
    invoke-interface {p0}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;->a()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p2, "extra_error"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const-string v1, "CropIwaResultReceiver-EXTRA_ERROR"

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Ljava/lang/Throwable;

    .line 55
    .line 56
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const-string p2, "extra_uri"

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    const-string v1, "CropIwaResultReceiver-EXTRA_URI"

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Landroid/net/Uri;

    .line 80
    .line 81
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;->b(Landroid/net/Uri;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public register(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "CropIwaResultReceiver-register()"

    .line 2
    .line 3
    const-string v1, "CropIwaResultReceiver"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->registered:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->registered:Z

    .line 14
    .line 15
    new-instance v0, Landroid/content/IntentFilter;

    .line 16
    .line 17
    const-string v2, "cropIwa_action_crop_completed"

    .line 18
    .line 19
    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, p0, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const-string p0, "CropIwaResultReceiver-registerReceiver"

    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public setListener(Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->listener:Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;

    .line 2
    .line 3
    return-void
.end method

.method public unregister(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "CropIwaResultReceiver-unregister()"

    .line 2
    .line 3
    const-string v1, "CropIwaResultReceiver"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->registered:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->registered:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "CropIwaResultReceiver-unregisterReceiver"

    .line 19
    .line 20
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
