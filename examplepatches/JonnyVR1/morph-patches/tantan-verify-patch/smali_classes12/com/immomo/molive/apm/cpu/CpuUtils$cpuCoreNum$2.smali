.class final Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;
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
        "Ljava/lang/Integer;",
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
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0008\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
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
.field public static final INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;

    invoke-direct {v0}, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;-><init>()V

    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()I
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->a(Lcom/immomo/molive/apm/cpu/CpuUtils;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 12
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;->invoke()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
