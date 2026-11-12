.class public final enum Lddf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lddf;

.field public static final enum b:Lddf;

.field public static final synthetic c:[Lddf;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lddf;

    const-string v1, "DRAW"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lddf;->a:Lddf;

    new-instance v1, Lddf;

    const-string v2, "ABORT_DRAW"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lddf;->b:Lddf;

    filled-new-array {v0, v1}, [Lddf;

    move-result-object v0

    sput-object v0, Lddf;->c:[Lddf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lddf;
    .registers 2

    const-class v0, Lddf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lddf;

    return-object p0
.end method

.method public static values()[Lddf;
    .registers 1

    sget-object v0, Lddf;->c:[Lddf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lddf;

    return-object v0
.end method
