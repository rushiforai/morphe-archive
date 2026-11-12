.class public final enum Ldy1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ldy1;

.field public static final synthetic b:[Ldy1;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ldy1;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Ldy1;

    const-string v2, "NO_CAMERA_PERMISSION"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ldy1;->a:Ldy1;

    filled-new-array {v0, v1}, [Ldy1;

    move-result-object v0

    sput-object v0, Ldy1;->b:[Ldy1;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldy1;
    .registers 2

    const-class v0, Ldy1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldy1;

    return-object p0
.end method

.method public static values()[Ldy1;
    .registers 1

    sget-object v0, Ldy1;->b:[Ldy1;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldy1;

    return-object v0
.end method
