.class public final enum Lj2h;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lj2h;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lj2h;

    const-string v1, "OFA_DEV"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lj2h;

    const-string v2, "OFA_BETA"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lj2h;

    const-string v3, "OFA_FINAL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Lj2h;

    move-result-object v0

    sput-object v0, Lj2h;->a:[Lj2h;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lj2h;
    .registers 2

    const-class v0, Lj2h;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lj2h;

    return-object p0
.end method

.method public static values()[Lj2h;
    .registers 1

    sget-object v0, Lj2h;->a:[Lj2h;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lj2h;

    return-object v0
.end method
