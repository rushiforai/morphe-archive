.class public final enum Lxrn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lxrn;

.field public static final synthetic b:[Lxrn;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lxrn;

    const-string v1, "NO_PERMISSION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lxrn;->a:Lxrn;

    filled-new-array {v0}, [Lxrn;

    move-result-object v0

    sput-object v0, Lxrn;->b:[Lxrn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxrn;
    .registers 2

    const-class v0, Lxrn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxrn;

    return-object p0
.end method

.method public static values()[Lxrn;
    .registers 1

    sget-object v0, Lxrn;->b:[Lxrn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxrn;

    return-object v0
.end method
