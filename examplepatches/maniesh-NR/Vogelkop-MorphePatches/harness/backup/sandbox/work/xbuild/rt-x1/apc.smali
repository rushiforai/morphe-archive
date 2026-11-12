.class public final enum Lapc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lix5;

.field public static final enum c:Lapc;

.field public static final enum d:Lapc;

.field public static final synthetic e:[Lapc;

.field public static final synthetic f:Lh58;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lapc;

    const-string v1, "FOOTBALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lapc;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lapc;->c:Lapc;

    new-instance v1, Lapc;

    const-string v2, "BASKETBALL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lapc;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lapc;->d:Lapc;

    filled-new-array {v0, v1}, [Lapc;

    move-result-object v0

    sput-object v0, Lapc;->e:[Lapc;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lapc;->f:Lh58;

    new-instance v0, Lix5;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lix5;-><init>(B)V

    sput-object v0, Lapc;->b:Lix5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lapc;->a:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lapc;
    .registers 2

    const-class v0, Lapc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lapc;

    return-object p0
.end method

.method public static values()[Lapc;
    .registers 1

    sget-object v0, Lapc;->e:[Lapc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lapc;

    return-object v0
.end method
