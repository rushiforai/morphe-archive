.class public final enum Lpxl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lpxl;

.field public static final enum c:Lpxl;

.field public static final synthetic d:[Lpxl;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpxl;

    const/4 v1, 0x0

    const-string v2, "football"

    const-string v3, "FOOTBALL"

    invoke-direct {v0, v3, v1, v2}, Lpxl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lpxl;->b:Lpxl;

    new-instance v1, Lpxl;

    const/4 v2, 0x1

    const-string v3, "basketball"

    const-string v4, "BASKETBALL"

    invoke-direct {v1, v4, v2, v3}, Lpxl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lpxl;->c:Lpxl;

    filled-new-array {v0, v1}, [Lpxl;

    move-result-object v0

    sput-object v0, Lpxl;->d:[Lpxl;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lpxl;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpxl;
    .registers 2

    const-class v0, Lpxl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpxl;

    return-object p0
.end method

.method public static values()[Lpxl;
    .registers 1

    sget-object v0, Lpxl;->d:[Lpxl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpxl;

    return-object v0
.end method
