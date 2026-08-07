.class public final synthetic Ll/ir60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ir60;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir60;->a:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->a(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;)V

    return-void
.end method
