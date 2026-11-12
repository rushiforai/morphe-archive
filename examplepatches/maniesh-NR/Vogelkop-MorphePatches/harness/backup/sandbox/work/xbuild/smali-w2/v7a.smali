.class public final enum Lv7a;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lv7a;

.field public static final enum b:Lv7a;

.field public static final enum c:Lv7a;

.field public static final enum d:Lv7a;

.field public static final synthetic e:[Lv7a;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lv7a;

    const-string v1, "HEX_LOWERCASE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lv7a;->a:Lv7a;

    new-instance v1, Lv7a;

    const-string v2, "HEX_UPPERCASE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lv7a;

    const-string v3, "BASE64"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lv7a;->b:Lv7a;

    new-instance v3, Lv7a;

    const-string v4, "BASE64_URL"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lv7a;->c:Lv7a;

    new-instance v4, Lv7a;

    const-string v5, "BASE64_URL_NO_PADDING"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lv7a;->d:Lv7a;

    filled-new-array {v0, v1, v2, v3, v4}, [Lv7a;

    move-result-object v0

    sput-object v0, Lv7a;->e:[Lv7a;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv7a;
    .registers 2

    const-class v0, Lv7a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lv7a;

    return-object p0
.end method

.method public static values()[Lv7a;
    .registers 1

    sget-object v0, Lv7a;->e:[Lv7a;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lv7a;

    return-object v0
.end method
