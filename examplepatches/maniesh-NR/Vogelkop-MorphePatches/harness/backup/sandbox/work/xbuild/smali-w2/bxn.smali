.class public final enum Lbxn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lbxn;

.field public static final synthetic b:[Lbxn;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lbxn;

    const-string v1, "ASSET_RESOURCES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lbxn;

    const-string v2, "COMPOSE_RESOURCE_FILES"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbxn;->a:Lbxn;

    filled-new-array {v0, v1}, [Lbxn;

    move-result-object v0

    sput-object v0, Lbxn;->b:[Lbxn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbxn;
    .registers 2

    const-class v0, Lbxn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbxn;

    return-object p0
.end method

.method public static values()[Lbxn;
    .registers 1

    sget-object v0, Lbxn;->b:[Lbxn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbxn;

    return-object v0
.end method
