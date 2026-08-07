.class Lcom/ss/bytertc/engine/utils/LogRecover$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/LogRecover$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ss/bytertc/engine/utils/LogRecover$1;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/LogRecover$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/LogRecover$1$1;->this$1:Lcom/ss/bytertc/engine/utils/LogRecover$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/utils/LogRecover;->nativeSendLogRecoverRequest()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
