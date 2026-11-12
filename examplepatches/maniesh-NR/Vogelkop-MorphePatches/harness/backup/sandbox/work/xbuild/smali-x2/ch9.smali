.class public final enum Lch9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lch9;

.field public static final enum b:Lch9;

.field public static final enum c:Lch9;

.field public static final synthetic d:[Lch9;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lch9;

    const-string v1, "WEB"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch9;->a:Lch9;

    new-instance v1, Lch9;

    const-string v2, "START_PAGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lch9;->b:Lch9;

    new-instance v2, Lch9;

    const-string v3, "DEEP_LINK"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lch9;->c:Lch9;

    filled-new-array {v0, v1, v2}, [Lch9;

    move-result-object v0

    sput-object v0, Lch9;->d:[Lch9;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lch9;
    .registers 2

    const-class v0, Lch9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lch9;

    return-object p0
.end method

.method public static values()[Lch9;
    .registers 1

    sget-object v0, Lch9;->d:[Lch9;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch9;

    return-object v0
.end method
