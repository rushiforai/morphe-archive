.class public final Ll/w2w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/faw0;


# instance fields
.field public final a:Ll/y3w0;


# direct methods
.method public constructor <init>(Ll/y3w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w2w0;->a:Ll/y3w0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ll/u9w0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w2w0;->a:Ll/y3w0;

    .line 2
    .line 3
    check-cast p0, Ll/t2w0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/t2w0;->b()Ll/p5u0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p0, p1, Ll/u9w0;->a:Ll/p5u0;

    .line 10
    .line 11
    return-void
.end method

.method public final b(Ll/gaw0;)Ll/hpr;
    .locals 2

    .line 1
    check-cast p1, Ll/x2w0;

    .line 2
    .line 3
    iget-object v0, p1, Ll/x2w0;->b:Ll/z3w0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/x2w0;->a:Ll/x3w0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/w2w0;->a:Ll/y3w0;

    .line 8
    .line 9
    check-cast p0, Ll/t2w0;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Ll/t2w0;->c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
