.class public final enum Libn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Libn;

.field public static final enum b:Libn;

.field public static final synthetic c:[Libn;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Libn;

    const-string v1, "WEB_SEARCH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Libn;->a:Libn;

    new-instance v1, Libn;

    const-string v2, "OTHER"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Libn;->b:Libn;

    filled-new-array {v0, v1}, [Libn;

    move-result-object v0

    sput-object v0, Libn;->c:[Libn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Libn;
    .registers 2

    const-class v0, Libn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Libn;

    return-object p0
.end method

.method public static values()[Libn;
    .registers 1

    sget-object v0, Libn;->c:[Libn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Libn;

    return-object v0
.end method
