.class public final enum Ljv9;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ljv9;

.field public static final synthetic b:[Ljv9;

.field public static final synthetic c:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljv9;

    const-string v1, "NO_SIGNAL_SENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljv9;->a:Ljv9;

    new-instance v1, Ljv9;

    const-string v2, "POSITIVE_SIGNAL_SENT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Ljv9;

    const-string v3, "NEGATIVE_SIGNAL_SENT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Ljv9;

    move-result-object v0

    sput-object v0, Ljv9;->b:[Ljv9;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ljv9;->c:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljv9;
    .registers 2

    const-class v0, Ljv9;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljv9;

    return-object p0
.end method

.method public static values()[Ljv9;
    .registers 1

    sget-object v0, Ljv9;->b:[Ljv9;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljv9;

    return-object v0
.end method
