.class final Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/molive/apm/cpu/CpuUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\t\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;

    invoke-direct {v0}, Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;-><init>()V

    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()J
    .locals 4

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x3e8

    .line 8
    .line 9
    div-long/2addr v2, v0

    .line 10
    return-wide v2
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 2

    .line 11
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;->invoke()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method
