.class public Ll/njm$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/njm;->a(Lcom/p1/mobile/putong/data/User;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/njm;


# direct methods
.method public constructor <init>(Ll/njm;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/njm$b;->c:Ll/njm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/njm$b;->a:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Ll/njm$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/njm$b;->c:Ll/njm;

    .line 2
    .line 3
    iget p1, p1, Ll/njm;->g:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/njm$b;->a:Ljava/util/List;

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
    if-ge p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/njm$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object v0, p0, Ll/njm$b;->c:Ll/njm;

    .line 18
    .line 19
    iget v0, v0, Ll/njm;->g:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/njm$b;->c:Ll/njm;

    .line 30
    .line 31
    iget-object p1, p1, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->d()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Ll/njm$b;->c:Ll/njm;

    .line 37
    .line 38
    iget v0, p1, Ll/njm;->g:I

    .line 39
    .line 40
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    iput v0, p1, Ll/njm;->g:I

    .line 43
    .line 44
    iget-object p1, p0, Ll/njm$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Ll/njm$b;->c:Ll/njm;

    .line 51
    .line 52
    iget-object v0, v0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/njm$b;->c:Ll/njm;

    .line 58
    .line 59
    iget-object p1, p0, Ll/njm;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 60
    .line 61
    iget p0, p0, Ll/njm;->g:I

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method
