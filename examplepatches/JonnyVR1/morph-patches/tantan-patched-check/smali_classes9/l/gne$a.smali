.class public Ll/gne$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gne;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gne;


# direct methods
.method public constructor <init>(Ll/gne;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gne$a;->a:Ll/gne;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-static {}, Ll/xra;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/gne$a;->a:Ll/gne;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gne$a;->a:Ll/gne;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gne;->R(Ll/gne;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/xra;->w()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/gne$a;->a:Ll/gne;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gne$a;->a:Ll/gne;

    .line 2
    .line 3
    invoke-static {p0}, Ll/gne;->R(Ll/gne;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gne$a;->a:Ll/gne;

    .line 2
    .line 3
    invoke-static {p0}, Ll/gne;->R(Ll/gne;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
