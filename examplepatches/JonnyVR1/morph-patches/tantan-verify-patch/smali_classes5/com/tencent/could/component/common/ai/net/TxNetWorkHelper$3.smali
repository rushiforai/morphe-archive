.class public synthetic Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;->values()[Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    :try_start_0
    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    :catch_0
    :try_start_1
    sget-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    aput v2, v0, v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 18
    .line 19
    :catch_1
    const/4 v0, 0x3

    .line 20
    :try_start_2
    sget-object v2, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 21
    .line 22
    aput v0, v2, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 23
    .line 24
    :catch_2
    :try_start_3
    sget-object v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 25
    .line 26
    const/4 v2, 0x4

    .line 27
    aput v2, v1, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 28
    .line 29
    :catch_3
    :try_start_4
    sget-object v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 30
    .line 31
    const/4 v2, 0x5

    .line 32
    aput v2, v1, v2
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 33
    .line 34
    :catch_4
    :try_start_5
    sget-object v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$3;->a:[I

    .line 35
    .line 36
    const/4 v2, 0x6

    .line 37
    aput v2, v1, v0
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 38
    .line 39
    :catch_5
    return-void
.end method
