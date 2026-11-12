.class public final enum Lnpk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnpk;

.field public static final enum b:Lnpk;

.field public static final synthetic c:[Lnpk;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnpk;

    const-string v1, "LOADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnpk;->a:Lnpk;

    new-instance v1, Lnpk;

    const-string v2, "DATA"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnpk;->b:Lnpk;

    filled-new-array {v0, v1}, [Lnpk;

    move-result-object v0

    sput-object v0, Lnpk;->c:[Lnpk;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnpk;
    .registers 2

    const-class v0, Lnpk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnpk;

    return-object p0
.end method

.method public static values()[Lnpk;
    .registers 1

    sget-object v0, Lnpk;->c:[Lnpk;

    invoke-virtual {v0}, [Lnpk;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnpk;

    return-object v0
.end method
