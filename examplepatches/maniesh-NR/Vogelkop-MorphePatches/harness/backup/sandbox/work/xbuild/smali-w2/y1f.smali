.class public final enum Ly1f;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ly1f;

.field public static final enum b:Ly1f;

.field public static final synthetic c:[Ly1f;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ly1f;

    const-string v1, "ENABLE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ly1f;->a:Ly1f;

    new-instance v1, Ly1f;

    const-string v2, "DISABLE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ly1f;->b:Ly1f;

    filled-new-array {v0, v1}, [Ly1f;

    move-result-object v0

    sput-object v0, Ly1f;->c:[Ly1f;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ly1f;
    .registers 2

    const-class v0, Ly1f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ly1f;

    return-object p0
.end method

.method public static values()[Ly1f;
    .registers 1

    sget-object v0, Ly1f;->c:[Ly1f;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ly1f;

    return-object v0
.end method
