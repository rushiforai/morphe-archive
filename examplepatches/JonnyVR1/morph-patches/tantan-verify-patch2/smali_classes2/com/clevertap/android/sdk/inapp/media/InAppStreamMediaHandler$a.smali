.class public final Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;
.super Ll/jl50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;-><init>(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a",
        "Ll/jl50;",
        "",
        "handleOnBackPressed",
        "()V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;->a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Ll/jl50;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;->a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->access$getExoPlayerFullscreen$p(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;->a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->access$closeFullscreenDialog(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/jl50;->setEnabled(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
