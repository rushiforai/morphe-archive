.class public abstract Lq3b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkotlin/text/Regex;

.field public static final b:Lkotlin/text/Regex;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/text/Regex;

    sget-object v1, Lirh;->b:Lirh;

    const-string v2, "<TITLE>([^<]*)</TITLE>"

    invoke-direct {v0, v2, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lirh;)V

    sput-object v0, Lq3b;->a:Lkotlin/text/Regex;

    new-instance v0, Lkotlin/text/Regex;

    const-string v2, "<H1>([^<]*)</H1>"

    invoke-direct {v0, v2, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lirh;)V

    sput-object v0, Lq3b;->b:Lkotlin/text/Regex;

    return-void
.end method

.method public static a(Ljava/io/File;)Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    const-string v1, "Takeout/Chrome"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_55

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_55

    new-instance p0, Ljava/io/File;

    const-string v1, "Bookmarks.html"

    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_21

    return-object p0

    :cond_21
    new-instance p0, Lo3b;

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lo3b;-><init>(B)V

    invoke-virtual {v0, p0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_55

    invoke-static {p0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p0

    new-instance v0, Lq9a;

    const/16 v2, 0x1a

    invoke-direct {v0, v2}, Lq9a;-><init>(B)V

    new-instance v2, Lzx1;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    new-instance v0, Lp3b;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/io/File;

    array-length v0, p0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_55

    aget-object p0, p0, v1

    return-object p0

    :cond_55
    const/4 p0, 0x0

    return-object p0
.end method
