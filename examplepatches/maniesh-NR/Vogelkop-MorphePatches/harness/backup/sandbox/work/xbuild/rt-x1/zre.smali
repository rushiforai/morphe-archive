.class public final Lzre;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxbh;


# instance fields
.field public final a:Lua7;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lua7;

    invoke-direct {v0, p1}, Lua7;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lzre;->a:Lua7;

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 3

    const/4 p0, 0x1

    if-eq p1, p0, :cond_a

    const/4 v0, 0x2

    if-eq p1, v0, :cond_a

    const/4 v0, 0x3

    if-eq p1, v0, :cond_a

    const/4 p0, 0x0

    :cond_a
    return p0
.end method

.method public final b(ILandroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)Lwbh;
    .registers 14

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    iget-object v6, p0, Lzre;->a:Lua7;

    if-eqz p1, :cond_2a

    const/4 p0, 0x1

    if-eq p1, p0, :cond_1f

    const/4 p0, 0x2

    if-ne p1, p0, :cond_19

    new-instance v0, Lwoc;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lwoc;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)V

    return-object v0

    :cond_19
    new-instance p0, Lejb;

    invoke-direct {p0}, Lejb;-><init>()V

    throw p0

    :cond_1f
    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    new-instance v0, Lqe3;

    invoke-direct/range {v0 .. v6}, Lqe3;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V

    return-object v0

    :cond_2a
    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    new-instance v0, Ls82;

    invoke-direct/range {v0 .. v6}, Ls82;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;Lua7;)V

    return-object v0
.end method
