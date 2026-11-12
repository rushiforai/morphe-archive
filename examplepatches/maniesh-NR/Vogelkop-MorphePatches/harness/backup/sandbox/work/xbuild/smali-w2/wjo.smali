.class public final enum Lwjo;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lwjo;

.field public static final synthetic c:[Lwjo;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lwjo;

    const-string v1, "REGULAR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lwjo;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lwjo;->b:Lwjo;

    new-instance v1, Lwjo;

    const-string v2, "SERVER_BIDDING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lwjo;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lwjo;

    const-string v3, "CLIENT_BIDDING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lwjo;-><init>(Ljava/lang/String;II)V

    filled-new-array {v0, v1, v2}, [Lwjo;

    move-result-object v0

    sput-object v0, Lwjo;->c:[Lwjo;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lwjo;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwjo;
    .registers 2

    const-class v0, Lwjo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwjo;

    return-object p0
.end method

.method public static values()[Lwjo;
    .registers 1

    sget-object v0, Lwjo;->c:[Lwjo;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwjo;

    return-object v0
.end method
