.class public final enum Lkom;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lkom;

.field public static final enum b:Lkom;

.field public static final synthetic c:[Lkom;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkom;

    const-string v1, "DYNAMIC_CONTENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkom;->a:Lkom;

    new-instance v1, Lkom;

    const-string v2, "GOOGLE_PLAY_FLEXIBLE_UPDATE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkom;->b:Lkom;

    filled-new-array {v0, v1}, [Lkom;

    move-result-object v0

    sput-object v0, Lkom;->c:[Lkom;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkom;
    .registers 2

    const-class v0, Lkom;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkom;

    return-object p0
.end method

.method public static values()[Lkom;
    .registers 1

    sget-object v0, Lkom;->c:[Lkom;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkom;

    return-object v0
.end method
