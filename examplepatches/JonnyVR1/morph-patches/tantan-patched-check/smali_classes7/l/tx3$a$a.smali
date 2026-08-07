.class public Ll/tx3$a$a;
.super Lokio/ForwardingSink;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tx3$a;-><init>(Ll/tx3;Ll/x4e$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tx3;

.field public final synthetic b:Ll/x4e$b;

.field public final synthetic c:Ll/tx3$a;


# direct methods
.method public constructor <init>(Ll/tx3$a;Lokio/Sink;Ll/tx3;Ll/x4e$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tx3$a$a;->c:Ll/tx3$a;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tx3$a$a;->a:Ll/tx3;

    .line 4
    .line 5
    iput-object p4, p0, Ll/tx3$a$a;->b:Ll/x4e$b;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tx3$a$a;->c:Ll/tx3$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tx3$a;->e:Ll/tx3;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/tx3$a$a;->c:Ll/tx3$a;

    .line 7
    .line 8
    iget-boolean v2, v1, Ll/tx3$a;->d:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, v1, Ll/tx3$a;->d:Z

    .line 18
    .line 19
    iget-object v1, v1, Ll/tx3$a;->e:Ll/tx3;

    .line 20
    .line 21
    iget v3, v1, Ll/tx3;->c:I

    .line 22
    .line 23
    add-int/2addr v3, v2

    .line 24
    iput v3, v1, Ll/tx3;->c:I

    .line 25
    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    invoke-super {p0}, Lokio/ForwardingSink;->close()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/tx3$a$a;->b:Ll/x4e$b;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/x4e$b;->b()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method
