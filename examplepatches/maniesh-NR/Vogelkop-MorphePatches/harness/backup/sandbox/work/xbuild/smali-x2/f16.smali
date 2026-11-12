.class public final enum Lf16;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lks2;


# static fields
.field public static final synthetic b:[Lf16;

.field public static final synthetic c:Lh58;


# instance fields
.field public final a:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    new-instance v0, Lf16;

    const-string v1, "cc-additional-name"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lnf2;->b:Lnf2;

    const/4 v2, 0x0

    const-string v3, "CREDIT_CARD_ADDITIONAL_NAME"

    invoke-direct {v0, v1, v2, v3}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v1, Lf16;

    const-string v2, "cc-csc"

    const-string v3, "creditCardSecurityCode"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    const/4 v3, 0x1

    const-string v4, "CREDIT_CARD_CSC"

    invoke-direct {v1, v2, v3, v4}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v2, Lf16;

    const-string v3, "cc-exp"

    const-string v4, "creditCardExpirationDate"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    const/4 v4, 0x2

    const-string v5, "CREDIT_CARD_EXPIRATION_DATE"

    invoke-direct {v2, v3, v4, v5}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v3, Lf16;

    const-string v4, "creditCardExpirationDay"

    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    const/4 v5, 0x3

    const-string v6, "CREDIT_CARD_EXPIRATION_DATE_DAY"

    invoke-direct {v3, v4, v5, v6}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v4, Lf16;

    const-string v5, "cc-exp-month"

    const-string v6, "creditCardExpirationMonth"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    const/4 v6, 0x4

    const-string v7, "CREDIT_CARD_EXPIRATION_DATE_MONTH"

    invoke-direct {v4, v5, v6, v7}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v5, Lf16;

    const-string v6, "cc-exp-year"

    const-string v7, "creditCardExpirationYear"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    const/4 v7, 0x5

    const-string v8, "CREDIT_CARD_EXPIRATION_DATE_YEAR"

    invoke-direct {v5, v6, v7, v8}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v6, Lf16;

    const-string v7, "cc-family-name"

    invoke-static {v7}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const/4 v8, 0x6

    const-string v9, "CREDIT_CARD_FAMILY_NAME"

    invoke-direct {v6, v7, v8, v9}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v7, Lf16;

    const-string v8, "cc-given-name"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v8

    const/4 v9, 0x7

    const-string v10, "CREDIT_CARD_GIVEN_NAME"

    invoke-direct {v7, v8, v9, v10}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v8, Lf16;

    const-string v9, "cc-name"

    invoke-static {v9}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const/16 v10, 0x8

    const-string v11, "CREDIT_CARD_NAME"

    invoke-direct {v8, v9, v10, v11}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v9, Lf16;

    const-string v10, "cc-number"

    const-string v11, "creditCardNumber"

    filled-new-array {v10, v11}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const/16 v11, 0x9

    const-string v12, "CREDIT_CARD_NUMBER"

    invoke-direct {v9, v10, v11, v12}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v10, Lf16;

    const-string v11, "cc-type"

    invoke-static {v11}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    const/16 v12, 0xa

    const-string v13, "CREDIT_CARD_TYPE"

    invoke-direct {v10, v11, v12, v13}, Lf16;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v10}, [Lf16;

    move-result-object v0

    sput-object v0, Lf16;->b:[Lf16;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lf16;->c:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;ILjava/lang/String;)V
    .registers 5

    sget-object v0, Lnf2;->b:Lnf2;

    invoke-direct {p0, p3, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lf16;->a:Ljava/util/Set;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf16;
    .registers 2

    const-class v0, Lf16;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf16;

    return-object p0
.end method

.method public static values()[Lf16;
    .registers 1

    sget-object v0, Lf16;->b:[Lf16;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf16;

    return-object v0
.end method


# virtual methods
.method public final d()Lnf2;
    .registers 1

    sget-object p0, Lnf2;->i:Lnf2;

    return-object p0
.end method

.method public final g()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Lf16;->a:Ljava/util/Set;

    return-object p0
.end method
