.class Ll/ib4$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ib4;->E1(ILl/row;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ib4;


# direct methods
.method public constructor <init>(Ll/ib4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4$e;->a:Ll/ib4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/ib4$e;->a:Ll/ib4;

    .line 2
    .line 3
    iget-object p2, p2, Ll/ib4;->o:Ll/q210$a;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "line 468 error"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/ib4$e;->a:Ll/ib4;

    .line 33
    .line 34
    iget-object p2, p2, Ll/ib4;->o:Ll/q210$a;

    .line 35
    .line 36
    const/16 v0, 0x4100

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {p2, v0, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
