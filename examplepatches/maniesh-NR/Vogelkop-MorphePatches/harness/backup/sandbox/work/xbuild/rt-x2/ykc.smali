.class public final enum Lykc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic b:[Lykc;

.field public static final synthetic c:Lh58;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lykc;

    const/4 v1, 0x0

    const v2, 0x7f0d023b

    const-string v3, "SCHEDULED_MATCH"

    invoke-direct {v0, v3, v1, v2}, Lykc;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lykc;

    const/4 v2, 0x1

    const v3, 0x7f0d0237

    const-string v4, "LIVE_MATCH"

    invoke-direct {v1, v4, v2, v3}, Lykc;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lykc;

    const/4 v3, 0x2

    const v4, 0x7f0d0235

    const-string v5, "FINISHED_MATCH"

    invoke-direct {v2, v5, v3, v4}, Lykc;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lykc;

    const/4 v4, 0x3

    const v5, 0x7f0d0234

    const-string v6, "CANCELLED_MATCH"

    invoke-direct {v3, v6, v4, v5}, Lykc;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lykc;

    const/4 v5, 0x4

    const v6, 0x7f0d0236

    const-string v7, "INTERRUPTED_MATCH"

    invoke-direct {v4, v7, v5, v6}, Lykc;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2, v3, v4}, [Lykc;

    move-result-object v0

    sput-object v0, Lykc;->b:[Lykc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lykc;->c:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lykc;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lykc;
    .registers 2

    const-class v0, Lykc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lykc;

    return-object p0
.end method

.method public static values()[Lykc;
    .registers 1

    sget-object v0, Lykc;->b:[Lykc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lykc;

    return-object v0
.end method
