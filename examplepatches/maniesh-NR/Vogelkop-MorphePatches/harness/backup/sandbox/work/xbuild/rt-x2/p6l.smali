.class public final enum Lp6l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lp6l;

.field public static final enum b:Lp6l;

.field public static final synthetic c:[Lp6l;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lp6l;

    const-string v1, "NORMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lp6l;->a:Lp6l;

    new-instance v1, Lp6l;

    const-string v2, "INCOGNITO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lp6l;->b:Lp6l;

    filled-new-array {v0, v1}, [Lp6l;

    move-result-object v0

    sput-object v0, Lp6l;->c:[Lp6l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lp6l;
    .registers 2

    const-class v0, Lp6l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lp6l;

    return-object p0
.end method

.method public static values()[Lp6l;
    .registers 1

    sget-object v0, Lp6l;->c:[Lp6l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lp6l;

    return-object v0
.end method
