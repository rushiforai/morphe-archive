.class public final enum Ls7j;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum b:Ls7j;

.field public static final enum c:Ls7j;

.field public static final synthetic d:[Ls7j;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ls7j;

    const/4 v1, 0x0

    const v2, 0x7f1410e4

    const-string v3, "MOBILE"

    invoke-direct {v0, v3, v1, v2}, Ls7j;-><init>(Ljava/lang/String;II)V

    sput-object v0, Ls7j;->b:Ls7j;

    new-instance v1, Ls7j;

    const/4 v2, 0x1

    const v3, 0x7f1410e3

    const-string v4, "DESKTOP"

    invoke-direct {v1, v4, v2, v3}, Ls7j;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ls7j;->c:Ls7j;

    filled-new-array {v0, v1}, [Ls7j;

    move-result-object v0

    sput-object v0, Ls7j;->d:[Ls7j;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ls7j;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ls7j;
    .registers 2

    const-class v0, Ls7j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ls7j;

    return-object p0
.end method

.method public static values()[Ls7j;
    .registers 1

    sget-object v0, Ls7j;->d:[Ls7j;

    invoke-virtual {v0}, [Ls7j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ls7j;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Ls7j;->a:I

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
