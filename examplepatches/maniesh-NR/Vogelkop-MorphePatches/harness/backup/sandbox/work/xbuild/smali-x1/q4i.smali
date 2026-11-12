.class public final enum Lq4i;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lq4i;

.field public static final enum b:Lq4i;

.field public static final synthetic c:[Lq4i;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lq4i;

    const-string v1, "WALLPAPER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lq4i;->a:Lq4i;

    new-instance v1, Lq4i;

    const-string v2, "APP_ICON"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lq4i;->b:Lq4i;

    filled-new-array {v0, v1}, [Lq4i;

    move-result-object v0

    sput-object v0, Lq4i;->c:[Lq4i;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lq4i;
    .registers 2

    const-class v0, Lq4i;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lq4i;

    return-object p0
.end method

.method public static values()[Lq4i;
    .registers 1

    sget-object v0, Lq4i;->c:[Lq4i;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lq4i;

    return-object v0
.end method
