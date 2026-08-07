.class public Ll/kqk$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kqk;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kqk;


# direct methods
.method public constructor <init>(Ll/kqk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kqk$c;->a:Ll/kqk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ll/kqk;->p(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Ll/kqk$c;->a:Ll/kqk;

    .line 6
    .line 7
    iget-object p1, p1, Ll/kqk;->q:Ll/l4g0;

    .line 8
    .line 9
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/kqk$c;->a:Ll/kqk;

    .line 13
    .line 14
    invoke-static {p1}, Ll/kqk;->l(Ll/kqk;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/kqk$c;->a:Ll/kqk;

    .line 21
    .line 22
    invoke-static {p1}, Ll/kqk;->m(Ll/kqk;)Ll/kqk$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/kqk$c;->a:Ll/kqk;

    .line 33
    .line 34
    invoke-static {p0}, Ll/kqk;->m(Ll/kqk;)Ll/kqk$d;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Ll/kqk$d;->onCancel()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
