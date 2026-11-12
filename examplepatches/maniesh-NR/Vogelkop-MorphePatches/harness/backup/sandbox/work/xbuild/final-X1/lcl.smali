.class public final enum Llcl;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Llcl;

.field public static final enum c:Llcl;

.field public static final synthetic d:[Llcl;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Llcl;

    const/4 v1, 0x0

    const-string v2, "android"

    const-string v3, "ANDROID"

    invoke-direct {v0, v3, v1, v2}, Llcl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Llcl;->b:Llcl;

    new-instance v1, Llcl;

    const/4 v2, 0x1

    const-string v3, "chromebook"

    const-string v4, "CHROMEBOOK"

    invoke-direct {v1, v4, v2, v3}, Llcl;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Llcl;->c:Llcl;

    filled-new-array {v0, v1}, [Llcl;

    move-result-object v0

    sput-object v0, Llcl;->d:[Llcl;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Llcl;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llcl;
    .registers 2

    const-class v0, Llcl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llcl;

    return-object p0
.end method

.method public static values()[Llcl;
    .registers 1

    sget-object v0, Llcl;->d:[Llcl;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llcl;

    return-object v0
.end method
