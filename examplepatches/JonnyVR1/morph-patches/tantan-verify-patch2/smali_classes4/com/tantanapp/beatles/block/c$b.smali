.class public Lcom/tantanapp/beatles/block/c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/util/Printer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/beatles/block/c;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/block/c;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/c$b;->a:Lcom/tantanapp/beatles/block/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public println(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, ">>>>> Dispatching"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/block/c$b;->a:Lcom/tantanapp/beatles/block/c;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/beatles/block/c;->k(Lcom/tantanapp/beatles/block/c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const-string v0, "<<<<< Finished"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/beatles/block/c$b;->a:Lcom/tantanapp/beatles/block/c;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/tantanapp/beatles/block/c;->k(Lcom/tantanapp/beatles/block/c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->j()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
