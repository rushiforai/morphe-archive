.class public final enum Lr8k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lr8k;

.field public static final enum b:Lr8k;

.field public static final synthetic c:[Lr8k;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lr8k;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lr8k;->a:Lr8k;

    new-instance v1, Lr8k;

    const-string v2, "AI_AND_PRIVATE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lr8k;->b:Lr8k;

    filled-new-array {v0, v1}, [Lr8k;

    move-result-object v0

    sput-object v0, Lr8k;->c:[Lr8k;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lr8k;
    .registers 2

    const-class v0, Lr8k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lr8k;

    return-object p0
.end method

.method public static values()[Lr8k;
    .registers 1

    sget-object v0, Lr8k;->c:[Lr8k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lr8k;

    return-object v0
.end method
