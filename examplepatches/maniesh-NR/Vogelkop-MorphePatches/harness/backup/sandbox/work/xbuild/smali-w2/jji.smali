.class public final enum Ljji;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ljji;

.field public static final enum c:Ljji;

.field public static final enum d:Ljji;

.field public static final synthetic e:[Ljji;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ljji;

    const/4 v1, 0x0

    const v2, 0x7f141069

    const-string v3, "ALWAYS"

    invoke-direct {v0, v3, v1, v2}, Ljji;-><init>(Ljava/lang/String;II)V

    sput-object v0, Ljji;->b:Ljji;

    new-instance v1, Ljji;

    const/4 v2, 0x1

    const v3, 0x7f14106a

    const-string v4, "ASK"

    invoke-direct {v1, v4, v2, v3}, Ljji;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ljji;->c:Ljji;

    new-instance v2, Ljji;

    const/4 v3, 0x2

    const v4, 0x7f14106b

    const-string v5, "NEVER"

    invoke-direct {v2, v5, v3, v4}, Ljji;-><init>(Ljava/lang/String;II)V

    sput-object v2, Ljji;->d:Ljji;

    filled-new-array {v0, v1, v2}, [Ljji;

    move-result-object v0

    sput-object v0, Ljji;->e:[Ljji;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ljji;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljji;
    .registers 2

    const-class v0, Ljji;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljji;

    return-object p0
.end method

.method public static values()[Ljji;
    .registers 1

    sget-object v0, Ljji;->e:[Ljji;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljji;

    return-object v0
.end method
