.class public Ll/ref0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ref0;->f1(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rmf0;

.field public final synthetic b:Z

.field public final synthetic c:Ll/ref0;


# direct methods
.method public constructor <init>(Ll/ref0;Ll/rmf0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ref0$a;->c:Ll/ref0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ref0$a;->a:Ll/rmf0;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ref0$a;->b:Z

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
    iget-object p0, p0, Ll/ref0$a;->a:Ll/rmf0;

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
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ref0$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ref0$a;->c:Ll/ref0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/ref0;->c1(Ll/ref0;)Ll/iam;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/mgf0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/mgf0;->q1()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/ref0$a;->a:Ll/rmf0;

    .line 17
    .line 18
    const-string v0, "signup"

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Ll/rmf0;->i(Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ref0$a;->a:Ll/rmf0;

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
