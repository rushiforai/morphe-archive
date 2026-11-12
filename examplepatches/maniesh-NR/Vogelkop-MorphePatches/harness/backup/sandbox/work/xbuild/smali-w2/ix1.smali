.class public final enum Lix1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lix1;

.field public static final enum b:Lix1;

.field public static final synthetic c:[Lix1;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lix1;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lix1;->a:Lix1;

    new-instance v1, Lix1;

    const-string v2, "FAILURE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lix1;->b:Lix1;

    filled-new-array {v0, v1}, [Lix1;

    move-result-object v0

    sput-object v0, Lix1;->c:[Lix1;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lix1;
    .registers 2

    const-class v0, Lix1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lix1;

    return-object p0
.end method

.method public static values()[Lix1;
    .registers 1

    sget-object v0, Lix1;->c:[Lix1;

    invoke-virtual {v0}, [Lix1;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lix1;

    return-object v0
.end method
