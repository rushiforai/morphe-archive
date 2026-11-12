.class public final enum Lj2b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lwu5;

.field public static final enum c:Lj2b;

.field public static final enum d:Lj2b;

.field public static final synthetic e:[Lj2b;

.field public static final synthetic f:Lh58;


# instance fields
.field public a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lj2b;

    const-string v1, "PASSWORDS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lj2b;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lj2b;->c:Lj2b;

    new-instance v1, Lj2b;

    const-string v2, "BOOKMARKS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lj2b;-><init>(Ljava/lang/String;IZ)V

    sput-object v1, Lj2b;->d:Lj2b;

    filled-new-array {v0, v1}, [Lj2b;

    move-result-object v0

    sput-object v0, Lj2b;->e:[Lj2b;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lj2b;->f:Lh58;

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lj2b;->b:Lwu5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lj2b;->a:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lj2b;
    .registers 2

    const-class v0, Lj2b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lj2b;

    return-object p0
.end method

.method public static values()[Lj2b;
    .registers 1

    sget-object v0, Lj2b;->e:[Lj2b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lj2b;

    return-object v0
.end method
