.class public final enum Lw98;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lw98;

.field public static final synthetic c:[Lw98;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lw98;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lw98;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lw98;->b:Lw98;

    new-instance v1, Lw98;

    const/4 v2, 0x1

    const-string v3, "close"

    const-string v4, "CLOSE"

    invoke-direct {v1, v4, v2, v3}, Lw98;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1}, [Lw98;

    move-result-object v0

    sput-object v0, Lw98;->c:[Lw98;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lw98;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw98;
    .registers 2

    const-class v0, Lw98;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw98;

    return-object p0
.end method

.method public static values()[Lw98;
    .registers 1

    sget-object v0, Lw98;->c:[Lw98;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw98;

    return-object v0
.end method
