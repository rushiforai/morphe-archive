.class public final enum Lskg;
.super Ljava/lang/Enum;


# static fields
.field public static final enum b:Lskg;

.field public static final enum c:Lskg;

.field public static final enum d:Lskg;

.field public static final synthetic e:[Lskg;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lskg;

    const/4 v1, 0x0

    const-string v2, "minimized"

    const-string v3, "MINIMIZED"

    invoke-direct {v0, v3, v1, v2}, Lskg;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lskg;

    const/4 v2, 0x1

    const-string v3, "collapsed"

    const-string v4, "COLLAPSED"

    invoke-direct {v1, v4, v2, v3}, Lskg;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lskg;->b:Lskg;

    new-instance v2, Lskg;

    const/4 v3, 0x2

    const-string v4, "normal"

    const-string v5, "NORMAL"

    invoke-direct {v2, v5, v3, v4}, Lskg;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lskg;->c:Lskg;

    new-instance v3, Lskg;

    const/4 v4, 0x3

    const-string v5, "expanded"

    const-string v6, "EXPANDED"

    invoke-direct {v3, v6, v4, v5}, Lskg;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lskg;

    const/4 v5, 0x4

    const-string v6, "fullscreen"

    const-string v7, "FULLSCREEN"

    invoke-direct {v4, v7, v5, v6}, Lskg;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lskg;->d:Lskg;

    filled-new-array {v0, v1, v2, v3, v4}, [Lskg;

    move-result-object v0

    sput-object v0, Lskg;->e:[Lskg;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lskg;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lskg;
    .registers 2

    const-class v0, Lskg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lskg;

    return-object p0
.end method

.method public static values()[Lskg;
    .registers 1

    sget-object v0, Lskg;->e:[Lskg;

    invoke-virtual {v0}, [Lskg;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lskg;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lskg;->a:Ljava/lang/String;

    return-object p0
.end method
