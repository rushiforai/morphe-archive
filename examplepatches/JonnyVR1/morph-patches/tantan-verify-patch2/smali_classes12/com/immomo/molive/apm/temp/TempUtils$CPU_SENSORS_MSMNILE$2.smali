.class final Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/molive/apm/temp/TempUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/util/Set<",
        "+",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
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
.field public static final INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;

    invoke-direct {v0}, Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;-><init>()V

    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 26
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;->invoke()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ljava/util/Set;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v6, "cpu-1-0-usr"

    .line 2
    .line 3
    const-string v7, "cpu-1-2-usr"

    .line 4
    .line 5
    const-string v0, "cpuss-2-usr"

    .line 6
    .line 7
    const-string v1, "cpuss-2-usr"

    .line 8
    .line 9
    const-string v2, "cpuss-1-usr"

    .line 10
    .line 11
    const-string v3, "cpuss-1-usr"

    .line 12
    .line 13
    const-string v4, "cpuss-0-usr"

    .line 14
    .line 15
    const-string v5, "cpuss-0-usr"

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
