.class public final Lyo9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqsk;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Le04;

.field public final d:Z

.field public final e:Z

.field public final f:Lzyk;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Le04;ZZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyo9;->a:Landroid/content/Context;

    iput-object p2, p0, Lyo9;->b:Ljava/lang/String;

    iput-object p3, p0, Lyo9;->c:Le04;

    iput-boolean p4, p0, Lyo9;->d:Z

    iput-boolean p5, p0, Lyo9;->e:Z

    new-instance p1, Lal7;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyo9;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 2

    iget-object p0, p0, Lyo9;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxo9;

    invoke-virtual {p0}, Lxo9;->close()V

    :cond_11
    return-void
.end method

.method public final getDatabaseName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyo9;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getWritableDatabase()Lto9;
    .registers 2

    iget-object p0, p0, Lyo9;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxo9;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lxo9;->h(Z)Lto9;

    move-result-object p0

    return-object p0
.end method

.method public final setWriteAheadLoggingEnabled(Z)V
    .registers 4

    iget-object v0, p0, Lyo9;->f:Lzyk;

    invoke-virtual {v0}, Lzyk;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxo9;

    invoke-virtual {v0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->setWriteAheadLoggingEnabled(Z)V

    :cond_11
    iput-boolean p1, p0, Lyo9;->g:Z

    return-void
.end method
