.class Ll/g410$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->w0(Ll/z5m;Ll/dfj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/dfj;

.field final synthetic b:Ll/z5m;

.field final synthetic c:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Ll/dfj;Ll/z5m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$d;->c:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$d;->a:Ll/dfj;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$d;->b:Ll/z5m;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410$d;->c:Ll/g410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/g410$d;->a:Ll/dfj;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/rsy;->addTarget(Ll/dfj;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/g410$d;->b:Ll/z5m;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/z5m;->getInput()Ll/gfj;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/g410$d;->a:Ll/dfj;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/g410$d;->b:Ll/z5m;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/z5m;->getInput()Ll/gfj;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/g410$d;->a:Ll/dfj;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
