.class public abstract Ll/vvq0$b;
.super Ll/vvq0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vvq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/vvq0$a;"
    }
.end annotation


# instance fields
.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/String;

.field private j:[Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Ljava/lang/String;

.field private n:I

.field private o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/vvq0$a;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vvq0$b;->o:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/vvq0$b;->h:Ljava/util/List;

    .line 12
    .line 13
    iput-object p3, p0, Ll/vvq0$b;->i:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p4, p0, Ll/vvq0$b;->j:[Ljava/lang/String;

    .line 16
    .line 17
    iput-object p5, p0, Ll/vvq0$b;->k:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p6, p0, Ll/vvq0$b;->l:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p7, p0, Ll/vvq0$b;->m:Ljava/lang/String;

    .line 22
    .line 23
    iput p8, p0, Ll/vvq0$b;->n:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()Landroid/database/sqlite/SQLiteDatabase;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vvq0$a;->b:Ll/uvq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/vvq0$b;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vvq0$b;->h:Ljava/util/List;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/vvq0$b;->h:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    new-array v0, v0, [Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Ll/vvq0$b;->h:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-object v5, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move-object v5, v1

    .line 33
    :goto_0
    iget v0, p0, Ll/vvq0$b;->n:I

    .line 34
    .line 35
    if-gtz v0, :cond_1

    .line 36
    .line 37
    :goto_1
    move-object v11, v1

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    goto :goto_1

    .line 44
    :goto_2
    iget-object v4, p0, Ll/vvq0$a;->a:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v6, p0, Ll/vvq0$b;->i:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v7, p0, Ll/vvq0$b;->j:[Ljava/lang/String;

    .line 49
    .line 50
    iget-object v8, p0, Ll/vvq0$b;->k:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v9, p0, Ll/vvq0$b;->l:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v10, p0, Ll/vvq0$b;->m:Ljava/lang/String;

    .line 55
    .line 56
    move-object v3, p2

    .line 57
    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    if-eqz p2, :cond_4

    .line 62
    .line 63
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/vvq0$b;->i(Landroid/content/Context;Landroid/database/Cursor;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    iget-object v1, p0, Ll/vvq0$b;->o:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :cond_3
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object p2, p0, Ll/vvq0$b;->o:Ljava/util/List;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Ll/vvq0$b;->j(Landroid/content/Context;Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public abstract i(Landroid/content/Context;Landroid/database/Cursor;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract j(Landroid/content/Context;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation
.end method
