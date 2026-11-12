.class public final enum Lo0a;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lo0a;

.field public static final enum b:Lo0a;

.field public static final synthetic c:[Lo0a;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lo0a;

    const-string v1, "AI_MODE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lo0a;->a:Lo0a;

    new-instance v1, Lo0a;

    const-string v2, "CREATE_IMAGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lo0a;->b:Lo0a;

    filled-new-array {v0, v1}, [Lo0a;

    move-result-object v0

    sput-object v0, Lo0a;->c:[Lo0a;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lo0a;
    .registers 2

    const-class v0, Lo0a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lo0a;

    return-object p0
.end method

.method public static values()[Lo0a;
    .registers 1

    sget-object v0, Lo0a;->c:[Lo0a;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lo0a;

    return-object v0
.end method


# virtual methods
.method public final d(Ll08;)Z
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_4d

    const/4 v1, 0x0

    if-ne p0, v0, :cond_49

    if-eqz p1, :cond_d

    return v0

    :cond_d
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_11
    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb0a;

    if-eqz p1, :cond_45

    instance-of v2, p1, Lzz9;

    if-eqz v2, :cond_32

    check-cast p1, Lzz9;

    iget-object p1, p1, Lzz9;->c:Lo29;

    sget-object v2, Ln0a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    if-ne p1, v0, :cond_44

    goto :goto_11

    :cond_32
    instance-of v2, p1, La0a;

    if-eqz v2, :cond_45

    check-cast p1, La0a;

    iget-object p1, p1, La0a;->c:Lo29;

    sget-object v2, Ln0a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    if-eq p1, v0, :cond_11

    :cond_44
    return v1

    :cond_45
    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_49
    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_4d
    return v0
.end method
