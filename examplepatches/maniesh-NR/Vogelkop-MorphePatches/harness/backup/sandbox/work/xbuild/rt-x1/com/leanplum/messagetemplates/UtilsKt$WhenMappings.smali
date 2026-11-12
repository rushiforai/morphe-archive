.class public final synthetic Lcom/leanplum/messagetemplates/UtilsKt$WhenMappings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/UtilsKt;
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
    xi = 0x530
.end annotation


# static fields
.field public static final synthetic $EnumSwitchMapping$0:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    invoke-static {}, Ljk6;->values()[Ljk6;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/4 v2, 0x2

    :try_start_9
    sget-object v3, Ljk6;->a:Ljk6;

    aput v1, v0, v2
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_d} :catch_d

    :catch_d
    :try_start_d
    sget-object v3, Ljk6;->a:Ljk6;

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_11} :catch_11

    :catch_11
    :try_start_11
    sget-object v1, Ljk6;->a:Ljk6;

    const/4 v1, 0x3

    aput v1, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_16} :catch_16

    :catch_16
    :try_start_16
    sget-object v1, Ljk6;->a:Ljk6;

    const/4 v1, 0x0

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_1c} :catch_1c

    :catch_1c
    sput-object v0, Lcom/leanplum/messagetemplates/UtilsKt$WhenMappings;->$EnumSwitchMapping$0:[I

    return-void
.end method
