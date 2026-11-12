.class public final enum Lw52;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lw52;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lw52;

    const-string v1, "TEXT_MODE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lw52;

    const-string v2, "VOICE_MODE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1}, [Lw52;

    move-result-object v0

    sput-object v0, Lw52;->a:[Lw52;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw52;
    .registers 2

    const-class v0, Lw52;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw52;

    return-object p0
.end method

.method public static values()[Lw52;
    .registers 1

    sget-object v0, Lw52;->a:[Lw52;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw52;

    return-object v0
.end method
