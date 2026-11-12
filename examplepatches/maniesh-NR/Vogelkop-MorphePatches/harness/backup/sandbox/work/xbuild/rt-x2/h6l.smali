.class public final enum Lh6l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lh6l;

.field public static final enum b:Lh6l;

.field public static final enum c:Lh6l;

.field public static final enum d:Lh6l;

.field public static final enum e:Lh6l;

.field public static final enum f:Lh6l;

.field public static final synthetic g:[Lh6l;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lh6l;

    const-string v1, "SESSION_RESTORE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lh6l;->a:Lh6l;

    new-instance v1, Lh6l;

    const-string v2, "UNDO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lh6l;->b:Lh6l;

    new-instance v2, Lh6l;

    const-string v3, "REORDERING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lh6l;->c:Lh6l;

    new-instance v3, Lh6l;

    const-string v4, "GROUP_CHANGE"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lh6l;->d:Lh6l;

    new-instance v4, Lh6l;

    const-string v5, "VOLUME"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lh6l;->e:Lh6l;

    new-instance v5, Lh6l;

    const-string v6, "CLONE_GROUP"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v6, Lh6l;

    const-string v7, "CLOSING_MANY"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lh6l;->f:Lh6l;

    new-instance v7, Lh6l;

    const-string v8, "MANAGE_TABS_ACTIONS"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v7}, [Lh6l;

    move-result-object v0

    sput-object v0, Lh6l;->g:[Lh6l;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lh6l;
    .registers 2

    const-class v0, Lh6l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lh6l;

    return-object p0
.end method

.method public static values()[Lh6l;
    .registers 1

    sget-object v0, Lh6l;->g:[Lh6l;

    invoke-virtual {v0}, [Lh6l;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lh6l;

    return-object v0
.end method
