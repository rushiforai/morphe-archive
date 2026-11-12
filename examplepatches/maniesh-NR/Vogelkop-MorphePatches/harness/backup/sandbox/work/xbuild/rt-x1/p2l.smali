.class public final enum Lp2l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lp2l;

.field public static final enum b:Lp2l;

.field public static final synthetic c:[Lp2l;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lp2l;

    const-string v1, "AUTO_SCROLL_TO_INSERTS_OR_ACTIVE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lp2l;->a:Lp2l;

    new-instance v1, Lp2l;

    const-string v2, "NONE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lp2l;->b:Lp2l;

    filled-new-array {v0, v1}, [Lp2l;

    move-result-object v0

    sput-object v0, Lp2l;->c:[Lp2l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lp2l;
    .registers 2

    const-class v0, Lp2l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lp2l;

    return-object p0
.end method

.method public static values()[Lp2l;
    .registers 1

    sget-object v0, Lp2l;->c:[Lp2l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lp2l;

    return-object v0
.end method
