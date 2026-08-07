.class public final enum Lcom/xiaomi/push/gm;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/push/gm;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/xiaomi/push/gm;

.field private static final synthetic a:[Lcom/xiaomi/push/gm;

.field public static final enum b:Lcom/xiaomi/push/gm;

.field public static final enum c:Lcom/xiaomi/push/gm;

.field public static final enum d:Lcom/xiaomi/push/gm;


# instance fields
.field private final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/xiaomi/push/gm;

    .line 2
    .line 3
    const-string v1, "INT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gm;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/xiaomi/push/gm;->a:Lcom/xiaomi/push/gm;

    .line 11
    .line 12
    new-instance v1, Lcom/xiaomi/push/gm;

    .line 13
    .line 14
    const-string v2, "LONG"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/xiaomi/push/gm;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/xiaomi/push/gm;->b:Lcom/xiaomi/push/gm;

    .line 21
    .line 22
    new-instance v2, Lcom/xiaomi/push/gm;

    .line 23
    .line 24
    const-string v3, "STRING"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/xiaomi/push/gm;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/xiaomi/push/gm;->c:Lcom/xiaomi/push/gm;

    .line 31
    .line 32
    new-instance v3, Lcom/xiaomi/push/gm;

    .line 33
    .line 34
    const-string v4, "BOOLEAN"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/xiaomi/push/gm;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/xiaomi/push/gm;->d:Lcom/xiaomi/push/gm;

    .line 41
    .line 42
    filled-new-array {v0, v1, v2, v3}, [Lcom/xiaomi/push/gm;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/xiaomi/push/gm;->a:[Lcom/xiaomi/push/gm;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/xiaomi/push/gm;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static a(I)Lcom/xiaomi/push/gm;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    sget-object p0, Lcom/xiaomi/push/gm;->d:Lcom/xiaomi/push/gm;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    sget-object p0, Lcom/xiaomi/push/gm;->c:Lcom/xiaomi/push/gm;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    sget-object p0, Lcom/xiaomi/push/gm;->b:Lcom/xiaomi/push/gm;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_3
    sget-object p0, Lcom/xiaomi/push/gm;->a:Lcom/xiaomi/push/gm;

    .line 25
    .line 26
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/push/gm;
    .locals 1

    .line 1
    const-class v0, Lcom/xiaomi/push/gm;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/xiaomi/push/gm;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/xiaomi/push/gm;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/gm;->a:[Lcom/xiaomi/push/gm;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/xiaomi/push/gm;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/xiaomi/push/gm;

    .line 8
    .line 9
    return-object v0
.end method
