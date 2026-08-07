.class public final Ll/djt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/joy0;


# instance fields
.field public final a:Ll/wit0;

.field public final b:Ll/joy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wit0;Ll/joy0;)V
    .locals 0
    .param p2    # Ll/joy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/djt0;->a:Ll/wit0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/djt0;->b:Ll/joy0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final M6()V
    .locals 0

    .line 1
    return-void
.end method

.method public final O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/djt0;->b:Ll/joy0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/joy0;->O()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final P2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/djt0;->b:Ll/joy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/joy0;->P2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/djt0;->a:Ll/wit0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/wit0;->n0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final g7()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/djt0;->b:Ll/joy0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/joy0;->m4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final m5(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/djt0;->b:Ll/joy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/joy0;->m5(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/djt0;->a:Ll/wit0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/wit0;->r()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
