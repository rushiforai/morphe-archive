.class public final Lcom/opera/android/webcore/AiAssistantUpdateBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljw0;


# direct methods
.method public static openUpdate()V
    .registers 1

    sget-object v0, Lcom/opera/android/webcore/AiAssistantUpdateBridge;->a:Ljw0;

    if-eqz v0, :cond_9

    iget-object v0, v0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {v0}, Lz5i;->f0(Landroid/content/Context;)V

    :cond_9
    return-void
.end method
