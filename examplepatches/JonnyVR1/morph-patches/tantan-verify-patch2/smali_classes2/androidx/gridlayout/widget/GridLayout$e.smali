.class public final Landroidx/gridlayout/widget/GridLayout$e;
.super Landroidx/gridlayout/widget/GridLayout$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/gridlayout/widget/GridLayout;->h(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/gridlayout/widget/GridLayout$i;

.field public final synthetic b:Landroidx/gridlayout/widget/GridLayout$i;


# direct methods
.method public constructor <init>(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/gridlayout/widget/GridLayout$e;->a:Landroidx/gridlayout/widget/GridLayout$i;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/gridlayout/widget/GridLayout$e;->b:Landroidx/gridlayout/widget/GridLayout$i;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/gridlayout/widget/GridLayout$i;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;II)I
    .locals 2

    .line 1
    invoke-static {p1}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$e;->b:Landroidx/gridlayout/widget/GridLayout$i;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$e;->a:Landroidx/gridlayout/widget/GridLayout$i;

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Landroidx/gridlayout/widget/GridLayout$i;->a(Landroid/view/View;II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SWITCHING[L:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Landroidx/gridlayout/widget/GridLayout$e;->a:Landroidx/gridlayout/widget/GridLayout$i;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroidx/gridlayout/widget/GridLayout$i;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", R:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$e;->b:Landroidx/gridlayout/widget/GridLayout$i;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout$i;->c()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p0, "]"

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public d(Landroid/view/View;I)I
    .locals 2

    .line 1
    invoke-static {p1}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$e;->b:Landroidx/gridlayout/widget/GridLayout$i;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$e;->a:Landroidx/gridlayout/widget/GridLayout$i;

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroidx/gridlayout/widget/GridLayout$i;->d(Landroid/view/View;I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
