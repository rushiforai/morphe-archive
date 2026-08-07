.class public Lcom/bef/effectsdk/GPUProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/GPUProcessor$Listener;
    }
.end annotation


# static fields
.field private static sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;


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

.method public static synthetic access$000()Lcom/bef/effectsdk/GPUProcessor$Listener;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    .line 2
    .line 3
    return-object v0
.end method

.method public static destroy()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput-object v0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    .line 6
    .line 7
    return-void
.end method

.method public static init()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bef/effectsdk/GPUProcessor$1;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bef/effectsdk/GPUProcessor$1;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lcom/bef/effectsdk/message/MessageCenter;->setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static setListener(Lcom/bef/effectsdk/GPUProcessor$Listener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    .line 2
    .line 3
    return-void
.end method
