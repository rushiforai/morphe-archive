.class public final synthetic Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil$FindCall;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/a;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    return-void
.end method


# virtual methods
.method public final isFind(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/a;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->c(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity;Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;)Z

    move-result p0

    return p0
.end method
