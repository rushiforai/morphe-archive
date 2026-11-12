.class public final enum Lft8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Li06;

.field public static final b:Lft8;

.field public static final synthetic c:[Lft8;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lft8;

    const-string v1, "Production"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lft8;

    const-string v2, "Staging"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1}, [Lft8;

    move-result-object v1

    sput-object v1, Lft8;->c:[Lft8;

    new-instance v2, Lh58;

    invoke-direct {v2, v1}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v2, Lft8;->d:Lh58;

    new-instance v1, Li06;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Li06;-><init>(B)V

    sput-object v1, Lft8;->a:Li06;

    sput-object v0, Lft8;->b:Lft8;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lft8;
    .registers 2

    const-class v0, Lft8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lft8;

    return-object p0
.end method

.method public static values()[Lft8;
    .registers 1

    sget-object v0, Lft8;->c:[Lft8;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lft8;

    return-object v0
.end method
