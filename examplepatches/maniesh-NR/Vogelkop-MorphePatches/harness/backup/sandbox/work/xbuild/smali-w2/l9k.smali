.class public final enum Ll9k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ll9k;

.field public static final enum b:Ll9k;

.field public static final enum c:Ll9k;

.field public static final enum d:Ll9k;

.field public static final synthetic e:[Ll9k;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ll9k;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ll9k;->a:Ll9k;

    new-instance v1, Ll9k;

    const-string v2, "SUCCESS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ll9k;->b:Ll9k;

    new-instance v2, Ll9k;

    const-string v3, "ABORT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ll9k;->c:Ll9k;

    new-instance v3, Ll9k;

    const-string v4, "TIMEOUT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ll9k;->d:Ll9k;

    filled-new-array {v0, v1, v2, v3}, [Ll9k;

    move-result-object v0

    sput-object v0, Ll9k;->e:[Ll9k;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ll9k;
    .registers 2

    const-class v0, Ll9k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ll9k;

    return-object p0
.end method

.method public static values()[Ll9k;
    .registers 1

    sget-object v0, Ll9k;->e:[Ll9k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ll9k;

    return-object v0
.end method
