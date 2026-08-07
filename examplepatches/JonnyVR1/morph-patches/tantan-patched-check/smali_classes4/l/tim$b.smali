.class public Ll/tim$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tim;->a(Lcom/p1/mobile/putong/data/User;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/tim;


# direct methods
.method public constructor <init>(Ll/tim;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tim$b;->b:Ll/tim;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tim$b;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/tim$b;->b:Ll/tim;

    .line 2
    .line 3
    iget p1, p1, Ll/tim;->g:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/tim$b;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/tim$b;->b:Ll/tim;

    .line 16
    .line 17
    iget v0, p1, Ll/tim;->g:I

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    iput v0, p1, Ll/tim;->g:I

    .line 22
    .line 23
    iget-object p1, p0, Ll/tim$b;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    iget-object v0, p0, Ll/tim$b;->b:Ll/tim;

    .line 32
    .line 33
    iget-object v0, v0, Ll/tim;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/tim$b;->b:Ll/tim;

    .line 39
    .line 40
    iget-object p1, p0, Ll/tim;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 41
    .line 42
    iget p0, p0, Ll/tim;->g:I

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
