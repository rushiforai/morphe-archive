.class public final enum Lmcl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lmcl;

.field public static final enum c:Lmcl;

.field public static final synthetic d:[Lmcl;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lmcl;

    const/4 v1, 0x0

    const-string v2, "android"

    const-string v3, "ANDROID"

    invoke-direct {v0, v3, v1, v2}, Lmcl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lmcl;->b:Lmcl;

    new-instance v1, Lmcl;

    const/4 v2, 0x1

    const-string v3, "chromebook"

    const-string v4, "CHROMEBOOK"

    invoke-direct {v1, v4, v2, v3}, Lmcl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lmcl;->c:Lmcl;

    filled-new-array {v0, v1}, [Lmcl;

    move-result-object v0

    sput-object v0, Lmcl;->d:[Lmcl;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lmcl;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmcl;
    .registers 2

    const-class v0, Lmcl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmcl;

    return-object p0
.end method

.method public static values()[Lmcl;
    .registers 1

    sget-object v0, Lmcl;->d:[Lmcl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmcl;

    return-object v0
.end method
