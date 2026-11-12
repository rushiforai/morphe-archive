.class public final Liuc;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Liuc;

.field public static final FREE_ESIM_ELIGIBILITY_FIELD_NUMBER:I = 0x1

.field public static final HAS_SEEN_ONBOARDING_FIELD_NUMBER:I = 0x6

.field public static final LAST_PROMOTED_COUNTRY_CODE_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final PLANS_FIELD_NUMBER:I = 0x4

.field public static final PLAN_METADATA_FIELD_NUMBER:I = 0x5

.field public static final USER_PLAN_STATE_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private freeEsimEligibility_:I

.field private hasSeenOnboarding_:Z

.field private lastPromotedCountryCode_:Ljava/lang/String;

.field private planMetadata_:Lfad;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lfad;"
        }
    .end annotation
.end field

.field private plans_:Lfad;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lfad;"
        }
    .end annotation
.end field

.field private userPlanState_:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Liuc;

    invoke-direct {v0}, Liuc;-><init>()V

    sput-object v0, Liuc;->DEFAULT_INSTANCE:Liuc;

    const-class v1, Liuc;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lgv9;-><init>()V

    invoke-static {}, Lfad;->emptyMapField()Lfad;

    move-result-object v0

    iput-object v0, p0, Liuc;->plans_:Lfad;

    invoke-static {}, Lfad;->emptyMapField()Lfad;

    move-result-object v0

    iput-object v0, p0, Liuc;->planMetadata_:Lfad;

    const-string v0, ""

    iput-object v0, p0, Liuc;->lastPromotedCountryCode_:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic a()Liuc;
    .registers 1

    sget-object v0, Liuc;->DEFAULT_INSTANCE:Liuc;

    return-object v0
.end method

.method public static d()Liuc;
    .registers 1

    sget-object v0, Liuc;->DEFAULT_INSTANCE:Liuc;

    return-object v0
.end method

.method public static n(Ljava/io/InputStream;)Liuc;
    .registers 2

    sget-object v0, Liuc;->DEFAULT_INSTANCE:Liuc;

    invoke-static {v0, p0}, Lgv9;->parseFrom(Lgv9;Ljava/io/InputStream;)Lgv9;

    move-result-object p0

    check-cast p0, Liuc;

    return-object p0
.end method


# virtual methods
.method public final b()V
    .registers 2

    iget v0, p0, Liuc;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Liuc;->bitField0_:I

    const/4 v0, 0x0

    iput v0, p0, Liuc;->freeEsimEligibility_:I

    return-void
.end method

.method public final c()V
    .registers 2

    iget v0, p0, Liuc;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Liuc;->bitField0_:I

    sget-object v0, Liuc;->DEFAULT_INSTANCE:Liuc;

    iget-object v0, v0, Liuc;->lastPromotedCountryCode_:Ljava/lang/String;

    iput-object v0, p0, Liuc;->lastPromotedCountryCode_:Ljava/lang/String;

    return-void
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    sget-object p0, Leuc;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_62

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Liuc;->PARSER:Lp1g;

    if-nez p0, :cond_2e

    const-class p1, Liuc;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Liuc;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Liuc;->DEFAULT_INSTANCE:Liuc;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Liuc;->PARSER:Lp1g;

    :cond_27
    monitor-exit p1

    return-object p0

    :goto_29
    monitor-exit p1
    :try_end_2a
    .catchall {:try_start_1a .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception v0

    move-object p0, v0

    goto :goto_29

    :cond_2e
    return-object p0

    :pswitch_2f
    sget-object p0, Liuc;->DEFAULT_INSTANCE:Liuc;

    return-object p0

    :pswitch_32
    const-string p0, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0002\u0000\u0000\u0001\u100c\u0000\u0002\u1208\u0001\u0003\u100c\u0002\u00042\u00052\u0006\u1007\u0003"

    sget-object p1, Liuc;->DEFAULT_INSTANCE:Liuc;

    const-string v0, "bitField0_"

    const-string v1, "freeEsimEligibility_"

    const-string v2, "lastPromotedCountryCode_"

    const-string v3, "userPlanState_"

    const-string v4, "plans_"

    sget-object v5, Lhuc;->a:Laad;

    const-string v6, "planMetadata_"

    sget-object v7, Lguc;->a:Laad;

    const-string v8, "hasSeenOnboarding_"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_51
    new-instance p0, Lfuc;

    invoke-static {}, Liuc;->a()Liuc;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_5b
    new-instance p0, Liuc;

    invoke-direct {p0}, Liuc;-><init>()V

    return-object p0

    nop

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_51
        :pswitch_32
        :pswitch_2f
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()Lsuc;
    .registers 2

    iget p0, p0, Liuc;->freeEsimEligibility_:I

    if-eqz p0, :cond_18

    const/4 v0, 0x1

    if-eq p0, v0, :cond_15

    const/4 v0, 0x2

    if-eq p0, v0, :cond_12

    const/4 v0, 0x3

    if-eq p0, v0, :cond_f

    const/4 p0, 0x0

    goto :goto_1a

    :cond_f
    sget-object p0, Lsuc;->e:Lsuc;

    goto :goto_1a

    :cond_12
    sget-object p0, Lsuc;->d:Lsuc;

    goto :goto_1a

    :cond_15
    sget-object p0, Lsuc;->c:Lsuc;

    goto :goto_1a

    :cond_18
    sget-object p0, Lsuc;->b:Lsuc;

    :goto_1a
    if-nez p0, :cond_1e

    sget-object p0, Lsuc;->f:Lsuc;

    :cond_1e
    return-object p0
.end method

.method public final f()Z
    .registers 1

    iget-boolean p0, p0, Liuc;->hasSeenOnboarding_:Z

    return p0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Liuc;->lastPromotedCountryCode_:Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/util/Map;
    .registers 1

    iget-object p0, p0, Liuc;->planMetadata_:Lfad;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public final i(Ljava/lang/String;Louc;)Louc;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Liuc;->planMetadata_:Lfad;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Louc;

    if-eqz p0, :cond_e

    return-object p0

    :cond_e
    return-object p2
.end method

.method public final j()Ljava/util/Map;
    .registers 1

    iget-object p0, p0, Liuc;->plans_:Lfad;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public final k()Lpuc;
    .registers 2

    iget p0, p0, Liuc;->userPlanState_:I

    if-eqz p0, :cond_12

    const/4 v0, 0x1

    if-eq p0, v0, :cond_f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_c

    const/4 p0, 0x0

    goto :goto_14

    :cond_c
    sget-object p0, Lpuc;->d:Lpuc;

    goto :goto_14

    :cond_f
    sget-object p0, Lpuc;->c:Lpuc;

    goto :goto_14

    :cond_12
    sget-object p0, Lpuc;->b:Lpuc;

    :goto_14
    if-nez p0, :cond_18

    sget-object p0, Lpuc;->e:Lpuc;

    :cond_18
    return-object p0
.end method

.method public final l()Lfad;
    .registers 2

    iget-object v0, p0, Liuc;->planMetadata_:Lfad;

    invoke-virtual {v0}, Lfad;->isMutable()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Liuc;->planMetadata_:Lfad;

    invoke-virtual {v0}, Lfad;->mutableCopy()Lfad;

    move-result-object v0

    iput-object v0, p0, Liuc;->planMetadata_:Lfad;

    :cond_10
    iget-object p0, p0, Liuc;->planMetadata_:Lfad;

    return-object p0
.end method

.method public final m()Lfad;
    .registers 2

    iget-object v0, p0, Liuc;->plans_:Lfad;

    invoke-virtual {v0}, Lfad;->isMutable()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Liuc;->plans_:Lfad;

    invoke-virtual {v0}, Lfad;->mutableCopy()Lfad;

    move-result-object v0

    iput-object v0, p0, Liuc;->plans_:Lfad;

    :cond_10
    iget-object p0, p0, Liuc;->plans_:Lfad;

    return-object p0
.end method

.method public final o(Lsuc;)V
    .registers 2

    invoke-virtual {p1}, Lsuc;->getNumber()I

    move-result p1

    iput p1, p0, Liuc;->freeEsimEligibility_:I

    iget p1, p0, Liuc;->bitField0_:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Liuc;->bitField0_:I

    return-void
.end method

.method public final p()V
    .registers 2

    iget v0, p0, Liuc;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Liuc;->bitField0_:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Liuc;->hasSeenOnboarding_:Z

    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Liuc;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Liuc;->bitField0_:I

    iput-object p1, p0, Liuc;->lastPromotedCountryCode_:Ljava/lang/String;

    return-void
.end method

.method public final r(Lpuc;)V
    .registers 2

    invoke-virtual {p1}, Lpuc;->getNumber()I

    move-result p1

    iput p1, p0, Liuc;->userPlanState_:I

    iget p1, p0, Liuc;->bitField0_:I

    or-int/lit8 p1, p1, 0x4

    iput p1, p0, Liuc;->bitField0_:I

    return-void
.end method
