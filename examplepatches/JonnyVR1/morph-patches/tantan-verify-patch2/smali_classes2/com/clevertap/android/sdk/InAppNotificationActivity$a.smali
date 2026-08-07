.class Lcom/clevertap/android/sdk/InAppNotificationActivity$a;
.super Ll/jl50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/InAppNotificationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/InAppNotificationActivity;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/InAppNotificationActivity;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/InAppNotificationActivity$a;->a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/jl50;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/InAppNotificationActivity$a;->a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/InAppNotificationActivity;->finish()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/clevertap/android/sdk/InAppNotificationActivity$a;->a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/clevertap/android/sdk/InAppNotificationActivity;->N0(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
