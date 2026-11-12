.class public final enum Lgt;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lgt;

.field public static final enum b:Lgt;

.field public static final enum c:Lgt;

.field public static final enum d:Lgt;

.field public static final enum e:Lgt;

.field public static final enum f:Lgt;

.field public static final synthetic g:[Lgt;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lgt;

    const-string v1, "SUGGESTED_FOR_YOU"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgt;->a:Lgt;

    new-instance v1, Lgt;

    const-string v2, "CATEGORIES"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lgt;->b:Lgt;

    new-instance v2, Lgt;

    const-string v3, "FREQUENTLY_VISITED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lgt;->c:Lgt;

    new-instance v3, Lgt;

    const-string v4, "TOOLS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lgt;->d:Lgt;

    new-instance v4, Lgt;

    const-string v5, "BOOKMARK"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lgt;->e:Lgt;

    new-instance v5, Lgt;

    const-string v6, "SEARCH"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lgt;->f:Lgt;

    filled-new-array/range {v0 .. v5}, [Lgt;

    move-result-object v0

    sput-object v0, Lgt;->g:[Lgt;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lgt;
    .registers 2

    const-class v0, Lgt;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgt;

    return-object p0
.end method

.method public static values()[Lgt;
    .registers 1

    sget-object v0, Lgt;->g:[Lgt;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgt;

    return-object v0
.end method
