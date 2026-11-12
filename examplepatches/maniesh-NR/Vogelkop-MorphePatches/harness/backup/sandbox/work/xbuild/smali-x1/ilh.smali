.class public final Lilh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Z

.field public final h:Z

.field public i:Ljava/lang/Long;

.field public final j:Ljava/lang/String;

.field public final k:J


# direct methods
.method public constructor <init>(Lhlh;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lhlh;->a:Landroid/database/Cursor;

    iget v1, p1, Lhlh;->d:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lilh;->c:Ljava/lang/String;

    iget v1, p1, Lhlh;->e:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lilh;->d:J

    iget v1, p1, Lhlh;->g:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lilh;->f:Ljava/lang/String;

    iget v1, p1, Lhlh;->j:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lilh;->j:Ljava/lang/String;

    iget v1, p1, Lhlh;->b:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lilh;->a:J

    iget v1, p1, Lhlh;->f:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lilh;->e:Ljava/lang/String;

    iget v1, p1, Lhlh;->h:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_41

    move v2, v4

    goto :goto_42

    :cond_41
    move v2, v3

    :goto_42
    iput-boolean v2, p0, Lilh;->g:Z

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_4c

    move v3, v4

    :cond_4c
    iput-boolean v3, p0, Lilh;->h:Z

    iget v1, p1, Lhlh;->c:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lilh;->b:Ljava/lang/String;

    iget v1, p1, Lhlh;->i:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_60

    const/4 v1, 0x0

    goto :goto_68

    :cond_60
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :goto_68
    iput-object v1, p0, Lilh;->i:Ljava/lang/Long;

    iget p1, p1, Lhlh;->k:I

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lilh;->k:J

    return-void
.end method
