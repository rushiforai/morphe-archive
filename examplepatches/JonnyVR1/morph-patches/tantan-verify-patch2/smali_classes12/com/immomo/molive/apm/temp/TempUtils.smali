.class public final Lcom/immomo/molive/apm/temp/TempUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\r\u0010\u0007\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0006J\r\u0010\u0008\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\u0006J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bR!\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010R!\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u000e\u001a\u0004\u0008\u0013\u0010\u0010R!\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u00158FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u000e\u001a\u0004\u0008\u0017\u0010\u0018R!\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u00158FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u000e\u001a\u0004\u0008\u001a\u0010\u0018R!\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u00158FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\u000e\u001a\u0004\u0008\u0012\u0010\u0018R!\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u00160\u00158FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u000e\u001a\u0004\u0008\u001d\u0010\u0018R\u0016\u0010 \u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u001fR\u0016\u0010!\u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\n\u0010\u001fR\u0016\u0010#\u001a\u00020\t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\"\u0010\u001f\u00a8\u0006$"
    }
    d2 = {
        "Lcom/immomo/molive/apm/temp/TempUtils;",
        "",
        "<init>",
        "()V",
        "",
        "c",
        "()I",
        "a",
        "e",
        "",
        "h",
        "()Z",
        "",
        "",
        "Lkotlin/Lazy;",
        "getCPU_SENSORS_MSMNILE",
        "()Ljava/util/Set;",
        "CPU_SENSORS_MSMNILE",
        "b",
        "getMISC_SENSORS_TALOS",
        "MISC_SENSORS_TALOS",
        "",
        "Ljava/io/File;",
        "g",
        "()Ljava/util/List;",
        "tempList",
        "d",
        "cpuThermalList",
        "batteryThermalList",
        "f",
        "skinThermalList",
        "Z",
        "cpuTempEnable",
        "batteryTempEnable",
        "i",
        "skinTempEnable",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils;

.field private static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static g:Z

.field private static h:Z

.field private static i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/molive/apm/temp/TempUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/molive/apm/temp/TempUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils;

    .line 7
    .line 8
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$CPU_SENSORS_MSMNILE$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$MISC_SENSORS_TALOS$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$MISC_SENSORS_TALOS$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->b:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$tempList$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$tempList$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->c:Lkotlin/Lazy;

    .line 31
    .line 32
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$cpuThermalList$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$cpuThermalList$2;

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->d:Lkotlin/Lazy;

    .line 39
    .line 40
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$batteryThermalList$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$batteryThermalList$2;

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->e:Lkotlin/Lazy;

    .line 47
    .line 48
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils$skinThermalList$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils$skinThermalList$2;

    .line 49
    .line 50
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->f:Lkotlin/Lazy;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    sput-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->g:Z

    .line 58
    .line 59
    sput-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->h:Z

    .line 60
    .line 61
    sput-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->i:Z

    .line 62
    .line 63
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 4

    .line 1
    sget-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->b()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->h:Z

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    sget-object v0, Ll/xpi0;->INSTANCE:Ll/xpi0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->b()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v2, 0x2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-static {v0, p0, v1, v2, v3}, Ll/xpi0;->c(Ll/xpi0;Ljava/util/List;ZILjava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    return p0

    .line 33
    :catch_0
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->h:Z

    .line 34
    .line 35
    return v1
.end method

.method public final b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/temp/TempUtils;->e:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final c()I
    .locals 4

    .line 1
    sget-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->d()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->g:Z

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    sget-object v0, Ll/xpi0;->INSTANCE:Ll/xpi0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->d()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v2, 0x2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-static {v0, p0, v1, v2, v3}, Ll/xpi0;->c(Ll/xpi0;Ljava/util/List;ZILjava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    return p0

    .line 33
    :catch_0
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->g:Z

    .line 34
    .line 35
    return v1
.end method

.method public final d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/temp/TempUtils;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final e()I
    .locals 4

    .line 1
    sget-boolean v0, Lcom/immomo/molive/apm/temp/TempUtils;->i:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->f()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->i:Z

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    sget-object v0, Ll/xpi0;->INSTANCE:Ll/xpi0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->f()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v2, 0x2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-static {v0, p0, v1, v2, v3}, Ll/xpi0;->c(Ll/xpi0;Ljava/util/List;ZILjava/lang/Object;)I

    .line 29
    .line 30
    .line 31
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    return p0

    .line 33
    :catch_0
    sput-boolean v1, Lcom/immomo/molive/apm/temp/TempUtils;->i:Z

    .line 34
    .line 35
    return v1
.end method

.method public final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/temp/TempUtils;->f:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/temp/TempUtils;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final h()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/immomo/molive/apm/temp/TempUtils;->g:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    sget-boolean p0, Lcom/immomo/molive/apm/temp/TempUtils;->h:Z

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    sget-boolean p0, Lcom/immomo/molive/apm/temp/TempUtils;->i:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method
