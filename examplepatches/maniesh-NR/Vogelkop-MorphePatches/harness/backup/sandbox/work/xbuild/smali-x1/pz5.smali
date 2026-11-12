.class public final Lpz5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/util/regex/Pattern;

.field public static final c:Ljava/util/regex/Pattern;

.field public static final d:Lyg9;


# instance fields
.field public final a:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "\\.dmp([0-9]*)\\z"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lpz5;->b:Ljava/util/regex/Pattern;

    const-string v0, "\\.dmp([0-9]*)(\\.try([0-9]+))\\z"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lpz5;->c:Ljava/util/regex/Pattern;

    new-instance v0, Lyg9;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lyg9;-><init>(B)V

    sput-object v0, Lpz5;->d:Lyg9;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_8

    iput-object p1, p0, Lpz5;->a:Ljava/io/File;

    return-void

    :cond_8
    const-string p0, "Specified context cannot be null."

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static b(Ljava/lang/String;)I
    .registers 4

    const-string v0, ".try"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ltz v0, :cond_29

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/util/Scanner;

    invoke-direct {v0, p0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    const-string v2, "[^0-9]+"

    invoke-virtual {v0, v2}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v0

    :try_start_1a
    invoke-virtual {v0}, Ljava/util/Scanner;->nextInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0
    :try_end_26
    .catch Ljava/util/NoSuchElementException; {:try_start_1a .. :try_end_26} :catch_29

    if-nez p0, :cond_29

    return v0

    :catch_29
    :cond_29
    return v1
.end method


# virtual methods
.method public final a(Ljava/util/regex/Pattern;)[Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lpz5;->a:Ljava/io/File;

    const-string v2, "crash_dumps"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-eqz p1, :cond_11

    new-instance v1, Loz5;

    invoke-direct {v1, p0, p1}, Loz5;-><init>(Lpz5;Ljava/util/regex/Pattern;)V

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_1c

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/io/File;

    return-object p0

    :cond_1c
    sget-object p1, Lpz5;->d:Lyg9;

    invoke-static {p0, p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object p0
.end method
