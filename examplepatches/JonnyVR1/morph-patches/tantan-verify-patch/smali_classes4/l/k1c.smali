.class public Ll/k1c;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"


# static fields
.field public static b:Ll/k1c;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "global_exceptions"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, p1, v0, v1, p2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 5
    .line 6
    .line 7
    iput p3, p0, Ll/k1c;->a:I

    .line 8
    .line 9
    return-void
.end method

.method public static k()Ll/k1c;
    .locals 1

    .line 1
    sget-object v0, Ll/k1c;->b:Ll/k1c;

    .line 2
    .line 3
    return-object v0
.end method

.method public static n(Landroid/content/Context;)V
    .locals 3

    .line 1
    sget-object v0, Ll/k1c;->b:Ll/k1c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Ll/k1c;

    .line 6
    .line 7
    invoke-static {p0}, Ll/yx0;->b(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-direct {v0, p0, v2, v1}, Ll/k1c;-><init>(Landroid/content/Context;II)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/k1c;->b:Ll/k1c;

    .line 16
    .line 17
    iget p0, v0, Ll/k1c;->a:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/m6f;->a(I)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/k1c;->b:Ll/k1c;

    .line 23
    .line 24
    iget p0, p0, Ll/k1c;->a:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/qtb;->a(I)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/k1c;->b:Ll/k1c;

    .line 30
    .line 31
    iget p0, p0, Ll/k1c;->a:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/f9r;->a(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v0, Lcom/tantanapp/beatles/safety/exception/IgnoreException;

    .line 39
    .line 40
    const-string v1, "\u5f02\u5e38\u4e8b\u4ef6\u8bb0\u5f55\u5e93\u521b\u5efa\u5931\u8d25\uff01"

    .line 41
    .line 42
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/beatles/safety/exception/IgnoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    throw v0

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/k1c;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 1
    const-string p0, "CREATE TABLE exception (className Text,methodName Text,lineNumber INTEGER,version INTEGER,fileName Text)"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "CREATE TABLE crash (counter INTEGER,version INTEGER)"

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "CREATE TABLE launchRecord (counter INTEGER,version INTEGER)"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 1
    return-void
.end method
