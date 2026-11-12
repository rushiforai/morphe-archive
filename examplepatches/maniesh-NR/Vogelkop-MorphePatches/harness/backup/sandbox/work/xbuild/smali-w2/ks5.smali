.class public final enum Lks5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lks5;

.field public static final enum c:Lks5;

.field public static final synthetic d:[Lks5;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lks5;

    const-string v1, "PNG"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lks5;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lks5;->b:Lks5;

    new-instance v1, Lks5;

    const-string v4, "JPEG"

    invoke-direct {v1, v4, v3, v2}, Lks5;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lks5;->c:Lks5;

    filled-new-array {v0, v1}, [Lks5;

    move-result-object v0

    sput-object v0, Lks5;->d:[Lks5;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lks5;->a:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lks5;
    .registers 2

    const-class v0, Lks5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lks5;

    return-object p0
.end method

.method public static values()[Lks5;
    .registers 1

    sget-object v0, Lks5;->d:[Lks5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lks5;

    return-object v0
.end method
