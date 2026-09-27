.class public final synthetic Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt$WhenMappings;
.super Ljava/lang/Object;
.source "PathRecursiveFunctions.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = "WhenMappings"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic $EnumSwitchMapping$0:[I

.field public static final synthetic $EnumSwitchMapping$1:[I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    invoke-static {}, Lkotlin/io/path/CopyActionResult;->values()[Lkotlin/io/path/CopyActionResult;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_8
    sget-object v2, Lkotlin/io/path/CopyActionResult;->CONTINUE:Lkotlin/io/path/CopyActionResult;

    invoke-virtual {v2}, Lkotlin/io/path/CopyActionResult;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_10} :catch_10

    :catch_10
    const/4 v2, 0x2

    :try_start_11
    sget-object v3, Lkotlin/io/path/CopyActionResult;->TERMINATE:Lkotlin/io/path/CopyActionResult;

    invoke-virtual {v3}, Lkotlin/io/path/CopyActionResult;->ordinal()I

    move-result v3

    aput v2, v0, v3
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_19} :catch_19

    :catch_19
    :try_start_19
    sget-object v3, Lkotlin/io/path/CopyActionResult;->SKIP_SUBTREE:Lkotlin/io/path/CopyActionResult;

    invoke-virtual {v3}, Lkotlin/io/path/CopyActionResult;->ordinal()I

    move-result v3

    const/4 v4, 0x3

    aput v4, v0, v3
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_22} :catch_22

    :catch_22
    sput-object v0, Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-static {}, Lkotlin/io/path/OnErrorResult;->values()[Lkotlin/io/path/OnErrorResult;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_2b
    sget-object v3, Lkotlin/io/path/OnErrorResult;->TERMINATE:Lkotlin/io/path/OnErrorResult;

    invoke-virtual {v3}, Lkotlin/io/path/OnErrorResult;->ordinal()I

    move-result v3

    aput v1, v0, v3
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2b .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v1, Lkotlin/io/path/OnErrorResult;->SKIP_SUBTREE:Lkotlin/io/path/OnErrorResult;

    invoke-virtual {v1}, Lkotlin/io/path/OnErrorResult;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_3b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3b} :catch_3b

    :catch_3b
    sput-object v0, Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt$WhenMappings;->$EnumSwitchMapping$1:[I

    return-void
.end method
