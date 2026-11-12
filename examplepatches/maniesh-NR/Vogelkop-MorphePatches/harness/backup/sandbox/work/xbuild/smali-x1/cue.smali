.class public final enum Lcue;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lcue;

.field public static final enum c:Lcue;

.field public static final synthetic d:[Lcue;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcue;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcue;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcue;->b:Lcue;

    new-instance v1, Lcue;

    const/4 v2, 0x1

    const/4 v3, 0x2

    const-string v4, "NewsFeed"

    invoke-direct {v1, v4, v2, v3}, Lcue;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcue;->c:Lcue;

    filled-new-array {v0, v1}, [Lcue;

    move-result-object v0

    sput-object v0, Lcue;->d:[Lcue;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lcue;->a:B

    return-void
.end method

.method public static d(I)Lcue;
    .registers 6

    invoke-static {}, Lcue;->values()[Lcue;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    iget-byte v4, v3, Lcue;->a:B

    if-ne p0, v4, :cond_f

    return-object v3

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_12
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcue;
    .registers 2

    const-class v0, Lcue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcue;

    return-object p0
.end method

.method public static values()[Lcue;
    .registers 1

    sget-object v0, Lcue;->d:[Lcue;

    invoke-virtual {v0}, [Lcue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcue;

    return-object v0
.end method
