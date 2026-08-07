.class public Ll/w0r$j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r$j;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/LinearLayout;

.field public final synthetic b:Ll/oze$a;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/w0r$j;


# direct methods
.method public constructor <init>(Ll/w0r$j;Landroid/widget/LinearLayout;Ll/oze$a;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$j$a;->d:Ll/w0r$j;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w0r$j$a;->a:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    iput-object p3, p0, Ll/w0r$j$a;->b:Ll/oze$a;

    .line 6
    .line 7
    iput-object p4, p0, Ll/w0r$j$a;->c:Ljava/lang/String;

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
    iget-object v0, p0, Ll/w0r$j$a;->d:Ll/w0r$j;

    .line 2
    .line 3
    iget-object v1, v0, Ll/w0r$j;->g:Ll/w0r;

    .line 4
    .line 5
    iget-boolean v2, v1, Ll/w0r;->r:Z

    .line 6
    .line 7
    iget-object v3, p0, Ll/w0r$j$a;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Ll/w0r$j$a;->b:Ll/oze$a;

    .line 16
    .line 17
    iget v3, v3, Ll/oze$a;->d:I

    .line 18
    .line 19
    iget-object v4, p0, Ll/w0r$j$a;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3, v4}, Ll/w0r;->N(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Ll/w0r$j;->d:Landroid/widget/PopupWindow;

    .line 26
    .line 27
    iget-object v0, p0, Ll/w0r$j$a;->d:Ll/w0r$j;

    .line 28
    .line 29
    iget-object v1, v0, Ll/w0r$j;->g:Ll/w0r;

    .line 30
    .line 31
    iget-object v0, v0, Ll/w0r$j;->d:Landroid/widget/PopupWindow;

    .line 32
    .line 33
    iget-object p0, p0, Ll/w0r$j$a;->a:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {v1, v0, p0, p1}, Ll/w0r;->f0(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p0, Ll/w0r$j$a;->b:Ll/oze$a;

    .line 44
    .line 45
    iget v3, v3, Ll/oze$a;->d:I

    .line 46
    .line 47
    iget-object v4, p0, Ll/w0r$j$a;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2, v3, v4}, Ll/w0r;->O(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Ll/w0r$j;->d:Landroid/widget/PopupWindow;

    .line 54
    .line 55
    iget-object v0, p0, Ll/w0r$j$a;->d:Ll/w0r$j;

    .line 56
    .line 57
    iget-object v1, v0, Ll/w0r$j;->g:Ll/w0r;

    .line 58
    .line 59
    iget-object v0, v0, Ll/w0r$j;->d:Landroid/widget/PopupWindow;

    .line 60
    .line 61
    iget-object p0, p0, Ll/w0r$j$a;->a:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {v1, v0, p0, p1}, Ll/w0r;->g0(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    const/4 p0, 0x1

    .line 67
    return p0
.end method
