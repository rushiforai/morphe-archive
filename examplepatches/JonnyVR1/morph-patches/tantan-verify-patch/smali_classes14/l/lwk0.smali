.class public Ll/lwk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lwk0$a;
    }
.end annotation


# instance fields
.field public a:Ll/zwk0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/mwk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lwk0;-><init>()V

    return-void
.end method

.method public static b()Ll/lwk0;
    .locals 1

    .line 1
    invoke-static {}, Ll/lwk0$a;->a()Ll/lwk0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/zwk0;->u(Z)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zwk0;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/zwk0;->t()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public e(Ll/xnu;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/zwk0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/zwk0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 11
    .line 12
    new-instance v1, Ll/axk0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/axk0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/zwk0;->r(Ll/axk0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/lwk0;->a:Ll/zwk0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/zwk0;->J(Ll/xnu;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method
