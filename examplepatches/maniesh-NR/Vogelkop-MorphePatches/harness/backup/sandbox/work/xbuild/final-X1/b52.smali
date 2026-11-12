.class public final enum Lb52;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lqii;

.field public static final enum c:Lb52;

.field public static final enum d:Lb52;

.field public static final enum e:Lb52;

.field public static final synthetic f:[Lb52;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lb52;

    const-string v1, "FILE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lb52;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lb52;->c:Lb52;

    new-instance v1, Lb52;

    const-string v2, "HIGHLIGHTED_TEXT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lb52;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lb52;->d:Lb52;

    new-instance v2, Lb52;

    const-string v3, "DEEP_THINK_STATE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lb52;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lb52;->e:Lb52;

    filled-new-array {v0, v1, v2}, [Lb52;

    move-result-object v0

    sput-object v0, Lb52;->f:[Lb52;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lb52;->g:Lh58;

    new-instance v0, Lqii;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb52;->b:Lqii;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lb52;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb52;
    .registers 2

    const-class v0, Lb52;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb52;

    return-object p0
.end method

.method public static values()[Lb52;
    .registers 1

    sget-object v0, Lb52;->f:[Lb52;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb52;

    return-object v0
.end method
