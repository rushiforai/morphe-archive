.class public final enum Lcbh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lcbh;

.field public static final enum b:Lcbh;

.field public static final synthetic c:[Lcbh;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcbh;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcbh;->a:Lcbh;

    new-instance v1, Lcbh;

    const-string v2, "FAILURE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcbh;->b:Lcbh;

    filled-new-array {v0, v1}, [Lcbh;

    move-result-object v0

    sput-object v0, Lcbh;->c:[Lcbh;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcbh;
    .registers 2

    const-class v0, Lcbh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcbh;

    return-object p0
.end method

.method public static values()[Lcbh;
    .registers 1

    sget-object v0, Lcbh;->c:[Lcbh;

    invoke-virtual {v0}, [Lcbh;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcbh;

    return-object v0
.end method
