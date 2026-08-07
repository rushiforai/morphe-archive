.class public final synthetic Ll/kqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vo50;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/InAppController;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iput-object p2, p0, Ll/kqm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iget-object p0, p0, Ll/kqm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->i(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ljava/lang/Boolean;)V

    return-void
.end method
