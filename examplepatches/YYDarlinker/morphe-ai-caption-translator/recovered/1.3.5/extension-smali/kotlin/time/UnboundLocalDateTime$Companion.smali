.class public final Lkotlin/time/UnboundLocalDateTime$Companion;
.super Ljava/lang/Object;
.source "Instant.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/UnboundLocalDateTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0086\u0080\u0004\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/time/UnboundLocalDateTime$Companion;",
        "",
        "<init>",
        "()V",
        "fromInstant",
        "Lkotlin/time/UnboundLocalDateTime;",
        "instant",
        "Lkotlin/time/Instant;",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lkotlin/time/UnboundLocalDateTime$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromInstant(Lkotlin/time/Instant;)Lkotlin/time/UnboundLocalDateTime;
    .registers 26

    const-string v0, "instant"

    move-object/from16 v1, p1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 525
    invoke-virtual {v1}, Lkotlin/time/Instant;->getEpochSeconds()J

    move-result-wide v2

    const-wide/32 v4, 0x15180

    .line 526
    div-long v6, v2, v4

    xor-long v8, v2, v4

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    const-wide/16 v8, -0x1

    if-gez v0, :cond_21

    mul-long v12, v6, v4

    cmp-long v0, v12, v2

    if-eqz v0, :cond_21

    add-long/2addr v6, v8

    .line 527
    :cond_21
    rem-long/2addr v2, v4

    xor-long v12, v2, v4

    neg-long v14, v2

    or-long/2addr v14, v2

    and-long/2addr v12, v14

    const/16 v0, 0x3f

    shr-long/2addr v12, v0

    and-long/2addr v4, v12

    add-long/2addr v2, v4

    long-to-int v0, v2

    .line 532
    move-object/from16 v2, p0

    check-cast v2, Lkotlin/time/UnboundLocalDateTime$Companion;

    const-wide/32 v2, 0xafa6c

    add-long/2addr v2, v6

    cmp-long v4, v2, v10

    const-wide/32 v12, 0x23ab1

    const-wide/16 v14, 0x190

    if-gez v4, :cond_4c

    const-wide/32 v4, 0xafa6d

    add-long/2addr v6, v4

    .line 539
    div-long/2addr v6, v12

    const-wide/16 v4, 0x1

    sub-long/2addr v6, v4

    mul-long v4, v6, v14

    neg-long v6, v6

    mul-long/2addr v6, v12

    add-long/2addr v2, v6

    goto :goto_4d

    :cond_4c
    move-wide v4, v10

    :goto_4d
    mul-long v6, v14, v2

    const-wide/16 v16, 0x24f

    add-long v6, v6, v16

    .line 543
    div-long/2addr v6, v12

    const-wide/16 v12, 0x16d

    mul-long v16, v12, v6

    const-wide/16 v18, 0x4

    .line 544
    div-long v20, v6, v18

    add-long v16, v16, v20

    const-wide/16 v20, 0x64

    div-long v22, v6, v20

    sub-long v16, v16, v22

    div-long v22, v6, v14

    add-long v16, v16, v22

    sub-long v16, v2, v16

    cmp-long v10, v16, v10

    if-gez v10, :cond_7b

    add-long/2addr v6, v8

    mul-long/2addr v12, v6

    .line 547
    div-long v8, v6, v18

    add-long/2addr v12, v8

    div-long v8, v6, v20

    sub-long/2addr v12, v8

    div-long v8, v6, v14

    add-long/2addr v12, v8

    sub-long v16, v2, v12

    :cond_7b
    move-wide/from16 v2, v16

    add-long/2addr v6, v4

    long-to-int v2, v2

    mul-int/lit8 v3, v2, 0x5

    add-int/lit8 v3, v3, 0x2

    .line 554
    div-int/lit16 v3, v3, 0x99

    add-int/lit8 v4, v3, 0x2

    .line 555
    rem-int/lit8 v4, v4, 0xc

    add-int/lit8 v10, v4, 0x1

    mul-int/lit16 v4, v3, 0x132

    add-int/lit8 v4, v4, 0x5

    .line 556
    div-int/lit8 v4, v4, 0xa

    sub-int/2addr v2, v4

    add-int/lit8 v11, v2, 0x1

    .line 557
    div-int/lit8 v3, v3, 0xa

    int-to-long v2, v3

    add-long/2addr v6, v2

    long-to-int v9, v6

    .line 559
    div-int/lit16 v12, v0, 0xe10

    mul-int/lit16 v2, v12, 0xe10

    sub-int/2addr v0, v2

    .line 561
    div-int/lit8 v13, v0, 0x3c

    mul-int/lit8 v2, v13, 0x3c

    sub-int v14, v0, v2

    .line 563
    new-instance v8, Lkotlin/time/UnboundLocalDateTime;

    invoke-virtual {v1}, Lkotlin/time/Instant;->getNanosecondsOfSecond()I

    move-result v15

    invoke-direct/range {v8 .. v15}, Lkotlin/time/UnboundLocalDateTime;-><init>(IIIIIII)V

    return-object v8
.end method
