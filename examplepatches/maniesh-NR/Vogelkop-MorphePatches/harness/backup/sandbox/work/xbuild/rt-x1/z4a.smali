.class public final enum Lz4a;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lz4a;

.field public static final enum b:Lz4a;

.field public static final enum c:Lz4a;

.field public static final enum d:Lz4a;

.field public static final synthetic e:[Lz4a;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lz4a;

    const-string v1, "FIRST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lz4a;->a:Lz4a;

    new-instance v1, Lz4a;

    const-string v2, "LAST"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lz4a;->b:Lz4a;

    new-instance v2, Lz4a;

    const-string v3, "MIDDLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lz4a;->c:Lz4a;

    new-instance v3, Lz4a;

    const-string v4, "SINGLE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lz4a;->d:Lz4a;

    filled-new-array {v0, v1, v2, v3}, [Lz4a;

    move-result-object v0

    sput-object v0, Lz4a;->e:[Lz4a;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lz4a;
    .registers 2

    const-class v0, Lz4a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lz4a;

    return-object p0
.end method

.method public static values()[Lz4a;
    .registers 1

    sget-object v0, Lz4a;->e:[Lz4a;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lz4a;

    return-object v0
.end method
