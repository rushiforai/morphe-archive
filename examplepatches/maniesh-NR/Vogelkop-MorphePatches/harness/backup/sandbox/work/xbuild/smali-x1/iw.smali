.class public final enum Liw;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lks2;


# static fields
.field public static final synthetic b:[Liw;

.field public static final synthetic c:Lh58;


# instance fields
.field public final a:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    new-instance v0, Liw;

    const-string v1, "address-level1"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lnf2;->b:Lnf2;

    const/4 v2, 0x0

    const-string v3, "ADDRESS_LEVEL_1"

    invoke-direct {v0, v1, v2, v3}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v1, Liw;

    const-string v2, "address-level2"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    const/4 v3, 0x1

    const-string v4, "ADDRESS_LEVEL_2"

    invoke-direct {v1, v2, v3, v4}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v2, Liw;

    const-string v3, "address-level3"

    invoke-static {v3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    const/4 v4, 0x2

    const-string v5, "ADDRESS_LEVEL_3"

    invoke-direct {v2, v3, v4, v5}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v3, Liw;

    const-string v4, "address-level4"

    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    const/4 v5, 0x3

    const-string v6, "ADDRESS_LEVEL_4"

    invoke-direct {v3, v4, v5, v6}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v4, Liw;

    const-string v5, "address-line1"

    invoke-static {v5}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    const/4 v6, 0x4

    const-string v7, "ADDRESS_LINE_1"

    invoke-direct {v4, v5, v6, v7}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v5, Liw;

    const-string v6, "address-line2"

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    const/4 v7, 0x5

    const-string v8, "ADDRESS_LINE_2"

    invoke-direct {v5, v6, v7, v8}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v6, Liw;

    const-string v7, "address-line3"

    invoke-static {v7}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const/4 v8, 0x6

    const-string v9, "ADDRESS_LINE_3"

    invoke-direct {v6, v7, v8, v9}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v7, Liw;

    const-string v8, "country"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v8

    const/4 v9, 0x7

    const-string v10, "COUNTRY"

    invoke-direct {v7, v8, v9, v10}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v8, Liw;

    const-string v9, "country-name"

    invoke-static {v9}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const/16 v10, 0x8

    const-string v11, "COUNTRY_NAME"

    invoke-direct {v8, v9, v10, v11}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v9, Liw;

    const-string v10, "postalCode"

    invoke-static {v10}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const/16 v11, 0x9

    const-string v12, "POSTAL_CODE"

    invoke-direct {v9, v10, v11, v12}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    new-instance v10, Liw;

    const-string v11, "street-address"

    const-string v12, "postalAddress"

    filled-new-array {v11, v12}, [Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    const/16 v12, 0xa

    const-string v13, "STREET_ADDRESS"

    invoke-direct {v10, v11, v12, v13}, Liw;-><init>(Ljava/util/Set;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v10}, [Liw;

    move-result-object v0

    sput-object v0, Liw;->b:[Liw;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Liw;->c:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;ILjava/lang/String;)V
    .registers 5

    sget-object v0, Lnf2;->b:Lnf2;

    invoke-direct {p0, p3, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Liw;->a:Ljava/util/Set;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Liw;
    .registers 2

    const-class v0, Liw;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Liw;

    return-object p0
.end method

.method public static values()[Liw;
    .registers 1

    sget-object v0, Liw;->b:[Liw;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Liw;

    return-object v0
.end method


# virtual methods
.method public final d()Lnf2;
    .registers 1

    sget-object p0, Lnf2;->b:Lnf2;

    return-object p0
.end method

.method public final g()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Liw;->a:Ljava/util/Set;

    return-object p0
.end method
