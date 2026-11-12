.class public abstract Lvqm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const-string v0, "^(www[0-9]*|web|ftp|wap|home|mobile|amp)\\."

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    new-instance v0, Ljava/util/ArrayList;

    const-string v6, "inline"

    const-string v7, "javascript"

    const-string v1, "about"

    const-string v2, "data"

    const-string v3, "file"

    const-string v4, "http"

    const-string v5, "https"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lvqm;->a:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    const-string v5, "http"

    const-string v6, "https"

    const-string v1, "data"

    const-string v2, "blob"

    const-string v3, "file"

    const-string v4, "filesystem"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v0, "chrome"

    const-string v1, "chrome-native"

    const-string v2, "about"

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    const/4 v3, 0x0

    :goto_4c
    if-ge v3, v2, :cond_66

    aget-object v4, v0, v3

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5c

    add-int/lit8 v3, v3, 0x1

    goto :goto_4c

    :cond_5c
    const-string v0, "duplicate element: "

    invoke-static {v4, v0}, Lrfp;->o(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_66
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    return-void
.end method

.method public static a(Lorg/chromium/url/GURL;)Z
    .registers 3

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android-app"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p0

    const-string v0, "intent"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public static b(Lorg/chromium/url/GURL;)Z
    .registers 5

    invoke-static {p0}, Lorg/chromium/url/GURL;->i(Lorg/chromium/url/GURL;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_29

    sget-object v0, Lvqm;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p0

    const-string v0, "chrome"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_29

    invoke-static {v1}, LJ/N;->MvX_j9h6(I)J

    move-result-wide v2

    invoke-static {v2, v3}, LJ/N;->MRiRQ_Ey(J)Z

    move-result p0

    if-nez p0, :cond_2a

    :cond_29
    return v1

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public static c(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "http"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "https"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method
