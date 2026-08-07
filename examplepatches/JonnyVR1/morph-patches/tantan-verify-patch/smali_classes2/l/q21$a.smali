.class public Ll/q21$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/q21;


# direct methods
.method public constructor <init>(Ll/q21;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q21$a;->a:Ll/q21;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 4

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/q21$c;

    .line 4
    .line 5
    iget-object v0, p1, Ll/q21$c;->d:Landroid/view/View;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/q21$a;->a:Ll/q21;

    .line 10
    .line 11
    iget-object v0, v0, Ll/q21;->a:Landroid/view/LayoutInflater;

    .line 12
    .line 13
    iget v1, p1, Ll/q21$c;->c:I

    .line 14
    .line 15
    iget-object v2, p1, Ll/q21$c;->b:Landroid/view/ViewGroup;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p1, Ll/q21$c;->d:Landroid/view/View;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p1, Ll/q21$c;->e:Ll/q21$e;

    .line 25
    .line 26
    iget-object v1, p1, Ll/q21$c;->d:Landroid/view/View;

    .line 27
    .line 28
    iget v2, p1, Ll/q21$c;->c:I

    .line 29
    .line 30
    iget-object v3, p1, Ll/q21$c;->b:Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2, v3}, Ll/q21$e;->a(Landroid/view/View;ILandroid/view/ViewGroup;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/q21$a;->a:Ll/q21;

    .line 36
    .line 37
    iget-object p0, p0, Ll/q21;->c:Ll/q21$d;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/q21$d;->d(Ll/q21$c;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0
.end method
