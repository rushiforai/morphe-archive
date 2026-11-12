.class public final enum Lp7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum c:Lp7j;

.field public static final d:Lp7j;

.field public static final synthetic e:[Lp7j;


# instance fields
.field public final a:I

.field public final b:B


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lp7j;

    const/4 v1, 0x0

    const v2, 0x7f1410f3

    const-string v3, "SQUIRCLE"

    invoke-direct {v0, v1, v2, v1, v3}, Lp7j;-><init>(IIILjava/lang/String;)V

    new-instance v1, Lp7j;

    const/4 v2, 0x1

    const v3, 0x7f1410f1

    const-string v4, "CIRCLE"

    invoke-direct {v1, v2, v3, v2, v4}, Lp7j;-><init>(IIILjava/lang/String;)V

    sput-object v1, Lp7j;->c:Lp7j;

    new-instance v2, Lp7j;

    const v3, 0x7f1410f2

    const/4 v4, 0x3

    const/4 v5, 0x2

    const-string v6, "ROUNDED_SQUARE"

    invoke-direct {v2, v5, v3, v4, v6}, Lp7j;-><init>(IIILjava/lang/String;)V

    filled-new-array {v0, v1, v2}, [Lp7j;

    move-result-object v1

    sput-object v1, Lp7j;->e:[Lp7j;

    sput-object v0, Lp7j;->d:Lp7j;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lp7j;->a:I

    iput-byte p3, p0, Lp7j;->b:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lp7j;
    .registers 2

    const-class v0, Lp7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lp7j;

    return-object p0
.end method

.method public static values()[Lp7j;
    .registers 1

    sget-object v0, Lp7j;->e:[Lp7j;

    invoke-virtual {v0}, [Lp7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lp7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lp7j;->a:I

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
