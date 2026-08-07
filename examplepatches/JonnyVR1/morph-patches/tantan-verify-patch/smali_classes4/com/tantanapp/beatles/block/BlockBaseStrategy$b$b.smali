.class public Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

.field public final synthetic b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

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
    .locals 6

    .line 1
    new-instance v0, Ll/g43;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 9
    .line 10
    invoke-static {v2}, Ll/e1g0;->a([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    sget-object v3, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 21
    .line 22
    iget-object v4, v4, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 23
    .line 24
    iget-object v4, v4, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 25
    .line 26
    invoke-virtual {v4}, Ll/e43;->l()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iget-object v5, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 31
    .line 32
    iget-object v5, v5, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-direct/range {v0 .. v5}, Ll/g43;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->a:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d:[Ljava/lang/StackTraceElement;

    .line 42
    .line 43
    invoke-virtual {v1, v2, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->i([Ljava/lang/StackTraceElement;Ll/g43;)Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b$b;->b:Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
