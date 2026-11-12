.class public final enum Ldtf;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lks2;


# static fields
.field public static final synthetic c:[Ldtf;

.field public static final synthetic d:Lh58;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Lnf2;


# direct methods
.method static constructor <clinit>()V
    .registers 17

    new-instance v0, Ldtf;

    const-string v1, "bday"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lnf2;->k:Lnf2;

    const-string v3, "BIRTH_DATE"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v1, Ldtf;

    const-string v3, "bday-day"

    invoke-static {v3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    const-string v4, "BIRTHDATE_DAY"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v3, v2}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v3, Ldtf;

    const-string v4, "bday-month"

    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    const-string v5, "BIRTHDATE_MONTH"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v4, v2}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v4, v3

    new-instance v3, Ldtf;

    const-string v5, "bday-year"

    invoke-static {v5}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    const-string v6, "BIRTHDATE_YEAR"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v5, v2}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v2, v4

    new-instance v4, Ldtf;

    const-string v5, "language"

    invoke-static {v5}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    sget-object v6, Lnf2;->n:Lnf2;

    const-string v7, "LANGUAGE"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v5, Ldtf;

    const-string v7, "nickname"

    invoke-static {v7}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const-string v8, "NICKNAME"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v7, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v7, Ldtf;

    const-string v8, "organization"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v8

    const-string v9, "ORGANIZATION"

    const/4 v10, 0x6

    invoke-direct {v7, v9, v10, v8, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v8, v7

    new-instance v7, Ldtf;

    const-string v9, "organization-title"

    invoke-static {v9}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const-string v10, "ORGANIZATION_TITLE"

    const/4 v11, 0x7

    invoke-direct {v7, v10, v11, v9, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v9, v8

    new-instance v8, Ldtf;

    const-string v10, "photo"

    invoke-static {v10}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const-string v11, "PHOTO"

    const/16 v12, 0x8

    invoke-direct {v8, v11, v12, v10, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v10, v9

    new-instance v9, Ldtf;

    const-string v11, "sex"

    invoke-static {v11}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    sget-object v12, Lnf2;->j:Lnf2;

    const-string v13, "SEX"

    const/16 v14, 0x9

    invoke-direct {v9, v13, v14, v11, v12}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v11, v10

    new-instance v10, Ldtf;

    const-string v12, "transaction-amount"

    invoke-static {v12}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v12

    const-string v13, "TRANSACTION_AMOUNT"

    const/16 v14, 0xa

    invoke-direct {v10, v13, v14, v12, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v12, v11

    new-instance v11, Ldtf;

    const-string v13, "transaction-currency"

    invoke-static {v13}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v13

    const-string v14, "TRANSACTION_CURRENCY"

    const/16 v15, 0xb

    invoke-direct {v11, v14, v15, v13, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v13, v12

    new-instance v12, Ldtf;

    const-string v14, "url"

    invoke-static {v14}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v14

    const-string v15, "URL"

    move-object/from16 v16, v0

    const/16 v0, 0xc

    invoke-direct {v12, v15, v0, v14, v6}, Ldtf;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v6, v13

    move-object/from16 v0, v16

    filled-new-array/range {v0 .. v12}, [Ldtf;

    move-result-object v0

    sput-object v0, Ldtf;->c:[Ldtf;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ldtf;->d:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ldtf;->a:Ljava/util/Set;

    iput-object p4, p0, Ldtf;->b:Lnf2;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldtf;
    .registers 2

    const-class v0, Ldtf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldtf;

    return-object p0
.end method

.method public static values()[Ldtf;
    .registers 1

    sget-object v0, Ldtf;->c:[Ldtf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldtf;

    return-object v0
.end method


# virtual methods
.method public final d()Lnf2;
    .registers 1

    iget-object p0, p0, Ldtf;->b:Lnf2;

    return-object p0
.end method

.method public final g()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Ldtf;->a:Ljava/util/Set;

    return-object p0
.end method
