.class public final enum Lmxg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmxg;

.field public static final enum b:Lmxg;

.field public static final synthetic c:[Lmxg;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lmxg;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmxg;->a:Lmxg;

    new-instance v1, Lmxg;

    const-string v2, "FAILURE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmxg;->b:Lmxg;

    filled-new-array {v0, v1}, [Lmxg;

    move-result-object v0

    sput-object v0, Lmxg;->c:[Lmxg;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmxg;
    .registers 2

    const-class v0, Lmxg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmxg;

    return-object p0
.end method

.method public static values()[Lmxg;
    .registers 1

    sget-object v0, Lmxg;->c:[Lmxg;

    invoke-virtual {v0}, [Lmxg;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmxg;

    return-object v0
.end method
