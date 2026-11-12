.class public final enum Lo3k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lo3k;

.field public static final enum b:Lo3k;

.field public static final enum c:Lo3k;

.field public static final enum d:Lo3k;

.field public static final enum e:Lo3k;

.field public static final enum f:Lo3k;

.field public static final synthetic g:[Lo3k;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lo3k;

    const-string v1, "HOME"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lo3k;->a:Lo3k;

    new-instance v1, Lo3k;

    const-string v2, "BACK"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lo3k;->b:Lo3k;

    new-instance v2, Lo3k;

    const-string v3, "FORWARD"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lo3k;->c:Lo3k;

    new-instance v3, Lo3k;

    const-string v4, "TAB_GALLERY"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lo3k;->d:Lo3k;

    new-instance v4, Lo3k;

    const-string v5, "MAIN_MENU"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lo3k;->e:Lo3k;

    new-instance v5, Lo3k;

    const-string v6, "PAGE_MENU"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lo3k;->f:Lo3k;

    filled-new-array/range {v0 .. v5}, [Lo3k;

    move-result-object v0

    sput-object v0, Lo3k;->g:[Lo3k;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lo3k;
    .registers 2

    const-class v0, Lo3k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lo3k;

    return-object p0
.end method

.method public static values()[Lo3k;
    .registers 1

    sget-object v0, Lo3k;->g:[Lo3k;

    invoke-virtual {v0}, [Lo3k;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lo3k;

    return-object v0
.end method
