.class public final enum Lbq8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lbq8;

.field public static final enum b:Lbq8;

.field public static final synthetic c:[Lbq8;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lbq8;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbq8;->a:Lbq8;

    new-instance v1, Lbq8;

    const-string v2, "REGULAR"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbq8;->b:Lbq8;

    new-instance v2, Lbq8;

    const-string v3, "MAX_HEIGHT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Lbq8;

    move-result-object v0

    sput-object v0, Lbq8;->c:[Lbq8;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbq8;
    .registers 2

    const-class v0, Lbq8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbq8;

    return-object p0
.end method

.method public static values()[Lbq8;
    .registers 1

    sget-object v0, Lbq8;->c:[Lbq8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbq8;

    return-object v0
.end method
