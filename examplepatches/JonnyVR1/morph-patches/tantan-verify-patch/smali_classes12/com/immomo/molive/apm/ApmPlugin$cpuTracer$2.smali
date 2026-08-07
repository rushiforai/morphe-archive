.class final Lcom/immomo/molive/apm/ApmPlugin$cpuTracer$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/molive/apm/ApmPlugin;-><init>(Ll/hr60;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ll/otb;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0003\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0001\u0010\u0002"
    }
    d2 = {
        "Ll/otb;",
        "invoke",
        "()Ll/otb;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/molive/apm/ApmPlugin;


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/ApmPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$cpuTracer$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 25
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin$cpuTracer$2;->invoke()Ll/otb;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ll/otb;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/otb;

    .line 2
    .line 3
    new-instance v1, Ll/ci2;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/immomo/molive/apm/ApmPlugin$cpuTracer$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/immomo/molive/apm/ApmPlugin;->e(Lcom/immomo/molive/apm/ApmPlugin;)Ll/zt0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/zt0;->e()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    const/4 v5, 0x2

    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct/range {v1 .. v6}, Ll/ci2;-><init>(JLjava/util/concurrent/ScheduledExecutorService;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/otb;-><init>(Ll/ci2;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method
