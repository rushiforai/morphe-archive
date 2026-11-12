.class public final enum Lftd;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lftd;

.field public static final enum d:Lftd;

.field public static final synthetic e:[Lftd;


# instance fields
.field public final a:Lixh;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lftd;

    new-instance v1, Lixh;

    const/high16 v2, 0x40c00000    # 6.0f

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    const v2, 0x7f0402f3

    const-string v3, "NORMAL"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lftd;-><init>(Ljava/lang/String;ILixh;I)V

    sput-object v0, Lftd;->c:Lftd;

    new-instance v1, Lftd;

    new-instance v2, Lixh;

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {v2, v3}, Lixh;-><init>(F)V

    const v3, 0x7f0402f1

    const-string v4, "HIGH"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lftd;-><init>(Ljava/lang/String;ILixh;I)V

    sput-object v1, Lftd;->d:Lftd;

    filled-new-array {v0, v1}, [Lftd;

    move-result-object v0

    sput-object v0, Lftd;->e:[Lftd;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILixh;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lftd;->a:Lixh;

    iput p4, p0, Lftd;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lftd;
    .registers 2

    const-class v0, Lftd;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lftd;

    return-object p0
.end method

.method public static values()[Lftd;
    .registers 1

    sget-object v0, Lftd;->e:[Lftd;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lftd;

    return-object v0
.end method
