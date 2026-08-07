.class Ll/ir2$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ir2;->p(Ll/c3d0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/c3d0;

.field final synthetic b:Ll/ir2;


# direct methods
.method public constructor <init>(Ll/ir2;Ll/c3d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ir2$b;->b:Ll/ir2;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ir2$b;->a:Ll/c3d0;

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ir2$b;->b:Ll/ir2;

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    const-string v2, "\u672a\u77e5\u9519\u8bef"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v2}, Ll/ir2;->n(ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0}, Ll/c3d0;->e()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/ir2$b;->b:Ll/ir2;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/c3d0;->c()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/c3d0;->a()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ll/ze2;

    .line 35
    .line 36
    iget-object v3, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/c3d0;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v0, v2, v3}, Ll/ir2;->q(ILl/ze2;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/c3d0;->c()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object v2, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/c3d0;->d()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, p0, Ll/ir2$b;->a:Ll/c3d0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/c3d0;->b()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v1, v0, v2, v3}, Ll/ir2;->n(ILjava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    iget-object p0, p0, Ll/ir2$b;->b:Ll/ir2;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ir2;->o()V

    .line 70
    .line 71
    .line 72
    return-void
.end method
