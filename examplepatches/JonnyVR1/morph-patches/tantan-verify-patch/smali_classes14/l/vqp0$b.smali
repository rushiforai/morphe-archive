.class public Ll/vqp0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vqp0;->v()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rx3$a;

.field public final synthetic b:Ll/vqp0;


# direct methods
.method public constructor <init>(Ll/vqp0;Ll/rx3$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vqp0$b;->a:Ll/rx3$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/vqp0$b;->a:Ll/rx3$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/rx3$a;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/vqp0;->Q(Ll/vqp0;)Ll/lup0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/tqp0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/tqp0;->o0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/pf60;

    .line 21
    .line 22
    const-string v1, "web_page_open_state"

    .line 23
    .line 24
    const-string v2, "success"

    .line 25
    .line 26
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/pf60;

    .line 30
    .line 31
    const-string v2, "web_page_open_error_msg"

    .line 32
    .line 33
    const-string v3, ""

    .line 34
    .line 35
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/pf60;

    .line 39
    .line 40
    iget-object p0, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 41
    .line 42
    invoke-static {p0}, Ll/vqp0;->R(Ll/vqp0;)Ll/lup0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/tqp0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/tqp0;->o0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v3, "page_id"

    .line 53
    .line 54
    invoke-direct {v2, v3, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/pf60;

    .line 58
    .line 59
    const-string v3, "page_from_type"

    .line 60
    .line 61
    const-string v4, "network_h5"

    .line 62
    .line 63
    invoke-direct {p0, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    filled-new-array {v0, v1, v2, p0}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v0, "e_web_open"

    .line 71
    .line 72
    invoke-static {v0, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqp0$b;->a:Ll/rx3$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/rx3$a;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/vqp0;->W()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/vqp0;->S(Ll/vqp0;)Ll/lup0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/tqp0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/tqp0;->o0()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p3, Ll/pf60;

    .line 19
    .line 20
    const-string v0, "web_page_open_state"

    .line 21
    .line 22
    const-string v1, "fail"

    .line 23
    .line 24
    invoke-direct {p3, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/pf60;

    .line 28
    .line 29
    const-string v1, "web_page_open_error_msg"

    .line 30
    .line 31
    invoke-direct {v0, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    new-instance p2, Ll/pf60;

    .line 35
    .line 36
    iget-object p0, p0, Ll/vqp0$b;->b:Ll/vqp0;

    .line 37
    .line 38
    invoke-static {p0}, Ll/vqp0;->T(Ll/vqp0;)Ll/lup0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/tqp0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/tqp0;->o0()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "page_id"

    .line 49
    .line 50
    invoke-direct {p2, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/pf60;

    .line 54
    .line 55
    const-string v1, "page_from_type"

    .line 56
    .line 57
    const-string v2, "network_h5"

    .line 58
    .line 59
    invoke-direct {p0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    filled-new-array {p3, v0, p2, p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p2, "e_web_open"

    .line 67
    .line 68
    invoke-static {p2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
