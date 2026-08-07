.class public Ll/ocd0$a;
.super Ll/dcd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ocd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ocd0;


# direct methods
.method public constructor <init>(Ll/ocd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ocd0$a;->a:Ll/ocd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dcd0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocd0$a;->a:Ll/ocd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ocd0;->b(Ll/ocd0;)Ll/kr40;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ocd0$a;->a:Ll/ocd0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/ocd0;->b(Ll/ocd0;)Ll/kr40;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/kr40;->e()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocd0$a;->a:Ll/ocd0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/ocd0;->d(Ll/ocd0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ocd0$a;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/ocd0$a;->a:Ll/ocd0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/ocd0;->c(Ll/ocd0;)Ll/lcd0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/lcd0;->q0()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p0}, Ll/ocd0;->e(Ll/ocd0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
