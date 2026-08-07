.class Ll/biw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/biw;->H()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/biw;


# direct methods
.method public constructor <init>(Ll/biw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/biw$b;->a:Ll/biw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/biw$b;->a:Ll/biw;

    .line 2
    .line 3
    invoke-static {p2}, Ll/biw;->f(Ll/biw;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    monitor-enter p2

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/biw$b;->a:Ll/biw;

    .line 9
    .line 10
    invoke-static {v0}, Ll/biw;->l(Ll/biw;)Ll/xpl$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/biw$b;->a:Ll/biw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/biw;->l(Ll/biw;)Ll/xpl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0, p1}, Ll/xpl$a;->onData([B)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/biw$b;->a:Ll/biw;

    .line 29
    .line 30
    invoke-static {v0}, Ll/biw;->n(Ll/biw;)Landroid/hardware/Camera;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/biw$b;->a:Ll/biw;

    .line 37
    .line 38
    invoke-static {p0}, Ll/biw;->n(Ll/biw;)Landroid/hardware/Camera;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 43
    .line 44
    .line 45
    :cond_1
    monitor-exit p2

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method
