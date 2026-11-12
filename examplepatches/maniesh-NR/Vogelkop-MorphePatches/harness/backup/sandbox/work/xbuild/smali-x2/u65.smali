.class public final enum Lu65;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lu65;

.field public static final enum b:Lu65;

.field public static final enum c:Lu65;

.field public static final enum d:Lu65;

.field public static final enum e:Lu65;

.field public static final enum f:Lu65;

.field public static final synthetic g:[Lu65;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lu65;

    const-string v1, "ACCEPT_ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lu65;->a:Lu65;

    new-instance v1, Lu65;

    const-string v2, "DENY_ALL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lu65;->b:Lu65;

    new-instance v2, Lu65;

    const-string v3, "GRANULAR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lu65;->c:Lu65;

    new-instance v3, Lu65;

    const-string v4, "SKIP"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lu65;->d:Lu65;

    new-instance v4, Lu65;

    const-string v5, "NEXT"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lu65;->e:Lu65;

    new-instance v5, Lu65;

    const-string v6, "NO_INTERACTION"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lu65;->f:Lu65;

    filled-new-array/range {v0 .. v5}, [Lu65;

    move-result-object v0

    sput-object v0, Lu65;->g:[Lu65;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lu65;
    .registers 2

    const-class v0, Lu65;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lu65;

    return-object p0
.end method

.method public static values()[Lu65;
    .registers 1

    sget-object v0, Lu65;->g:[Lu65;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lu65;

    return-object v0
.end method
