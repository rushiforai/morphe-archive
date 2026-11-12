.class public abstract enum Lqlm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lolm;

.field public static final enum b:Lplm;

.field public static final synthetic c:[Lqlm;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lolm;

    invoke-direct {v0}, Lolm;-><init>()V

    sput-object v0, Lqlm;->a:Lolm;

    new-instance v1, Lplm;

    invoke-direct {v1}, Lplm;-><init>()V

    sput-object v1, Lqlm;->b:Lplm;

    const/4 v2, 0x2

    new-array v2, v2, [Lqlm;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    sput-object v2, Lqlm;->c:[Lqlm;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lqlm;
    .registers 2

    const-class v0, Lqlm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lqlm;

    return-object p0
.end method

.method public static values()[Lqlm;
    .registers 1

    sget-object v0, Lqlm;->c:[Lqlm;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lqlm;

    return-object v0
.end method


# virtual methods
.method public d(Z)Z
    .registers 2

    return p1
.end method

.method public g(Z)Z
    .registers 2

    return p1
.end method

.method public h(Lr22;Ljava/util/Set;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method
