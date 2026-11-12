.class public final synthetic Lz82;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Comparable;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 13
    iput-byte p1, p0, Lz82;->a:B

    iput-object p2, p0, Lz82;->b:Ljava/lang/Object;

    iput-object p4, p0, Lz82;->c:Ljava/lang/Comparable;

    iput-object p3, p0, Lz82;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lwu5;Landroid/content/Context;Landroid/net/Uri;Landroid/media/MediaMetadata$Builder;)V
    .registers 5

    const/4 p1, 0x1

    iput-byte p1, p0, Lz82;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lz82;->b:Ljava/lang/Object;

    iput-object p3, p0, Lz82;->c:Ljava/lang/Comparable;

    iput-object p4, p0, Lz82;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lz82;->a:B

    iget-object v1, p0, Lz82;->d:Ljava/lang/Object;

    iget-object v2, p0, Lz82;->c:Ljava/lang/Comparable;

    iget-object p0, p0, Lz82;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_84

    check-cast p0, Lglh;

    check-cast v2, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lglh;->a:Ljlh;

    invoke-virtual {p0, v2}, Ljlh;->k(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_49

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_24
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "image_path"

    invoke-virtual {v3, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "reading"

    const-string v4, "id=?"

    invoke-virtual {p0, v1, v3, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_40
    .catchall {:try_start_24 .. :try_end_40} :catchall_44

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_49

    :catchall_44
    move-exception v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_49
    :goto_49
    return-object v0

    :pswitch_4a
    check-cast p0, Landroid/content/Context;

    check-cast v2, Landroid/net/Uri;

    check-cast v1, Landroid/media/MediaMetadata$Builder;

    invoke-static {p0, v2, v1}, Lwu5;->d(Landroid/content/Context;Landroid/net/Uri;Landroid/media/MediaMetadata$Builder;)V

    invoke-virtual {v1}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p0

    return-object p0

    :pswitch_58
    check-cast p0, Lf92;

    move-object v7, v2

    check-cast v7, Ljava/lang/String;

    check-cast v1, Lau8;

    new-instance v3, Lhv2;

    iget-object v0, p0, Lf92;->a:Luqe;

    if-nez v0, :cond_6d

    const-string v0, ""

    const-wide/32 v4, 0x36ee80

    :goto_6a
    move-wide v5, v4

    move-object v4, v0

    goto :goto_73

    :cond_6d
    const-string v0, "NewsFeed"

    const-wide/32 v4, 0x927c0

    goto :goto_6a

    :goto_73
    iget-object v8, v1, Lau8;->d:Lb59;

    invoke-virtual {p0}, Lf92;->d()Ld53;

    move-result-object v9

    new-instance v10, Lip1;

    const/4 v0, 0x3

    invoke-direct {v10, p0, v0}, Lip1;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v3 .. v10}, Lhv2;-><init>(Ljava/lang/String;JLjava/lang/String;Lb59;Ld53;Lip1;)V

    return-object v3

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_58
        :pswitch_4a
    .end packed-switch
.end method
