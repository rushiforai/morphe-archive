.class public final enum Lkv8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lkv8;

.field public static final enum c:Lkv8;

.field public static final enum d:Lkv8;

.field public static final synthetic e:[Lkv8;


# instance fields
.field public final a:Ly7h;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lkv8;

    new-instance v1, Lixh;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    const-string v2, "NONE"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lkv8;-><init>(Ljava/lang/String;ILy7h;)V

    sput-object v0, Lkv8;->b:Lkv8;

    new-instance v1, Lkv8;

    new-instance v2, Ljxh;

    const v3, 0x7f070970

    invoke-direct {v2, v3}, Ljxh;-><init>(I)V

    const-string v3, "SMALL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v2}, Lkv8;-><init>(Ljava/lang/String;ILy7h;)V

    new-instance v2, Lkv8;

    new-instance v3, Ljxh;

    const v4, 0x7f07096f

    invoke-direct {v3, v4}, Ljxh;-><init>(I)V

    const-string v4, "MEDIUM"

    const/4 v5, 0x2

    invoke-direct {v2, v4, v5, v3}, Lkv8;-><init>(Ljava/lang/String;ILy7h;)V

    sput-object v2, Lkv8;->c:Lkv8;

    new-instance v3, Lkv8;

    new-instance v4, Ljxh;

    const v5, 0x7f07096e

    invoke-direct {v4, v5}, Ljxh;-><init>(I)V

    const-string v5, "LARGE"

    const/4 v6, 0x3

    invoke-direct {v3, v5, v6, v4}, Lkv8;-><init>(Ljava/lang/String;ILy7h;)V

    sput-object v3, Lkv8;->d:Lkv8;

    filled-new-array {v0, v1, v2, v3}, [Lkv8;

    move-result-object v0

    sput-object v0, Lkv8;->e:[Lkv8;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILy7h;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lkv8;->a:Ly7h;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkv8;
    .registers 2

    const-class v0, Lkv8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkv8;

    return-object p0
.end method

.method public static values()[Lkv8;
    .registers 1

    sget-object v0, Lkv8;->e:[Lkv8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkv8;

    return-object v0
.end method
