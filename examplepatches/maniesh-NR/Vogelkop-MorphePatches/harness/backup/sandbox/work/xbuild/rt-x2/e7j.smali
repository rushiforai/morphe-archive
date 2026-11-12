.class public final enum Le7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum c:Le7j;

.field public static final enum d:Le7j;

.field public static final synthetic e:[Le7j;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Le7j;

    const v1, 0x7f140f6a

    const v2, 0x7f140f6b

    const/4 v3, 0x0

    const-string v4, "CLASSIC"

    invoke-direct {v0, v3, v1, v2, v4}, Le7j;-><init>(IIILjava/lang/String;)V

    sput-object v0, Le7j;->c:Le7j;

    new-instance v1, Le7j;

    const v2, 0x7f140f6c

    const v3, 0x7f140f6d

    const/4 v4, 0x1

    const-string v5, "TABLET"

    invoke-direct {v1, v4, v2, v3, v5}, Le7j;-><init>(IIILjava/lang/String;)V

    sput-object v1, Le7j;->d:Le7j;

    filled-new-array {v0, v1}, [Le7j;

    move-result-object v0

    sput-object v0, Le7j;->e:[Le7j;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Le7j;->a:I

    iput p2, p0, Le7j;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Le7j;
    .registers 2

    const-class v0, Le7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Le7j;

    return-object p0
.end method

.method public static values()[Le7j;
    .registers 1

    sget-object v0, Le7j;->e:[Le7j;

    invoke-virtual {v0}, [Le7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Le7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Le7j;->b:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getDescription()I
    .registers 1

    iget p0, p0, Le7j;->a:I

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
