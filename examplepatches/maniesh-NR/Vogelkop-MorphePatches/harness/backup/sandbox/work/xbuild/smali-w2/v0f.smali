.class public final enum Lv0f;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lv0f;

.field public static final enum b:Lv0f;

.field public static final enum c:Lv0f;

.field public static final synthetic d:[Lv0f;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lv0f;

    const-string v1, "NOT_INITIALIZED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lv0f;->a:Lv0f;

    new-instance v1, Lv0f;

    const-string v2, "DISABLED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lv0f;->b:Lv0f;

    new-instance v2, Lv0f;

    const-string v3, "ENABLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lv0f;->c:Lv0f;

    filled-new-array {v0, v1, v2}, [Lv0f;

    move-result-object v0

    sput-object v0, Lv0f;->d:[Lv0f;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv0f;
    .registers 2

    const-class v0, Lv0f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lv0f;

    return-object p0
.end method

.method public static values()[Lv0f;
    .registers 1

    sget-object v0, Lv0f;->d:[Lv0f;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lv0f;

    return-object v0
.end method
