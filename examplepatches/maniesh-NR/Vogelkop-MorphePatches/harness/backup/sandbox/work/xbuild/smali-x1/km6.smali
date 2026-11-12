.class public final enum Lkm6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lkm6;

.field public static final enum b:Lkm6;

.field public static final enum c:Lkm6;

.field public static final enum d:Lkm6;

.field public static final enum e:Lkm6;

.field public static final enum f:Lkm6;

.field public static final synthetic g:[Lkm6;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lkm6;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkm6;->a:Lkm6;

    new-instance v1, Lkm6;

    const-string v2, "Manual"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkm6;->b:Lkm6;

    new-instance v2, Lkm6;

    const-string v3, "Auto"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lkm6;->c:Lkm6;

    new-instance v3, Lkm6;

    const-string v4, "DeepLink"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lkm6;->d:Lkm6;

    new-instance v4, Lkm6;

    const-string v5, "AutoSystem"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lkm6;->e:Lkm6;

    new-instance v5, Lkm6;

    const-string v6, "AutoSystem2"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lkm6;->f:Lkm6;

    new-instance v6, Lkm6;

    const-string v7, "SettingsBanner"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v6}, [Lkm6;

    move-result-object v0

    sput-object v0, Lkm6;->g:[Lkm6;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkm6;
    .registers 2

    const-class v0, Lkm6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkm6;

    return-object p0
.end method

.method public static values()[Lkm6;
    .registers 1

    sget-object v0, Lkm6;->g:[Lkm6;

    invoke-virtual {v0}, [Lkm6;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkm6;

    return-object v0
.end method
