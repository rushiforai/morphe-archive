.class public final enum Lc0p;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic c:[Lc0p;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lc0p;

    const-string v1, "https://s-odx.oleads.com/"

    const-string v2, "oleads.com"

    const-string v3, "PRIMARY"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lc0p;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lc0p;

    const-string v2, "https://s-odx.osite99.com/"

    const-string v3, "osite99.com"

    const-string v4, "BACKUP"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lc0p;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    filled-new-array {v0, v1}, [Lc0p;

    move-result-object v0

    sput-object v0, Lc0p;->c:[Lc0p;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lc0p;->a:Ljava/lang/String;

    iput-object p4, p0, Lc0p;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc0p;
    .registers 2

    const-class v0, Lc0p;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc0p;

    return-object p0
.end method

.method public static values()[Lc0p;
    .registers 1

    sget-object v0, Lc0p;->c:[Lc0p;

    invoke-virtual {v0}, [Lc0p;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc0p;

    return-object v0
.end method
