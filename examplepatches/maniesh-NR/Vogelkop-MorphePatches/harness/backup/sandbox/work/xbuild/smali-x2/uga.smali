.class public final enum Luga;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Luga;

.field public static final enum b:Luga;

.field public static final enum c:Luga;

.field public static final synthetic d:[Luga;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Luga;

    const-string v1, "WidthCompact"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Luga;->a:Luga;

    new-instance v1, Luga;

    const-string v2, "WidthMedium"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Luga;->b:Luga;

    new-instance v2, Luga;

    const-string v3, "WidthExpanded"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Luga;->c:Luga;

    filled-new-array {v0, v1, v2}, [Luga;

    move-result-object v0

    sput-object v0, Luga;->d:[Luga;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Luga;
    .registers 2

    const-class v0, Luga;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Luga;

    return-object p0
.end method

.method public static values()[Luga;
    .registers 1

    sget-object v0, Luga;->d:[Luga;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Luga;

    return-object v0
.end method
