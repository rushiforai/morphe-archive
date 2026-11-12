.class public final enum Ladg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ladg;

.field public static final enum c:Ladg;

.field public static final synthetic d:[Ladg;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ladg;

    const/4 v1, 0x0

    const v2, 0x7f141077

    const-string v3, "ENABLED"

    invoke-direct {v0, v3, v1, v2}, Ladg;-><init>(Ljava/lang/String;II)V

    sput-object v0, Ladg;->b:Ladg;

    new-instance v1, Ladg;

    const/4 v2, 0x1

    const v3, 0x7f141076

    const-string v4, "DISABLED"

    invoke-direct {v1, v4, v2, v3}, Ladg;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ladg;->c:Ladg;

    filled-new-array {v0, v1}, [Ladg;

    move-result-object v0

    sput-object v0, Ladg;->d:[Ladg;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ladg;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ladg;
    .registers 2

    const-class v0, Ladg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ladg;

    return-object p0
.end method

.method public static values()[Ladg;
    .registers 1

    sget-object v0, Ladg;->d:[Ladg;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ladg;

    return-object v0
.end method
