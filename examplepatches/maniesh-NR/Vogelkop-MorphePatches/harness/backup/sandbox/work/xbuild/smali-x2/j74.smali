.class public final enum Lj74;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lj74;

.field public static final enum d:Lj74;

.field public static final synthetic e:[Lj74;


# instance fields
.field public final a:Z

.field public final b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lj74;

    const-string v1, "ENABLED"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3, v3}, Lj74;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lj74;->c:Lj74;

    new-instance v1, Lj74;

    const-string v4, "READ_ONLY"

    invoke-direct {v1, v4, v3, v3, v2}, Lj74;-><init>(Ljava/lang/String;IZZ)V

    new-instance v4, Lj74;

    const-string v5, "WRITE_ONLY"

    const/4 v6, 0x2

    invoke-direct {v4, v5, v6, v2, v3}, Lj74;-><init>(Ljava/lang/String;IZZ)V

    new-instance v3, Lj74;

    const-string v5, "DISABLED"

    const/4 v6, 0x3

    invoke-direct {v3, v5, v6, v2, v2}, Lj74;-><init>(Ljava/lang/String;IZZ)V

    sput-object v3, Lj74;->d:Lj74;

    filled-new-array {v0, v1, v4, v3}, [Lj74;

    move-result-object v0

    sput-object v0, Lj74;->e:[Lj74;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZZ)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lj74;->a:Z

    iput-boolean p4, p0, Lj74;->b:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lj74;
    .registers 2

    const-class v0, Lj74;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lj74;

    return-object p0
.end method

.method public static values()[Lj74;
    .registers 1

    sget-object v0, Lj74;->e:[Lj74;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lj74;

    return-object v0
.end method
