.class public abstract enum Lhs3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Ln9a;

.field public static final enum b:Lfs3;

.field public static final enum c:Les3;

.field public static final enum d:Lgs3;

.field public static final synthetic e:[Lhs3;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lfs3;

    invoke-direct {v0}, Lfs3;-><init>()V

    sput-object v0, Lhs3;->b:Lfs3;

    new-instance v1, Les3;

    invoke-direct {v1}, Les3;-><init>()V

    sput-object v1, Lhs3;->c:Les3;

    new-instance v2, Lgs3;

    invoke-direct {v2}, Lgs3;-><init>()V

    sput-object v2, Lhs3;->d:Lgs3;

    const/4 v3, 0x3

    new-array v3, v3, [Lhs3;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    sput-object v3, Lhs3;->e:[Lhs3;

    new-instance v0, Lh58;

    new-instance v0, Ln9a;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ln9a;-><init>(B)V

    sput-object v0, Lhs3;->a:Ln9a;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhs3;
    .registers 2

    const-class v0, Lhs3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhs3;

    return-object p0
.end method

.method public static values()[Lhs3;
    .registers 1

    sget-object v0, Lhs3;->e:[Lhs3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhs3;

    return-object v0
.end method


# virtual methods
.method public d(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const-string p0, "beta"

    return-object p0
.end method
