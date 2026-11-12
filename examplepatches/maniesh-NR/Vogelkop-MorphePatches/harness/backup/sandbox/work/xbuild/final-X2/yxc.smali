.class public final enum Lyxc;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lyxc;

.field public static final enum b:Lyxc;

.field public static final synthetic c:[Lyxc;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lyxc;

    const-string v1, "AUTO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lyxc;->a:Lyxc;

    new-instance v1, Lyxc;

    const-string v2, "MANUAL"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lyxc;->b:Lyxc;

    filled-new-array {v0, v1}, [Lyxc;

    move-result-object v0

    sput-object v0, Lyxc;->c:[Lyxc;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lyxc;
    .registers 2

    const-class v0, Lyxc;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lyxc;

    return-object p0
.end method

.method public static values()[Lyxc;
    .registers 1

    sget-object v0, Lyxc;->c:[Lyxc;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lyxc;

    return-object v0
.end method
