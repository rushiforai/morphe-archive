.class public Lcom/momo/xeengine/gift/GiftPlayerEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
    }
.end annotation


# instance fields
.field private message:Ljava/lang/String;

.field private type:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sget-object v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->None:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->type:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->message:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;->None:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->message:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->type:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object p2, v0

    .line 16
    :goto_0
    iput-object p2, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->message:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->type:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string p1, ""

    .line 5
    .line 6
    :goto_0
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->message:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public setType(Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayerEvent;->type:Lcom/momo/xeengine/gift/GiftPlayerEvent$EventType;

    .line 2
    .line 3
    return-void
.end method
