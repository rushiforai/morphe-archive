.class public final enum Lu4p;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lu4p;

.field public static final enum c:Lu4p;

.field public static final synthetic d:[Lu4p;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lu4p;

    const-string v1, "IMPRESSION"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lu4p;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lu4p;->b:Lu4p;

    new-instance v1, Lu4p;

    const-string v2, "VIEWABLE_MRC50"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lu4p;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lu4p;->c:Lu4p;

    filled-new-array {v0, v1}, [Lu4p;

    move-result-object v0

    sput-object v0, Lu4p;->d:[Lu4p;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lu4p;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lu4p;
    .registers 2

    const-class v0, Lu4p;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lu4p;

    return-object p0
.end method

.method public static values()[Lu4p;
    .registers 1

    sget-object v0, Lu4p;->d:[Lu4p;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lu4p;

    return-object v0
.end method
