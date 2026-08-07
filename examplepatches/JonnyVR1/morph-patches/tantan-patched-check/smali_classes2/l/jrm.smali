.class public final synthetic Ll/jrm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/InAppNotificationActivity;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jrm;->a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

    iput-object p2, p0, Ll/jrm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrm;->a:Lcom/clevertap/android/sdk/InAppNotificationActivity;

    iget-object p0, p0, Ll/jrm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    invoke-static {v0, p0, p1, p2}, Lcom/clevertap/android/sdk/InAppNotificationActivity;->I0(Lcom/clevertap/android/sdk/InAppNotificationActivity;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;Landroid/content/DialogInterface;I)V

    return-void
.end method
