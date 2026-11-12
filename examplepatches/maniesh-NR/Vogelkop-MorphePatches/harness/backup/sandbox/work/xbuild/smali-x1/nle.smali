.class public final enum Lnle;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum e:Lnle;

.field public static final synthetic f:[Lnle;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lyqj;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lnle;

    new-instance v7, Lyqj;

    sget-object v1, Lwv;->Companion:Luv;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "0xefB84935239dAcdecF7c5bA76d8dE40b077B7b33"

    invoke-static {v1}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object v1

    const-string v2, "0x0aD5b1d0C25ecF6266Dd951403723B2687d6aff2"

    invoke-static {v2}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object v2

    invoke-direct {v7, v1, v2}, Lyqj;-><init>(Lwv;Lwv;)V

    const-string v1, "MAIN"

    const/4 v2, 0x0

    const-wide/32 v3, 0xa4ec

    const-string v5, "https://celo-rpc-mainnet-2.satoshi.opera-api.com"

    const-string v6, "https://crypto-gateway.satoshi.opera-api.com/celo-phone-validator/"

    invoke-direct/range {v0 .. v7}, Lnle;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Lyqj;)V

    sput-object v0, Lnle;->e:Lnle;

    new-instance v1, Lnle;

    new-instance v8, Lyqj;

    const-string v2, "0xAb077999e5fA13bCda1599926F8927dDEADe533C"

    invoke-static {v2}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object v2

    const-string v3, "0xb0Fe4466f288A3BbE5C2736B081B2021080DF703"

    invoke-static {v3}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object v3

    invoke-direct {v8, v2, v3}, Lyqj;-><init>(Lwv;Lwv;)V

    const-string v2, "TEST"

    const/4 v3, 0x1

    const-wide/32 v4, 0xaa044c

    const-string v6, "https://forno.celo-sepolia.celo-testnet.org"

    const-string v7, "https://crypto-gateway-staging.satoshi.opera-api.com/celo-phone-validator/"

    invoke-direct/range {v1 .. v8}, Lnle;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Lyqj;)V

    filled-new-array {v0, v1}, [Lnle;

    move-result-object v0

    sput-object v0, Lnle;->f:[Lnle;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Lyqj;)V
    .registers 8

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    long-to-int p1, p3

    iput p1, p0, Lnle;->a:I

    iput-object p5, p0, Lnle;->b:Ljava/lang/String;

    iput-object p6, p0, Lnle;->c:Ljava/lang/String;

    iput-object p7, p0, Lnle;->d:Lyqj;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnle;
    .registers 2

    const-class v0, Lnle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnle;

    return-object p0
.end method

.method public static values()[Lnle;
    .registers 1

    sget-object v0, Lnle;->f:[Lnle;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnle;

    return-object v0
.end method
