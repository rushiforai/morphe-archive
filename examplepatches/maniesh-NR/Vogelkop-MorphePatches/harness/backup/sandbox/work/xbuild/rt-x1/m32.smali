.class public final enum Lm32;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lm32;

.field public static final enum b:Lm32;

.field public static final synthetic c:[Lm32;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lm32;

    const-string v1, "CAMERA_PERMISSION_DENIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lm32;->a:Lm32;

    new-instance v1, Lm32;

    const-string v2, "PHOTO_MAYBE_TAKEN"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lm32;->b:Lm32;

    filled-new-array {v0, v1}, [Lm32;

    move-result-object v0

    sput-object v0, Lm32;->c:[Lm32;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lm32;
    .registers 2

    const-class v0, Lm32;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lm32;

    return-object p0
.end method

.method public static values()[Lm32;
    .registers 1

    sget-object v0, Lm32;->c:[Lm32;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lm32;

    return-object v0
.end method
