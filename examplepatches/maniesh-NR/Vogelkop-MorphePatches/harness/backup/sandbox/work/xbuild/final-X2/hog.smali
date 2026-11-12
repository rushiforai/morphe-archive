.class public final enum Lhog;
.super Ljava/lang/Enum;


# static fields
.field public static final enum b:Lhog;

.field public static final synthetic c:[Lhog;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lhog;

    const/4 v1, 0x0

    const-string v2, "preroll"

    const-string v3, "PREROLL"

    invoke-direct {v0, v3, v1, v2}, Lhog;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lhog;

    const/4 v2, 0x1

    const-string v3, "midroll"

    const-string v4, "MIDROLL"

    invoke-direct {v1, v4, v2, v3}, Lhog;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lhog;

    const/4 v3, 0x2

    const-string v4, "postroll"

    const-string v5, "POSTROLL"

    invoke-direct {v2, v5, v3, v4}, Lhog;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lhog;

    const/4 v4, 0x3

    const-string v5, "standalone"

    const-string v6, "STANDALONE"

    invoke-direct {v3, v6, v4, v5}, Lhog;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lhog;->b:Lhog;

    filled-new-array {v0, v1, v2, v3}, [Lhog;

    move-result-object v0

    sput-object v0, Lhog;->c:[Lhog;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lhog;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhog;
    .registers 2

    const-class v0, Lhog;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhog;

    return-object p0
.end method

.method public static values()[Lhog;
    .registers 1

    sget-object v0, Lhog;->c:[Lhog;

    invoke-virtual {v0}, [Lhog;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhog;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhog;->a:Ljava/lang/String;

    return-object p0
.end method
