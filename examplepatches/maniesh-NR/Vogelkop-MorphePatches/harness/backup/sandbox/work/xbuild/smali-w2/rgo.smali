.class public final enum Lrgo;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lrgo;

.field public static final enum b:Lrgo;

.field public static final enum c:Lrgo;

.field public static final synthetic d:[Lrgo;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lrgo;

    const-string v1, "INTACT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lrgo;->a:Lrgo;

    new-instance v1, Lrgo;

    const-string v2, "REMOVED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lrgo;->b:Lrgo;

    new-instance v2, Lrgo;

    const-string v3, "REPLACED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lrgo;->c:Lrgo;

    filled-new-array {v0, v1, v2}, [Lrgo;

    move-result-object v0

    sput-object v0, Lrgo;->d:[Lrgo;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrgo;
    .registers 2

    const-class v0, Lrgo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrgo;

    return-object p0
.end method

.method public static values()[Lrgo;
    .registers 1

    sget-object v0, Lrgo;->d:[Lrgo;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrgo;

    return-object v0
.end method
