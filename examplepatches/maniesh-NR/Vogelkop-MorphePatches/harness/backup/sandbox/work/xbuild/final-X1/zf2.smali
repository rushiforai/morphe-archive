.class public final enum Lzf2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lzf2;

.field public static final enum b:Lzf2;

.field public static final enum c:Lzf2;

.field public static final synthetic d:[Lzf2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lzf2;

    const-string v1, "PLAY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzf2;->a:Lzf2;

    new-instance v1, Lzf2;

    const-string v2, "PAUSE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lzf2;->b:Lzf2;

    new-instance v2, Lzf2;

    const-string v3, "DISABLED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lzf2;->c:Lzf2;

    filled-new-array {v0, v1, v2}, [Lzf2;

    move-result-object v0

    sput-object v0, Lzf2;->d:[Lzf2;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzf2;
    .registers 2

    const-class v0, Lzf2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lzf2;

    return-object p0
.end method

.method public static values()[Lzf2;
    .registers 1

    sget-object v0, Lzf2;->d:[Lzf2;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzf2;

    return-object v0
.end method
