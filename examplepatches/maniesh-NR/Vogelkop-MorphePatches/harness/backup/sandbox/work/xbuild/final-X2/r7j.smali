.class public final enum Lr7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum b:Lr7j;

.field public static final enum c:Lr7j;

.field public static final enum d:Lr7j;

.field public static final synthetic e:[Lr7j;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lr7j;

    const/4 v1, 0x0

    const v2, 0x7f140fec

    const-string v3, "NEVER"

    invoke-direct {v0, v3, v1, v2}, Lr7j;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lr7j;->b:Lr7j;

    new-instance v1, Lr7j;

    const/4 v2, 0x1

    const v3, 0x7f140fee

    const-string v4, "BOTH"

    invoke-direct {v1, v4, v2, v3}, Lr7j;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lr7j;->c:Lr7j;

    new-instance v2, Lr7j;

    const/4 v3, 0x2

    const v4, 0x7f140fed

    const-string v5, "ONLY_ADDRESS_BAR"

    invoke-direct {v2, v5, v3, v4}, Lr7j;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lr7j;->d:Lr7j;

    filled-new-array {v0, v1, v2}, [Lr7j;

    move-result-object v0

    sput-object v0, Lr7j;->e:[Lr7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lr7j;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lr7j;
    .registers 2

    const-class v0, Lr7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lr7j;

    return-object p0
.end method

.method public static values()[Lr7j;
    .registers 1

    sget-object v0, Lr7j;->e:[Lr7j;

    invoke-virtual {v0}, [Lr7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lr7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lr7j;->a:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getDescription()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getIcon()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getValue()I
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    return p0
.end method
