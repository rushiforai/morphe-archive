.class public Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;,
        Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;
    }
.end annotation


# instance fields
.field public error:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;

.field public roomId:Ljava/lang/String;

.field public state:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->roomId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->state:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->error:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;

    .line 9
    .line 10
    return-void
.end method

.method private static create(Ljava/lang/String;II)Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;->fromId(I)Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;->fromId(I)Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
