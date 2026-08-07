.class public Ll/gef0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gef0;->g1(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rmf0;

.field public final synthetic b:Z

.field public final synthetic c:Ll/gef0;


# direct methods
.method public constructor <init>(Ll/gef0;Ll/rmf0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/gef0$a;->c:Ll/gef0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/gef0$a;->a:Ll/rmf0;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/gef0$a;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gef0$a;->a:Ll/rmf0;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/rmf0;->h(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/gef0$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/gef0$a;->c:Ll/gef0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/gef0;->d1(Ll/gef0;)Ll/iam;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/zif0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/gef0$a;->c:Ll/gef0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/gef0;->c1(Ll/gef0;)Lcom/p1/mobile/putong/data/SignUpData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/zif0;->O1(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/gef0$a;->a:Ll/rmf0;

    .line 23
    .line 24
    const-string v0, "signup"

    .line 25
    .line 26
    invoke-virtual {p0, v0, p1}, Ll/rmf0;->i(Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gef0$a;->a:Ll/rmf0;

    .line 2
    .line 3
    const-string v0, "signup"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/rmf0;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
