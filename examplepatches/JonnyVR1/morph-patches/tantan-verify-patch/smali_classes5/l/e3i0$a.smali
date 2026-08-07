.class public Ll/e3i0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e3i0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e3i0;


# direct methods
.method public constructor <init>(Ll/e3i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e3i0$a;->a:Ll/e3i0;

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
    check-cast p1, Ll/e3i0$c;

    .line 4
    .line 5
    iget-object v0, p1, Ll/e3i0$c;->d:Landroid/view/View;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p1, Ll/e3i0$c;->f:Ll/e3i0$e;

    .line 11
    .line 12
    iget v2, p1, Ll/e3i0$c;->c:I

    .line 13
    .line 14
    iget-object v3, p1, Ll/e3i0$c;->b:Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-interface {v1, v0, v2, v3}, Ll/e3i0$e;->a(Landroid/view/View;ILandroid/view/ViewGroup;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Ll/e3i0$a;->a:Ll/e3i0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/e3i0$d;->i(Ll/e3i0$c;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0
.end method
