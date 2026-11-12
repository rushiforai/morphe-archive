.class public final enum Lti3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lti3;

.field public static final enum c:Lti3;

.field public static final enum d:Lti3;

.field public static final synthetic e:[Lti3;

.field public static final synthetic f:Lh58;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lti3;

    const-string v1, "RECOMMENDED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lti3;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lti3;->b:Lti3;

    new-instance v1, Lti3;

    const-string v2, "OTHER"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lti3;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lti3;->c:Lti3;

    new-instance v2, Lti3;

    const-string v3, "REGIONAL"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lti3;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lti3;->d:Lti3;

    filled-new-array {v0, v1, v2}, [Lti3;

    move-result-object v0

    sput-object v0, Lti3;->e:[Lti3;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lti3;->f:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lti3;->a:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lti3;
    .registers 2

    const-class v0, Lti3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lti3;

    return-object p0
.end method

.method public static values()[Lti3;
    .registers 1

    sget-object v0, Lti3;->e:[Lti3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lti3;

    return-object v0
.end method
