.class public final enum Lt62;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lt62;

.field public static final enum b:Lt62;

.field public static final synthetic c:[Lt62;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lt62;

    const-string v1, "SHEET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lt62;->a:Lt62;

    new-instance v1, Lt62;

    const-string v2, "TAB"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lt62;->b:Lt62;

    filled-new-array {v0, v1}, [Lt62;

    move-result-object v0

    sput-object v0, Lt62;->c:[Lt62;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lt62;
    .registers 2

    const-class v0, Lt62;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lt62;

    return-object p0
.end method

.method public static values()[Lt62;
    .registers 1

    sget-object v0, Lt62;->c:[Lt62;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lt62;

    return-object v0
.end method
