.class final Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/molive/apm/cpu/CpuFreq;-><init>(I)V
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


# instance fields
.field final synthetic this$0:Lcom/immomo/molive/apm/cpu/CpuFreq;


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/cpu/CpuFreq;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;->this$0:Lcom/immomo/molive/apm/cpu/CpuFreq;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()J
    .locals 2

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;->this$0:Lcom/immomo/molive/apm/cpu/CpuFreq;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->b(Lcom/immomo/molive/apm/cpu/CpuFreq;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/itb;->a(Ljava/io/File;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 2

    .line 14
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;->invoke()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method
