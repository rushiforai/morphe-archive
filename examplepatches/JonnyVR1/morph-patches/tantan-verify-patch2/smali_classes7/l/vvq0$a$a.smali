.class Ll/vvq0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vvq0$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ll/vvq0$a;


# direct methods
.method public constructor <init>(Ll/vvq0$a;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vvq0$a$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 3
    .line 4
    invoke-virtual {v1}, Ll/vvq0$a;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 20
    .line 21
    iget-object v2, p0, Ll/vvq0$a$a;->a:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v1, v2, v0}, Ll/vvq0$a;->e(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    goto :goto_7

    .line 32
    :catch_0
    move-exception v1

    .line 33
    goto :goto_4

    .line 34
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 35
    .line 36
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_1
    move-exception v0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :goto_1
    iget-object v0, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 43
    .line 44
    iget-object v0, v0, Ll/vvq0$a;->b:Ll/uvq0;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 49
    .line 50
    .line 51
    goto :goto_3

    .line 52
    :goto_2
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_3
    iget-object v0, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 56
    .line 57
    iget-object p0, p0, Ll/vvq0$a$a;->a:Landroid/content/Context;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ll/vvq0$a;->d(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    goto :goto_6

    .line 63
    :goto_4
    :try_start_2
    invoke-static {v1}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 69
    .line 70
    .line 71
    goto :goto_5

    .line 72
    :catch_2
    move-exception v0

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    :goto_5
    iget-object v0, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 75
    .line 76
    iget-object v0, v0, Ll/vvq0$a;->b:Ll/uvq0;

    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :goto_6
    return-void

    .line 85
    :goto_7
    if-eqz v0, :cond_4

    .line 86
    .line 87
    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 88
    .line 89
    .line 90
    goto :goto_8

    .line 91
    :catch_3
    move-exception v0

    .line 92
    goto :goto_9

    .line 93
    :cond_4
    :goto_8
    iget-object v0, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 94
    .line 95
    iget-object v0, v0, Ll/vvq0$a;->b:Ll/uvq0;

    .line 96
    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 100
    .line 101
    .line 102
    goto :goto_a

    .line 103
    :goto_9
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    :cond_5
    :goto_a
    iget-object v0, p0, Ll/vvq0$a$a;->b:Ll/vvq0$a;

    .line 107
    .line 108
    iget-object p0, p0, Ll/vvq0$a$a;->a:Landroid/content/Context;

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ll/vvq0$a;->d(Landroid/content/Context;)V

    .line 111
    .line 112
    .line 113
    throw v1
.end method
