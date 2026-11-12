.class public final enum Lnan;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lavj;

.field public static final c:Lnan;

.field public static final synthetic d:[Lnan;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnan;

    const/4 v1, 0x0

    const-string v2, "gnosis"

    const-string v3, "Gnosis"

    invoke-direct {v0, v3, v1, v2}, Lnan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnan;

    const/4 v2, 0x1

    const-string v3, "vica"

    const-string v4, "Vica"

    invoke-direct {v1, v4, v2, v3}, Lnan;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array {v0, v1}, [Lnan;

    move-result-object v1

    sput-object v1, Lnan;->d:[Lnan;

    new-instance v2, Lh58;

    invoke-direct {v2, v1}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v2, Lnan;->e:Lh58;

    new-instance v1, Lavj;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lavj;-><init>(B)V

    sput-object v1, Lnan;->b:Lavj;

    sput-object v0, Lnan;->c:Lnan;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnan;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnan;
    .registers 2

    const-class v0, Lnan;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnan;

    return-object p0
.end method

.method public static values()[Lnan;
    .registers 1

    sget-object v0, Lnan;->d:[Lnan;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnan;

    return-object v0
.end method
