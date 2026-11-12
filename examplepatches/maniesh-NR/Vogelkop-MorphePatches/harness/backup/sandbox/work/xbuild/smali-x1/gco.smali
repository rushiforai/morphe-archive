.class public abstract Lgco;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Ljava/util/HashSet;

    const-string v8, "yandex.uz"

    const-string v9, "ya.ru"

    const-string v1, "yandex.by"

    const-string v2, "yandex.com"

    const-string v3, "yandex.com.tr"

    const-string v4, "yandex.kz"

    const-string v5, "yandex.net"

    const-string v6, "yandex.ru"

    const-string v7, "yandex.ua"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lgco;->a:Ljava/util/HashSet;

    return-void
.end method

.method public static a(Leri;)Z
    .registers 4

    instance-of v0, p0, Ll6e;

    if-eqz v0, :cond_23

    check-cast p0, Ll6e;

    iget v0, p0, Ll6e;->h:I

    if-eqz v0, :cond_21

    const/4 v1, 0x1

    if-eq v0, v1, :cond_10

    const/4 v2, 0x3

    if-ne v0, v2, :cond_23

    :cond_10
    iget-object p0, p0, Ll6e;->d:Ljava/lang/String;

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lgco;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_23

    return v1

    :cond_21
    const/4 p0, 0x0

    throw p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method
