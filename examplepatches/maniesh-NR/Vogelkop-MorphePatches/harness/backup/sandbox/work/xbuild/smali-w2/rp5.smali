.class public final enum Lrp5;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lks2;


# static fields
.field public static final synthetic c:[Lrp5;

.field public static final synthetic d:Lh58;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Lnf2;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    new-instance v0, Lrp5;

    const-string v1, "additional-name"

    const-string v2, "personMiddleName"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lnf2;->c:Lnf2;

    const-string v3, "ADDITIONAL_NAME"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v1, Lrp5;

    const-string v3, "family-name"

    const-string v4, "personFamilyName"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    const-string v4, "FAMILY_NAME"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v3, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v3, Lrp5;

    const-string v4, "given-name"

    const-string v5, "personGivenName"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    const-string v5, "GIVEN_NAME"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v4, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v4, v3

    new-instance v3, Lrp5;

    const-string v5, "honorific-prefix"

    invoke-static {v5}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    const-string v6, "HONORIFIC_PREFIX"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v5, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v5, v4

    new-instance v4, Lrp5;

    const-string v6, "honorific-suffix"

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    const-string v7, "HONORIFIC_SUFFIX"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v6, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v6, v5

    new-instance v5, Lrp5;

    const-string v7, "name"

    filled-new-array {v7, v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const-string v8, "NAME"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v7, v2}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v2, v6

    new-instance v6, Lrp5;

    const-string v7, "tel"

    const-string v8, "phone"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    sget-object v8, Lnf2;->d:Lnf2;

    const-string v9, "PHONE"

    const/4 v10, 0x6

    invoke-direct {v6, v9, v10, v7, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v7, Lrp5;

    const-string v9, "tel-area-code"

    invoke-static {v9}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const-string v10, "PHONE_AREA_CODE"

    const/4 v11, 0x7

    invoke-direct {v7, v10, v11, v9, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v9, Lrp5;

    const-string v10, "tel-country-code"

    invoke-static {v10}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const-string v11, "PHONE_COUNTRY_CODE"

    const/16 v12, 0x8

    invoke-direct {v9, v11, v12, v10, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v10, v9

    new-instance v9, Lrp5;

    const-string v11, "tel-extension"

    invoke-static {v11}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    const-string v12, "PHONE_EXTENSION"

    const/16 v13, 0x9

    invoke-direct {v9, v12, v13, v11, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v11, v10

    new-instance v10, Lrp5;

    const-string v12, "tel-local"

    invoke-static {v12}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v12

    const-string v13, "PHONE_LOCAL"

    const/16 v14, 0xa

    invoke-direct {v10, v13, v14, v12, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v12, v11

    new-instance v11, Lrp5;

    const-string v13, "tel-local-prefix"

    invoke-static {v13}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v13

    const-string v14, "PHONE_LOCAL_PREFIX"

    const/16 v15, 0xb

    invoke-direct {v11, v14, v15, v13, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v13, v12

    new-instance v12, Lrp5;

    const-string v14, "tel-local-suffix"

    invoke-static {v14}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v14

    const-string v15, "PHONE_LOCAL_SUFFIX"

    move-object/from16 v16, v0

    const/16 v0, 0xc

    invoke-direct {v12, v15, v0, v14, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object v0, v13

    new-instance v13, Lrp5;

    const-string v14, "tel-national"

    invoke-static {v14}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v14

    const-string v15, "PHONE_NATIONAL"

    move-object/from16 v17, v0

    const/16 v0, 0xd

    invoke-direct {v13, v15, v0, v14, v8}, Lrp5;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    move-object/from16 v0, v16

    move-object/from16 v8, v17

    filled-new-array/range {v0 .. v13}, [Lrp5;

    move-result-object v0

    sput-object v0, Lrp5;->c:[Lrp5;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lrp5;->d:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lrp5;->a:Ljava/util/Set;

    iput-object p4, p0, Lrp5;->b:Lnf2;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrp5;
    .registers 2

    const-class v0, Lrp5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrp5;

    return-object p0
.end method

.method public static values()[Lrp5;
    .registers 1

    sget-object v0, Lrp5;->c:[Lrp5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrp5;

    return-object v0
.end method


# virtual methods
.method public final d()Lnf2;
    .registers 1

    iget-object p0, p0, Lrp5;->b:Lnf2;

    return-object p0
.end method

.method public final g()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Lrp5;->a:Ljava/util/Set;

    return-object p0
.end method
