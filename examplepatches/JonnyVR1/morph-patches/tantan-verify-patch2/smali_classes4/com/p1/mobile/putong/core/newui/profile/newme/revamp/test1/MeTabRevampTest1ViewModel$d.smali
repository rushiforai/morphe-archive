.class public final synthetic Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = "d"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I

.field public static final synthetic c:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    invoke-static {}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->values()[Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->VIP:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v2, 0x2

    :try_start_1
    sget-object v3, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->SEE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aput v2, v0, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v3, 0x3

    :try_start_2
    sget-object v4, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->PREMIUM:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aput v3, v0, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/4 v4, 0x4

    :try_start_3
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;->ULTRA:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v4, v0, v5
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->a:[I

    invoke-static {}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->values()[Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_4
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_1:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v1, v0, v5
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_2:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v2, v0, v5
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_3:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v3, v0, v5
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->NUM_INF:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v4, v0, v5
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->CHECK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    const/4 v6, 0x5

    aput v6, v0, v5
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;->LOCK:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$BenefitValue;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    const/4 v6, 0x6

    aput v6, v0, v5
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->b:[I

    invoke-static {}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->values()[Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_a
    sget-object v5, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->BOOST:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aput v1, v0, v5
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    :catch_a
    :try_start_b
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    :catch_b
    :try_start_c
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->COMPLIMENT:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    :catch_c
    :try_start_d
    sget-object v1, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;->INSTANT_MATCH:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabIapType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aput v4, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    :catch_d
    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel$d;->c:[I

    return-void
.end method
