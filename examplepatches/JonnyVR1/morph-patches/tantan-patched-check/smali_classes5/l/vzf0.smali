.class public abstract Ll/vzf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected readIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/vzf0;->readIndex:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public CREATE_INDEX(Ll/wzh0;Lcom/tantanapp/common/data/orm/Index;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object p0, p2, Lcom/tantanapp/common/data/orm/Index;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/Filter;->emit()Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "CREATE INDEX IF NOT EXISTS "

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "_"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v3, p2, Lcom/tantanapp/common/data/orm/Index;->columns:[Lcom/tantanapp/common/data/orm/Column;

    .line 32
    .line 33
    invoke-static {v3, v2}, Ll/jyb;->V([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, " ON "

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p1, "("

    .line 51
    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object p1, p2, Lcom/tantanapp/common/data/orm/Index;->columns:[Lcom/tantanapp/common/data/orm/Column;

    .line 56
    .line 57
    const-string p2, ","

    .line 58
    .line 59
    invoke-static {p1, p2}, Ll/jyb;->V([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ")"

    .line 67
    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const/4 p2, 0x0

    .line 76
    invoke-direct {v0, p1, p2}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    filled-new-array {v0, p0}, [Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, " WHERE "

    .line 88
    .line 89
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/SqlSegment;->concat(Ljava/util/List;Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 94
    .line 95
    return-object p0
.end method

.method public CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getDataClass()Ljava/lang/Class;
.end method

.method public getReadIndex()I
    .locals 0

    .line 1
    iget p0, p0, Ll/vzf0;->readIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract init()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TT;"
        }
    .end annotation
.end method

.method public abstract write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation
.end method
