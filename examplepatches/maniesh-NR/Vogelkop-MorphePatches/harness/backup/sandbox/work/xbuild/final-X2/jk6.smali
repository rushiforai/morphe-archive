.class public final enum Ljk6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ljk6;

.field public static final enum b:Ljk6;

.field public static final enum c:Ljk6;

.field public static final enum d:Ljk6;

.field public static final synthetic e:[Ljk6;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ljk6;

    const-string v1, "AVAILABLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljk6;->a:Ljk6;

    new-instance v1, Ljk6;

    const-string v2, "NOT_SUPPORTED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ljk6;->b:Ljk6;

    new-instance v2, Ljk6;

    const-string v3, "ALREADY_ACTIVE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ljk6;->c:Ljk6;

    new-instance v3, Ljk6;

    const-string v4, "ERROR"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ljk6;->d:Ljk6;

    filled-new-array {v0, v1, v2, v3}, [Ljk6;

    move-result-object v0

    sput-object v0, Ljk6;->e:[Ljk6;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljk6;
    .registers 2

    const-class v0, Ljk6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljk6;

    return-object p0
.end method

.method public static values()[Ljk6;
    .registers 1

    sget-object v0, Ljk6;->e:[Ljk6;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljk6;

    return-object v0
.end method
