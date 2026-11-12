.class public final enum Lijm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lijm;

.field public static final enum b:Lijm;

.field public static final synthetic c:[Lijm;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lijm;

    const-string v1, "CRITICAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lijm;->a:Lijm;

    new-instance v1, Lijm;

    const-string v2, "NORMAL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lijm;->b:Lijm;

    filled-new-array {v0, v1}, [Lijm;

    move-result-object v0

    sput-object v0, Lijm;->c:[Lijm;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lijm;
    .registers 2

    const-class v0, Lijm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lijm;

    return-object p0
.end method

.method public static values()[Lijm;
    .registers 1

    sget-object v0, Lijm;->c:[Lijm;

    invoke-virtual {v0}, [Lijm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lijm;

    return-object v0
.end method
