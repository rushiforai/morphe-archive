.class public final enum Lkag;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lkag;

.field public static final enum c:Lkag;

.field public static final enum d:Lkag;

.field public static final synthetic e:[Lkag;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkag;

    const-string v1, "GRANTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lkag;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lkag;->b:Lkag;

    new-instance v1, Lkag;

    const-string v2, "DENIED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lkag;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lkag;->c:Lkag;

    new-instance v2, Lkag;

    const-string v3, "ASK"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lkag;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lkag;->d:Lkag;

    filled-new-array {v0, v1, v2}, [Lkag;

    move-result-object v0

    sput-object v0, Lkag;->e:[Lkag;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lkag;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkag;
    .registers 2

    const-class v0, Lkag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkag;

    return-object p0
.end method

.method public static values()[Lkag;
    .registers 1

    sget-object v0, Lkag;->e:[Lkag;

    invoke-virtual {v0}, [Lkag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkag;

    return-object v0
.end method
