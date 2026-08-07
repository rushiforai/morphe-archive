.class public final synthetic Ll/dqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/InAppController;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iput-object p2, p0, Ll/dqm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iget-object p0, p0, Ll/dqm;->b:Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    invoke-static {v0, p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->f(Lcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
