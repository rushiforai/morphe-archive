.class public final enum Li7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final synthetic b:[Li7j;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Li7j;

    const-string v1, "ONE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Li7j;-><init>(Ljava/lang/String;II)V

    new-instance v1, Li7j;

    const-string v2, "TWO"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Li7j;-><init>(Ljava/lang/String;II)V

    new-instance v2, Li7j;

    const-string v3, "THREE"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Li7j;-><init>(Ljava/lang/String;II)V

    new-instance v3, Li7j;

    const-string v4, "FOUR"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Li7j;-><init>(Ljava/lang/String;II)V

    new-instance v4, Li7j;

    const-string v5, "FIVE"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Li7j;-><init>(Ljava/lang/String;II)V

    new-instance v5, Li7j;

    const-string v6, "UNLIMITED"

    const/4 v8, -0x1

    invoke-direct {v5, v6, v7, v8}, Li7j;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v5}, [Li7j;

    move-result-object v0

    sput-object v0, Li7j;->b:[Li7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Li7j;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Li7j;
    .registers 2

    const-class v0, Li7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Li7j;

    return-object p0
.end method

.method public static values()[Li7j;
    .registers 1

    sget-object v0, Li7j;->b:[Li7j;

    invoke-virtual {v0}, [Li7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Li7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 3

    const/4 v0, -0x1

    iget p0, p0, Li7j;->a:I

    if-ne p0, v0, :cond_d

    const p0, 0x7f140611

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

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

    iget p0, p0, Li7j;->a:I

    return p0
.end method
