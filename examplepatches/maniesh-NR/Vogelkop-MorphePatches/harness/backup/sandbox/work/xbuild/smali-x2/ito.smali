.class public final enum Lito;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lito;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lito;

    const-string v1, "VERBOSE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lito;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lito;

    const-string v2, "DEBUG"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lito;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lito;

    const-string v3, "INFO"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lito;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lito;

    const-string v4, "WARNING"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lito;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lito;

    const-string v5, "ERROR"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lito;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2, v3, v4}, [Lito;

    move-result-object v0

    sput-object v0, Lito;->a:[Lito;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lito;
    .registers 2

    const-class v0, Lito;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lito;

    return-object p0
.end method

.method public static values()[Lito;
    .registers 1

    sget-object v0, Lito;->a:[Lito;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lito;

    return-object v0
.end method
