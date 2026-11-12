.class public final enum Lphe;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Ls16;

.field public static final b:Lphe;

.field public static final synthetic c:[Lphe;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lphe;

    const-string v1, "TOP_LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lphe;

    const-string v2, "TOP_RIGHT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lphe;

    const-string v3, "BOTTOM_LEFT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v3, Lphe;

    const-string v4, "BOTTOM_RIGHT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2, v3}, [Lphe;

    move-result-object v0

    sput-object v0, Lphe;->c:[Lphe;

    new-instance v0, Lh58;

    new-instance v0, Ls16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lphe;->a:Ls16;

    sput-object v1, Lphe;->b:Lphe;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lphe;
    .registers 2

    const-class v0, Lphe;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lphe;

    return-object p0
.end method

.method public static values()[Lphe;
    .registers 1

    sget-object v0, Lphe;->c:[Lphe;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lphe;

    return-object v0
.end method
