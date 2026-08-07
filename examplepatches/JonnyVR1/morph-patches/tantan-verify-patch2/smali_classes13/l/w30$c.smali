.class public Ll/w30$c;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w30;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Lv/VListCell;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lv/VListCell;

    .line 5
    .line 6
    iput-object p1, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/w30$c;)Lv/VListCell;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$c;->a:Lv/VListCell;

    return-object p0
.end method


# virtual methods
.method public b(Lv/VListCell$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 2
    .line 3
    iget-object v1, p1, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 9
    .line 10
    iget-object v1, p1, Lv/VListCell$a;->b:Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/VListCell;->setSubTitle(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 16
    .line 17
    iget-object v1, p1, Lv/VListCell$a;->c:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VListCell;->setDescribe(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 23
    .line 24
    iget v1, p1, Lv/VListCell$a;->d:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VListCell;->setLeftLargeImage(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 30
    .line 31
    iget v1, p1, Lv/VListCell$a;->e:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lv/VListCell;->setLeftSmallImage(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/w30$c;->a:Lv/VListCell;

    .line 37
    .line 38
    iget p1, p1, Lv/VListCell$a;->f:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lv/VListCell;->setRightLayoutRes(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
