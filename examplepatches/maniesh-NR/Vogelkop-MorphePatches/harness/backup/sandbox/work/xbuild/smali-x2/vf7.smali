.class public final enum Lvf7;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lvf7;

.field public static final enum c:Lvf7;

.field public static final synthetic d:[Lvf7;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lvf7;

    const/4 v1, 0x0

    const v2, 0x7f0a043f

    const-string v3, "FINISHED"

    invoke-direct {v0, v3, v1, v2}, Lvf7;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lvf7;->b:Lvf7;

    new-instance v1, Lvf7;

    const/4 v2, 0x1

    const v3, 0x7f0a03c0

    const-string v4, "FAILED"

    invoke-direct {v1, v4, v2, v3}, Lvf7;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lvf7;->c:Lvf7;

    filled-new-array {v0, v1}, [Lvf7;

    move-result-object v0

    sput-object v0, Lvf7;->d:[Lvf7;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lvf7;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvf7;
    .registers 2

    const-class v0, Lvf7;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvf7;

    return-object p0
.end method

.method public static values()[Lvf7;
    .registers 1

    sget-object v0, Lvf7;->d:[Lvf7;

    invoke-virtual {v0}, [Lvf7;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvf7;

    return-object v0
.end method
