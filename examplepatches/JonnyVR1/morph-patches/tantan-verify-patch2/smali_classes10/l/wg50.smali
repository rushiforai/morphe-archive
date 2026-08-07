.class public Ll/wg50;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/smc0;


# direct methods
.method public constructor <init>(Ll/smc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wg50;->a:Ll/smc0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/qy3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wg50;->a:Ll/smc0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/smc0;->a(Ll/qy3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wg50;->a:Ll/smc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/smc0;->f()Ll/jx5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/wg50;->a:Ll/smc0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/smc0;->f()Ll/jx5;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/jx5;->r()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wg50;->a:Ll/smc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/smc0;->f()Ll/jx5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/wg50;->a:Ll/smc0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/smc0;->f()Ll/jx5;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/jx5;->s()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
