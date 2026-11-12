.class public final enum Lx92;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lx92;

.field public static final enum b:Lx92;

.field public static final enum c:Lx92;

.field public static final enum d:Lx92;

.field public static final enum e:Lx92;

.field public static final enum f:Lx92;

.field public static final enum g:Lx92;

.field public static final synthetic h:[Lx92;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lx92;

    const-string v1, "IMAGE_CONTEXT_MENU"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lx92;->a:Lx92;

    new-instance v1, Lx92;

    const-string v2, "DOWNLOAD_ITEM_MENU"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lx92;->b:Lx92;

    new-instance v2, Lx92;

    const-string v3, "DOWNLOAD_SELECTION_MENU"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lx92;->c:Lx92;

    new-instance v3, Lx92;

    const-string v4, "DOWNLOAD_CONTEXT_MENU"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lx92;->d:Lx92;

    new-instance v4, Lx92;

    const-string v5, "PAGE_MENU"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lx92;->e:Lx92;

    new-instance v5, Lx92;

    const-string v6, "OMNIBAR"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lx92;->f:Lx92;

    new-instance v6, Lx92;

    const-string v7, "TEXT_SELECTION_CONTEXT_MENU"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lx92;->g:Lx92;

    filled-new-array/range {v0 .. v6}, [Lx92;

    move-result-object v0

    sput-object v0, Lx92;->h:[Lx92;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lx92;
    .registers 2

    const-class v0, Lx92;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lx92;

    return-object p0
.end method

.method public static values()[Lx92;
    .registers 1

    sget-object v0, Lx92;->h:[Lx92;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lx92;

    return-object v0
.end method
