.class public final Ll/w6r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z7r0;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Landroid/os/Bundle;

.field public final synthetic d:Ll/xtd;


# direct methods
.method public constructor <init>(Ll/xtd;Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w6r0;->d:Ll/xtd;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w6r0;->a:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Ll/w6r0;->b:Landroid/os/Bundle;

    .line 6
    .line 7
    iput-object p4, p0, Ll/w6r0;->c:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ll/her;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/w6r0;->d:Ll/xtd;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xtd;->p(Ll/xtd;)Ll/her;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/w6r0;->a:Landroid/app/Activity;

    .line 8
    .line 9
    iget-object v1, p0, Ll/w6r0;->b:Landroid/os/Bundle;

    .line 10
    .line 11
    iget-object p0, p0, Ll/w6r0;->c:Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-interface {p1, v0, v1, p0}, Ll/her;->a(Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final zaa()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
