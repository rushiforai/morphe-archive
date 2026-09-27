.class public final Lkotlin/coroutines/jvm/internal/DebugMetadataKt;
.super Ljava/lang/Object;
.source "DebugMetadata.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDebugMetadata.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DebugMetadata.kt\nkotlin/coroutines/jvm/internal/DebugMetadataKt\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,161:1\n37#2,2:162\n*S KotlinDebug\n*F\n+ 1 DebugMetadata.kt\nkotlin/coroutines/jvm/internal/DebugMetadataKt\n*L\n134#1:162,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u001a5\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u0003b\u0002\u0008\t\u00a2\u0006\u0002\u0008\u0003\u001a\u0010\u0010\n\u001a\u0004\u0018\u00010\u000b*\u00020\u0002H\u0082\u0080\u0004\u001a\u000e\u0010\u000c\u001a\u00020\r*\u00020\u0002H\u0082\u0080\u0004\u001a;\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000f*\u00020\u0002H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u000eb\u0002\u0008\t\u00a2\u0006\u0002\u0010\u0011\u001a \u0010\u0014\u001a\u00020\r*\u00020\u0002H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0015b\u0002\u0008\t\"\u000f\u0010\u0012\u001a\u00020\rX\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010\u0013\u001a\u00020\rX\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "getStackTraceElementImpl",
        "Ljava/lang/StackTraceElement;",
        "Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;",
        "getStackTraceElement",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/jvm/JvmName;",
        "name",
        "Lkotlin/PublishedApi;",
        "getDebugMetadataAnnotation",
        "Lkotlin/coroutines/jvm/internal/DebugMetadata;",
        "getLabel",
        "",
        "getSpilledVariableFieldMapping",
        "",
        "",
        "(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)[Ljava/lang/String;",
        "COROUTINES_DEBUG_METADATA_VERSION_1_3",
        "COROUTINES_DEBUG_METADATA_VERSION_2_2",
        "getNextLineNumber",
        "2.2",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final COROUTINES_DEBUG_METADATA_VERSION_1_3:I = 0x1

.field private static final COROUTINES_DEBUG_METADATA_VERSION_2_2:I = 0x2


# direct methods
.method private static final getDebugMetadataAnnotation(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lkotlin/coroutines/jvm/internal/DebugMetadata;
    .registers 2

    .line 96
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-class v0, Lkotlin/coroutines/jvm/internal/DebugMetadata;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lkotlin/coroutines/jvm/internal/DebugMetadata;

    return-object p0
.end method

.method private static final getLabel(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)I
    .registers 4

    .line 99
    instance-of v0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    .line 101
    :cond_6
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "label"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v2, 0x1

    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 103
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_1f

    check-cast p0, Ljava/lang/Integer;

    goto :goto_20

    :cond_1f
    const/4 p0, 0x0

    :goto_20
    if-eqz p0, :cond_26

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_26} :catch_28

    :cond_26
    sub-int/2addr v1, v2

    return v1

    :catch_28
    const/4 p0, -0x1

    return p0
.end method

.method public static final getNextLineNumber(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)I
    .registers 5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getDebugMetadataAnnotation(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lkotlin/coroutines/jvm/internal/DebugMetadata;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_d

    return v1

    .line 155
    :cond_d
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->v()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_15

    return v1

    .line 156
    :cond_15
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getLabel(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)I

    move-result p0

    if-gez p0, :cond_1c

    return v1

    .line 158
    :cond_1c
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->nl()[I

    move-result-object v2

    array-length v2, v2

    if-lt p0, v2, :cond_24

    return v1

    .line 159
    :cond_24
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->nl()[I

    move-result-object v0

    aget p0, v0, p0

    return p0
.end method

.method public static final getSpilledVariableFieldMapping(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)[Ljava/lang/String;
    .registers 8

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getDebugMetadataAnnotation(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lkotlin/coroutines/jvm/internal/DebugMetadata;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    return-object v1

    .line 125
    :cond_d
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->v()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_15

    return-object v1

    .line 126
    :cond_15
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 127
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getLabel(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)I

    move-result p0

    .line 128
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->i()[I

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_25
    if-ge v5, v3, :cond_40

    aget v6, v2, v5

    if-ne v6, p0, :cond_3d

    .line 130
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->s()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v5

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->n()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v5

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3d
    add-int/lit8 v5, v5, 0x1

    goto :goto_25

    .line 134
    :cond_40
    check-cast v1, Ljava/util/Collection;

    .line 163
    new-array p0, v4, [Ljava/lang/String;

    invoke-interface {v1, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static final getStackTraceElement(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)Ljava/lang/StackTraceElement;
    .registers 5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getDebugMetadataAnnotation(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)Lkotlin/coroutines/jvm/internal/DebugMetadata;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    return-object v1

    .line 49
    :cond_d
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->v()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_15

    return-object v1

    .line 50
    :cond_15
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/DebugMetadataKt;->getLabel(Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;)I

    move-result v1

    if-gez v1, :cond_1d

    const/4 v1, -0x1

    goto :goto_23

    .line 51
    :cond_1d
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->l()[I

    move-result-object v2

    aget v1, v2, v1

    .line 52
    :goto_23
    sget-object v2, Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;->INSTANCE:Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;

    check-cast p0, Lkotlin/coroutines/Continuation;

    invoke-virtual {v2, p0}, Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;->getModuleName(Lkotlin/coroutines/Continuation;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_32

    .line 53
    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->c()Ljava/lang/String;

    move-result-object p0

    goto :goto_4a

    :cond_32
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2f

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->c()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 54
    :goto_4a
    new-instance v2, Ljava/lang/StackTraceElement;

    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->m()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lkotlin/coroutines/jvm/internal/DebugMetadata;->f()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p0, v3, v0, v1}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2
.end method
