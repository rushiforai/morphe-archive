.class public final enum Lnil;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lnil;

.field public static final enum c:Lnil;

.field public static final synthetic d:[Lnil;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnil;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, "DEFAULT"

    invoke-direct {v0, v3, v1, v2}, Lnil;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnil;->b:Lnil;

    new-instance v1, Lnil;

    const/4 v2, 0x1

    const-string v3, "Anton"

    const-string v4, "ANTON"

    invoke-direct {v1, v4, v2, v3}, Lnil;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lnil;->c:Lnil;

    filled-new-array {v0, v1}, [Lnil;

    move-result-object v0

    sput-object v0, Lnil;->d:[Lnil;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lnil;->e:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnil;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnil;
    .registers 2

    const-class v0, Lnil;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnil;

    return-object p0
.end method

.method public static values()[Lnil;
    .registers 1

    sget-object v0, Lnil;->d:[Lnil;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnil;

    return-object v0
.end method
