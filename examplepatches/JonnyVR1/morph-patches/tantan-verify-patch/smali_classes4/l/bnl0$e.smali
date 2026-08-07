.class public Ll/bnl0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/view/ViewTreeObserver;

.field public final synthetic c:Ll/pcj;


# direct methods
.method public constructor <init>(Landroid/view/ViewTreeObserver;Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bnl0$e;->b:Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bnl0$e;->c:Ll/pcj;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/bnl0$e;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bnl0$e;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/bnl0$e;->a:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/bnl0$e;->b:Landroid/view/ViewTreeObserver;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/bnl0$e;->b:Landroid/view/ViewTreeObserver;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/bnl0$e;->c:Ll/pcj;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    return v1
.end method
