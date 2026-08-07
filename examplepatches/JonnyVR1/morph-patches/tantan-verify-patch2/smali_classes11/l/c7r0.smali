.class public final Ll/c7r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z7r0;


# instance fields
.field public final synthetic a:Landroid/os/Bundle;

.field public final synthetic b:Ll/xtd;


# direct methods
.method public constructor <init>(Ll/xtd;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7r0;->b:Ll/xtd;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c7r0;->a:Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/her;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/c7r0;->b:Ll/xtd;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xtd;->p(Ll/xtd;)Ll/her;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/c7r0;->a:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/her;->l(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final zaa()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
