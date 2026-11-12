.class public final enum Lrjf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lrjf;

.field public static final enum b:Lrjf;

.field public static final enum c:Lrjf;

.field public static final enum d:Lrjf;

.field public static final enum e:Lrjf;

.field public static final enum f:Lrjf;

.field public static final synthetic g:[Lrjf;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lrjf;

    const-string v1, "ACTION_BUTTON"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lrjf;->a:Lrjf;

    new-instance v1, Lrjf;

    const-string v2, "ANCHOR_CLICKED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lrjf;->b:Lrjf;

    new-instance v2, Lrjf;

    const-string v3, "CANCELLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lrjf;->c:Lrjf;

    new-instance v3, Lrjf;

    const-string v4, "CONTENT_CLICKED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lrjf;->d:Lrjf;

    new-instance v4, Lrjf;

    const-string v5, "CLOSE_BUTTON"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lrjf;->e:Lrjf;

    new-instance v5, Lrjf;

    const-string v6, "FAILED_TO_SHOW"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lrjf;->f:Lrjf;

    filled-new-array/range {v0 .. v5}, [Lrjf;

    move-result-object v0

    sput-object v0, Lrjf;->g:[Lrjf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrjf;
    .registers 2

    const-class v0, Lrjf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrjf;

    return-object p0
.end method

.method public static values()[Lrjf;
    .registers 1

    sget-object v0, Lrjf;->g:[Lrjf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrjf;

    return-object v0
.end method
