.class public final enum Lmuk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lmuk;

.field public static final synthetic b:[Lmuk;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lmuk;

    const-string v1, "BLOCK_SAVES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lmuk;

    const-string v2, "DISCARD"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lmuk;->a:Lmuk;

    filled-new-array {v0, v1}, [Lmuk;

    move-result-object v0

    sput-object v0, Lmuk;->b:[Lmuk;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmuk;
    .registers 2

    const-class v0, Lmuk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmuk;

    return-object p0
.end method

.method public static values()[Lmuk;
    .registers 1

    sget-object v0, Lmuk;->b:[Lmuk;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmuk;

    return-object v0
.end method
