.class public final Le/e/a/CommentFonts194;
.super Ljava/lang/Object;
.source "CommentFonts194.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentFonts194$Picker;,
        Le/e/a/CommentFonts194$Result;
    }
.end annotation


# static fields
.field static final FILE:Ljava/lang/String; = "comment_font_file"

.field static final IO:Ljava/util/concurrent/ExecutorService;

.field static final LIMIT:I = 0x1000000

.field static final NAME:Ljava/lang/String; = "comment_font_name"

.field static volatile cached:Landroid/graphics/Typeface;

.field static volatile cachedPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 17
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/CommentFonts194;->IO:Ljava/util/concurrent/ExecutorService;

    .line 19
    const-string v0, ""

    sput-object v0, Le/e/a/CommentFonts194;->cachedPath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static choose(Landroid/app/Activity;Le/e/a/CommentFonts194$Result;)V
    .registers 3

    .line 30
    new-instance v0, Le/e/a/CommentFonts194$Picker;

    invoke-direct {v0}, Le/e/a/CommentFonts194$Picker;-><init>()V

    iput-object p1, v0, Le/e/a/CommentFonts194$Picker;->result:Le/e/a/CommentFonts194$Result;

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    const-string p1, "nicoid-comment-font-picker"

    invoke-virtual {p0, v0, p1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method static current(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 1

    invoke-static {p0}, Le/e/a/FontSelection195;->current(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method static prime(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .registers 2

    .line 32
    sput-object p1, Le/e/a/CommentFonts194;->cached:Landroid/graphics/Typeface;

    sput-object p0, Le/e/a/CommentFonts194;->cachedPath:Ljava/lang/String;

    return-void
.end method

.method static validate(Ljava/io/File;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_93

    :try_start_8
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    const-wide/16 v4, 0xc

    cmp-long p0, v2, v4

    if-ltz p0, :cond_85

    const-wide/32 v6, 0x1000000

    cmp-long p0, v2, v6

    if-gtz p0, :cond_85

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result p0

    const/high16 v6, 0x10000

    if-eq p0, v6, :cond_34

    const v6, 0x4f54544f    # 3.56229504E9f

    if-eq p0, v6, :cond_34

    const v6, 0x74727565

    if-ne p0, v6, :cond_2c

    goto :goto_34

    :cond_2c
    new-instance p0, Ljava/io/IOException;

    const-string v0, "TTF\u307e\u305f\u306fOTF\u30d5\u30a9\u30f3\u30c8\u3092\u9078\u629e\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_33
    throw p0

    :cond_34
    :goto_34
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result p0
    :try_end_38
    .catchall {:try_start_8 .. :try_end_38} :catchall_8d

    const-string v6, "\u30d5\u30a9\u30f3\u30c8\u30d5\u30a1\u30a4\u30eb\u304c\u7834\u640d\u3057\u3066\u3044\u307e\u3059"

    const/4 v7, 0x1

    if-lt p0, v7, :cond_7f

    const/16 v7, 0x100

    if-gt p0, v7, :cond_7f

    const-wide/16 v7, 0x10

    int-to-long v9, p0

    mul-long v9, v9, v7

    add-long/2addr v9, v4

    cmp-long v7, v9, v2

    if-gtz v7, :cond_7f

    :try_start_4b
    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_4e
    .catchall {:try_start_4b .. :try_end_4e} :catchall_8d

    const/4 v4, 0x0

    :goto_4f
    if-lt v4, p0, :cond_55

    :try_start_51
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_93

    return-void

    :cond_55
    :try_start_55
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v5

    int-to-long v7, v5

    const-wide v9, 0xffffffffL

    and-long/2addr v7, v9

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v5

    int-to-long v11, v5

    and-long/2addr v9, v11

    cmp-long v5, v7, v2

    if-gtz v5, :cond_79

    sub-long v7, v2, v7

    cmp-long v5, v9, v7

    if-gtz v5, :cond_79

    add-int/lit8 v4, v4, 0x1

    goto :goto_4f

    :cond_79
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_33

    :cond_7f
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_33

    :cond_85
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u30d5\u30a9\u30f3\u30c8\u30d5\u30a1\u30a4\u30eb\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_8c
    .catchall {:try_start_55 .. :try_end_8c} :catchall_8d

    goto :goto_33

    :catchall_8d
    move-exception p0

    move-object v0, p0

    :try_start_8f
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    throw v0
    :try_end_93
    .catchall {:try_start_8f .. :try_end_93} :catchall_93

    :catchall_93
    move-exception p0

    if-eqz v0, :cond_9c

    if-eq v0, p0, :cond_9b

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9b
    move-object p0, v0

    :cond_9c
    throw p0
.end method
