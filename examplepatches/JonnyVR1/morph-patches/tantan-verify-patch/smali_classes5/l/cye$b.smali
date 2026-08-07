.class public Ll/cye$b;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cye;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cye$b;->a:Landroid/view/View;

    .line 5
    .line 6
    sget v0, Ll/adc0;->s3:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VDraweeView;

    .line 13
    .line 14
    iput-object v0, p0, Ll/cye$b;->c:Lv/VDraweeView;

    .line 15
    .line 16
    sget v0, Ll/adc0;->s0:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/cye$b;->b:Landroid/view/View;

    .line 23
    .line 24
    sget v0, Ll/adc0;->Xb:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/widget/ImageView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/cye$b;->d:Landroid/widget/ImageView;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/EmojiType;IZ)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cye$b;->c:Lv/VDraweeView;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, p1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lcom/p1/mobile/putong/data/EmojiItem;

    .line 17
    .line 18
    iget-object v3, v3, Lcom/p1/mobile/putong/data/EmojiItem;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v3, ".png"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/cye$b;->a:Landroid/view/View;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    sget p3, Ll/dbc0;->is:I

    .line 41
    .line 42
    invoke-virtual {v0, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    iget-object p3, p0, Ll/cye$b;->d:Landroid/widget/ImageView;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p3, -0x1

    .line 53
    invoke-virtual {v0, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object p3, p0, Ll/cye$b;->d:Landroid/widget/ImageView;

    .line 57
    .line 58
    invoke-static {p3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    :goto_0
    div-int/lit8 p3, p2, 0x4

    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    div-int/lit8 v0, v0, 0x4

    .line 70
    .line 71
    if-eq p3, v0, :cond_2

    .line 72
    .line 73
    add-int/lit8 p2, p2, 0x4

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/EmojiType;->items:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-lt p2, p1, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    return-void

    .line 85
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/cye$b;->b:Landroid/view/View;

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
