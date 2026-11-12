.class public final enum Lyx0;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lyx0;

.field public static final enum b:Lyx0;

.field public static final enum c:Lyx0;

.field public static final enum d:Lyx0;

.field public static final enum e:Lyx0;

.field public static final enum f:Lyx0;

.field public static final enum g:Lyx0;

.field public static final enum h:Lyx0;

.field public static final enum i:Lyx0;

.field public static final synthetic j:[Lyx0;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Lyx0;

    const-string v1, "NO_FILES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lyx0;->a:Lyx0;

    new-instance v1, Lyx0;

    const-string v2, "IMAGES_ONLY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lyx0;->b:Lyx0;

    new-instance v2, Lyx0;

    const-string v3, "TEXT_FILES_ONLY"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lyx0;->c:Lyx0;

    new-instance v3, Lyx0;

    const-string v4, "IMAGES_TEXT_FILES_MIX"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lyx0;->d:Lyx0;

    new-instance v4, Lyx0;

    const-string v5, "ONE_PAGE_CONTEXT_ONLY"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lyx0;->e:Lyx0;

    new-instance v5, Lyx0;

    const-string v6, "OTHER"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lyx0;->f:Lyx0;

    new-instance v6, Lyx0;

    const-string v7, "ATTACHED_TEXT"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lyx0;->g:Lyx0;

    new-instance v7, Lyx0;

    const-string v8, "ATTACHED_TEXT_LONG"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lyx0;->h:Lyx0;

    new-instance v8, Lyx0;

    const-string v9, "ATTACHED_TEXT_SHORT"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lyx0;->i:Lyx0;

    filled-new-array/range {v0 .. v8}, [Lyx0;

    move-result-object v0

    sput-object v0, Lyx0;->j:[Lyx0;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lyx0;
    .registers 2

    const-class v0, Lyx0;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lyx0;

    return-object p0
.end method

.method public static values()[Lyx0;
    .registers 1

    sget-object v0, Lyx0;->j:[Lyx0;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lyx0;

    return-object v0
.end method
