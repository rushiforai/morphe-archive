.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$LocalWarmUpInvoker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LocalWarmUpInvoker"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$LocalWarmUpInvoker;-><init>()V

    return-void
.end method


# virtual methods
.method public warmUp(Ljava/lang/String;I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->internalWarmUpSoPath(Ljava/lang/String;IZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method
