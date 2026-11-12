.class public final enum Ltc9;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Llrf;


# static fields
.field public static final enum b:Ltc9;

.field public static final enum c:Ltc9;

.field public static final synthetic d:[Ltc9;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ltc9;

    const/4 v1, 0x0

    const v2, 0x7f1404aa

    const-string v3, "CONNECT"

    invoke-direct {v0, v3, v1, v2}, Ltc9;-><init>(Ljava/lang/String;II)V

    new-instance v1, Ltc9;

    const/4 v2, 0x1

    const v3, 0x7f1407ab

    const-string v4, "SHOW_QR_CODE"

    invoke-direct {v1, v4, v2, v3}, Ltc9;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ltc9;->b:Ltc9;

    new-instance v2, Ltc9;

    const/4 v3, 0x2

    const v4, 0x7f140968

    const-string v5, "SIGN_IN"

    invoke-direct {v2, v5, v3, v4}, Ltc9;-><init>(Ljava/lang/String;II)V

    sput-object v2, Ltc9;->c:Ltc9;

    new-instance v3, Ltc9;

    const/4 v4, 0x3

    const v5, 0x7f140bf5

    const-string v6, "CREATE_ACCOUNT"

    invoke-direct {v3, v6, v4, v5}, Ltc9;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2, v3}, [Ltc9;

    move-result-object v0

    sput-object v0, Ltc9;->d:[Ltc9;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ltc9;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltc9;
    .registers 2

    const-class v0, Ltc9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltc9;

    return-object p0
.end method

.method public static values()[Ltc9;
    .registers 1

    sget-object v0, Ltc9;->d:[Ltc9;

    invoke-virtual {v0}, [Ltc9;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltc9;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/res/Resources;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Ltc9;->a:I

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
