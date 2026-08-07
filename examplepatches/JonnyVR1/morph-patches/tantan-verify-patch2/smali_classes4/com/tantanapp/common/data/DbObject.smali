.class public abstract Lcom/tantanapp/common/data/DbObject;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Lcom/tantanapp/common/data/ValueObject;",
        ">",
        "Lcom/tantanapp/common/data/ValueObject<",
        "TD;>;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field public static final DETAILED_LOG_READ_WRITE:Z

.field public static final FAKE_ID_PREFIX:Ljava/lang/String; = "fake_id_"

.field public static final FAKE_ID_PRIVATE_QUESTION_PREFIX:Ljava/lang/String; = "fake_private_question_id_"

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/tantanapp/common/data/DbObject;",
            ">;"
        }
    .end annotation
.end field

.field static i:I


# instance fields
.field public _id:J

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/DbObject$1;

    .line 2
    .line 3
    const-string v1, "id_c"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/tantanapp/common/data/DbObject$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tantanapp/common/data/DbObject;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 9
    .line 10
    new-instance v0, Lcom/tantanapp/common/data/DbObject$2;

    .line 11
    .line 12
    const-string v1, "_id"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/tantanapp/common/data/DbObject$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/tantanapp/common/data/DbObject;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 18
    .line 19
    sget-boolean v0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    sput-boolean v0, Lcom/tantanapp/common/data/DbObject;->DETAILED_LOG_READ_WRITE:Z

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "fake_id_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    sget p0, Lcom/tantanapp/common/data/DbObject;->i:I

    .line 19
    .line 20
    add-int/lit8 v1, p0, 0x1

    .line 21
    .line 22
    sput v1, Lcom/tantanapp/common/data/DbObject;->i:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Byte;)V
    .locals 0

    if-nez p2, :cond_0

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Byte;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V
    .locals 0

    if-nez p2, :cond_0

    .line 25
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Float;)V
    .locals 0

    if-nez p2, :cond_0

    .line 27
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    if-nez p2, :cond_0

    .line 29
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 30
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    if-nez p2, :cond_0

    .line 31
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 32
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Short;)V
    .locals 0

    if-nez p2, :cond_0

    .line 33
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 34
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Short;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    if-nez p2, :cond_0

    .line 19
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V
    .locals 0

    if-nez p2, :cond_0

    .line 23
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    return-void

    .line 24
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    return-void
.end method

.method public static logSqlite(JLjava/lang/String;)V
    .locals 6

    .line 1
    const-wide/32 v0, 0xf4240

    .line 2
    .line 3
    .line 4
    div-long/2addr p0, v0

    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget-boolean v0, Lcom/tantanapp/common/data/DbObject;->DETAILED_LOG_READ_WRITE:Z

    .line 14
    .line 15
    const-string v1, "main"

    .line 16
    .line 17
    const-wide/16 v2, 0xa

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const-wide/16 v4, 0x0

    .line 22
    .line 23
    cmp-long v0, p0, v4

    .line 24
    .line 25
    if-gtz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    cmp-long p0, p0, v2

    .line 29
    .line 30
    if-gtz p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    cmp-long p0, p0, v2

    .line 38
    .line 39
    if-ltz p0, :cond_3

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    sget-boolean p0, Lcom/tantanapp/common/data/orm/DatabaseStore;->DETAILED_LOGGING:Z

    .line 48
    .line 49
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-wide v3, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 24
    .line 25
    iget-wide p0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 26
    .line 27
    cmp-long p0, v3, p0

    .line 28
    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    return v0

    .line 32
    :cond_2
    return v2
.end method

.method public getCopyId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasCopyId()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v3, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v3

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 30
    .line 31
    :cond_1
    return v0
.end method

.method public setCopyId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 2
    .line 3
    return-void
.end method
