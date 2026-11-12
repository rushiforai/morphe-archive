.class Lcom/leanplum/LeanplumActivityHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/LeanplumActivityHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    # invokes: Lcom/leanplum/LeanplumActivityHelper;->runPendingActions()V
    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->access$100()V

    return-void
.end method
