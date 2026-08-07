.class public Lcom/bef/effectsdk/message/ResourceMonitor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bef/effectsdk/message/MessageInterceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/message/ResourceMonitor$Listener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ResourceMonitor"


# instance fields
.field private mListener:Lcom/bef/effectsdk/message/ResourceMonitor$Listener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bef/effectsdk/message/ResourceMonitor;->mListener:Lcom/bef/effectsdk/message/ResourceMonitor$Listener;

    .line 3
    .line 4
    return-void
.end method

.method public intercept(Landroid/os/Message;)Z
    .locals 4

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v1, v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-eq p1, v1, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq p1, v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/bef/effectsdk/message/ResourceMonitor;->mListener:Lcom/bef/effectsdk/message/ResourceMonitor$Listener;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    invoke-interface {p0, v0, v2}, Lcom/bef/effectsdk/message/ResourceMonitor$Listener;->onResourceLoadFinish(Ljava/lang/String;Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object p0, p0, Lcom/bef/effectsdk/message/ResourceMonitor;->mListener:Lcom/bef/effectsdk/message/ResourceMonitor$Listener;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    invoke-interface {p0, v0, v3}, Lcom/bef/effectsdk/message/ResourceMonitor$Listener;->onResourceLoadFinish(Ljava/lang/String;Z)V

    .line 42
    .line 43
    .line 44
    :cond_3
    :goto_0
    return v3

    .line 45
    :cond_4
    return v2
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public setListener(Lcom/bef/effectsdk/message/ResourceMonitor$Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/message/ResourceMonitor;->mListener:Lcom/bef/effectsdk/message/ResourceMonitor$Listener;

    .line 2
    .line 3
    return-void
.end method
