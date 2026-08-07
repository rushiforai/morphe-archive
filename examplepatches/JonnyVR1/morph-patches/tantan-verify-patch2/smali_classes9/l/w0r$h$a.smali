.class public Ll/w0r$h$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r$h;->t(Landroid/view/View;Ll/oze$a;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/oze$a;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/w0r$h;


# direct methods
.method public constructor <init>(Ll/w0r$h;Landroid/view/View;Ll/oze$a;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$h$a;->d:Ll/w0r$h;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w0r$h$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/w0r$h$a;->b:Ll/oze$a;

    .line 6
    .line 7
    iput-object p4, p0, Ll/w0r$h$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/w0r$h$a;->d:Ll/w0r$h;

    .line 2
    .line 3
    iget-object v1, v0, Ll/w0r$h;->f:Ll/w0r;

    .line 4
    .line 5
    iget-object v2, p0, Ll/w0r$h$a;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, p0, Ll/w0r$h$a;->b:Ll/oze$a;

    .line 12
    .line 13
    iget v3, v3, Ll/oze$a;->d:I

    .line 14
    .line 15
    iget-object v4, p0, Ll/w0r$h$a;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3, v4}, Ll/w0r;->O(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Ll/w0r$h;->e:Landroid/widget/PopupWindow;

    .line 22
    .line 23
    iget-object v0, p0, Ll/w0r$h$a;->d:Ll/w0r$h;

    .line 24
    .line 25
    iget-object v1, v0, Ll/w0r$h;->f:Ll/w0r;

    .line 26
    .line 27
    iget-object v0, v0, Ll/w0r$h;->e:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    iget-object p0, p0, Ll/w0r$h$a;->a:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v1, v0, p0, p1}, Ll/w0r;->g0(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method
