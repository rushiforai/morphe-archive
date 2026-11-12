.class public final enum Lb7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum c:Lb7j;

.field public static final enum d:Lb7j;

.field public static final synthetic e:[Lb7j;


# instance fields
.field public final a:I

.field public final b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lb7j;

    const/4 v1, 0x0

    const v2, 0x7f140f55

    const-string v3, "TOP"

    invoke-direct {v0, v1, v2, v1, v3}, Lb7j;-><init>(IIILjava/lang/String;)V

    sput-object v0, Lb7j;->c:Lb7j;

    new-instance v1, Lb7j;

    const/4 v2, 0x1

    const v3, 0x7f140f54

    const-string v4, "BOTTOM"

    invoke-direct {v1, v2, v3, v2, v4}, Lb7j;-><init>(IIILjava/lang/String;)V

    sput-object v1, Lb7j;->d:Lb7j;

    filled-new-array {v0, v1}, [Lb7j;

    move-result-object v0

    sput-object v0, Lb7j;->e:[Lb7j;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lb7j;->a:I

    iput-boolean p3, p0, Lb7j;->b:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb7j;
    .registers 2

    const-class v0, Lb7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb7j;

    return-object p0
.end method

.method public static values()[Lb7j;
    .registers 1

    sget-object v0, Lb7j;->e:[Lb7j;

    invoke-virtual {v0}, [Lb7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lb7j;->a:I

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
