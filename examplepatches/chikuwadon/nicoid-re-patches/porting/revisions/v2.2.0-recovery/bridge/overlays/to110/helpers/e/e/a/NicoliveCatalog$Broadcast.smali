.class final enum Le/e/a/NicoliveCatalog$Broadcast;
.super Ljava/lang/Enum;
.source "NicoliveCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/NicoliveCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Broadcast"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Le/e/a/NicoliveCatalog$Broadcast;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ENDED:Le/e/a/NicoliveCatalog$Broadcast;

.field private static final synthetic ENUM$VALUES:[Le/e/a/NicoliveCatalog$Broadcast;

.field public static final enum LIVE:Le/e/a/NicoliveCatalog$Broadcast;

.field public static final enum UPCOMING:Le/e/a/NicoliveCatalog$Broadcast;


# instance fields
.field final label:Ljava/lang/String;

.field final parameter:Ljava/lang/String;

.field final state:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 53
    new-instance v0, Le/e/a/NicoliveCatalog$Broadcast;

    const-string v4, "onair"

    const-string v5, "ON_AIR"

    const-string v1, "LIVE"

    const/4 v2, 0x0

    const-string/jumbo v3, "\u653e\u9001\u4e2d"

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveCatalog$Broadcast;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Le/e/a/NicoliveCatalog$Broadcast;->LIVE:Le/e/a/NicoliveCatalog$Broadcast;

    .line 54
    new-instance v1, Le/e/a/NicoliveCatalog$Broadcast;

    const-string v5, "comingsoon"

    const-string v6, "RELEASED"

    const-string v2, "UPCOMING"

    const/4 v3, 0x1

    const-string/jumbo v4, "\u653e\u9001\u4e88\u5b9a"

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveCatalog$Broadcast;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Le/e/a/NicoliveCatalog$Broadcast;->UPCOMING:Le/e/a/NicoliveCatalog$Broadcast;

    .line 55
    new-instance v2, Le/e/a/NicoliveCatalog$Broadcast;

    const-string v6, "closed"

    const-string v7, "ENDED"

    const-string v3, "ENDED"

    const/4 v4, 0x2

    const-string/jumbo v5, "\u653e\u9001\u7d42\u4e86"

    invoke-direct/range {v2 .. v7}, Le/e/a/NicoliveCatalog$Broadcast;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v2, Le/e/a/NicoliveCatalog$Broadcast;->ENDED:Le/e/a/NicoliveCatalog$Broadcast;

    .line 52
    filled-new-array {v0, v1, v2}, [Le/e/a/NicoliveCatalog$Broadcast;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveCatalog$Broadcast;->ENUM$VALUES:[Le/e/a/NicoliveCatalog$Broadcast;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 62
    iput-object p3, p0, Le/e/a/NicoliveCatalog$Broadcast;->label:Ljava/lang/String;

    .line 63
    iput-object p4, p0, Le/e/a/NicoliveCatalog$Broadcast;->parameter:Ljava/lang/String;

    .line 64
    iput-object p5, p0, Le/e/a/NicoliveCatalog$Broadcast;->state:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Le/e/a/NicoliveCatalog$Broadcast;
    .registers 2

    .line 1
    const-class v0, Le/e/a/NicoliveCatalog$Broadcast;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Le/e/a/NicoliveCatalog$Broadcast;

    return-object p0
.end method

.method public static values()[Le/e/a/NicoliveCatalog$Broadcast;
    .registers 4

    .line 1
    sget-object v0, Le/e/a/NicoliveCatalog$Broadcast;->ENUM$VALUES:[Le/e/a/NicoliveCatalog$Broadcast;

    array-length v1, v0

    new-array v2, v1, [Le/e/a/NicoliveCatalog$Broadcast;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method matches(Le/e/a/NicoliveData$Program;)Z
    .registers 3

    .line 68
    sget-object v0, Le/e/a/NicoliveCatalog$Broadcast;->UPCOMING:Le/e/a/NicoliveCatalog$Broadcast;

    if-ne p0, v0, :cond_0

    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->scheduled()Z

    move-result p0

    return p0

    :cond_0
    iget-object p0, p0, Le/e/a/NicoliveCatalog$Broadcast;->state:Ljava/lang/String;

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->status:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
