.class public final enum Lj7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final synthetic b:[Lj7j;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lj7j;

    const/4 v1, 0x0

    const v2, 0x7f140fb1

    const-string v3, "DISABLED"

    invoke-direct {v0, v3, v1, v2}, Lj7j;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lj7j;

    const/4 v2, 0x1

    const v3, 0x7f140fb2

    const-string v4, "ENABLED"

    invoke-direct {v1, v4, v2, v3}, Lj7j;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lj7j;

    const/4 v3, 0x2

    const v4, 0x7f140fb3

    const-string v5, "ENABLED_NO_THIRD_PARTY"

    invoke-direct {v2, v5, v3, v4}, Lj7j;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2}, [Lj7j;

    move-result-object v0

    sput-object v0, Lj7j;->b:[Lj7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lj7j;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lj7j;
    .registers 2

    const-class v0, Lj7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lj7j;

    return-object p0
.end method

.method public static values()[Lj7j;
    .registers 1

    sget-object v0, Lj7j;->b:[Lj7j;

    invoke-virtual {v0}, [Lj7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lj7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lj7j;->a:I

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
