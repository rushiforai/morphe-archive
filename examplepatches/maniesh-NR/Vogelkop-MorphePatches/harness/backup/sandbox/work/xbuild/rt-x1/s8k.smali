.class public final enum Ls8k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ls8k;

.field public static final enum b:Ls8k;

.field public static final enum c:Ls8k;

.field public static final synthetic d:[Ls8k;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ls8k;

    const-string v1, "APPBAR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ls8k;->a:Ls8k;

    new-instance v1, Ls8k;

    const-string v2, "START_PAGE_TOP_STICKY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ls8k;->b:Ls8k;

    new-instance v2, Ls8k;

    const-string v3, "START_PAGE_BOTTOM_COLLAPSING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ls8k;->c:Ls8k;

    filled-new-array {v0, v1, v2}, [Ls8k;

    move-result-object v0

    sput-object v0, Ls8k;->d:[Ls8k;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ls8k;
    .registers 2

    const-class v0, Ls8k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ls8k;

    return-object p0
.end method

.method public static values()[Ls8k;
    .registers 1

    sget-object v0, Ls8k;->d:[Ls8k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ls8k;

    return-object v0
.end method
