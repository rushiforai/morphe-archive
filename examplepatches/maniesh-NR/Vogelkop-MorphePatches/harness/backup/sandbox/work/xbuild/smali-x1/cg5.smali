.class public final enum Lcg5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lcg5;

.field public static final synthetic b:[Lcg5;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lcg5;

    const-string v1, "AlignTop"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lcg5;

    const-string v2, "AlignVerticalCenter"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lcg5;

    const-string v3, "AlignTopIfNotVisible"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v3, Lcg5;

    const-string v4, "AlignVerticalCenterIfNotVisible"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcg5;->a:Lcg5;

    filled-new-array {v0, v1, v2, v3}, [Lcg5;

    move-result-object v0

    sput-object v0, Lcg5;->b:[Lcg5;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcg5;
    .registers 2

    const-class v0, Lcg5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcg5;

    return-object p0
.end method

.method public static values()[Lcg5;
    .registers 1

    sget-object v0, Lcg5;->b:[Lcg5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcg5;

    return-object v0
.end method
