.class public final enum Lu4b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lu4b;

.field public static final synthetic b:[Lu4b;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lu4b;

    const-string v1, "AUTO_REMOVE_ON_LOW_MEMORY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lu4b;->a:Lu4b;

    filled-new-array {v0}, [Lu4b;

    move-result-object v0

    sput-object v0, Lu4b;->b:[Lu4b;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lu4b;
    .registers 2

    const-class v0, Lu4b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lu4b;

    return-object p0
.end method

.method public static values()[Lu4b;
    .registers 1

    sget-object v0, Lu4b;->b:[Lu4b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lu4b;

    return-object v0
.end method
