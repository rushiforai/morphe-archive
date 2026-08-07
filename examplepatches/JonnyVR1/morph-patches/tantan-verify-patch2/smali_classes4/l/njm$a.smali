.class public Ll/njm$a;
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
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/njm;


# direct methods
.method public constructor <init>(Ll/njm;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/njm$a;->b:Ll/njm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/njm$a;->a:Lcom/p1/mobile/putong/data/User;

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
    iget-object p1, p0, Ll/njm$a;->b:Ll/njm;

    .line 2
    .line 3
    iget p1, p1, Ll/njm;->g:I

    .line 4
    .line 5
    if-lez p1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/njm$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/njm$a;->b:Ll/njm;

    .line 18
    .line 19
    iget-object p1, p1, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->d()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/njm$a;->b:Ll/njm;

    .line 25
    .line 26
    iget-object p1, p1, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/njm$a;->b:Ll/njm;

    .line 32
    .line 33
    iget v0, p1, Ll/njm;->g:I

    .line 34
    .line 35
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    iput v0, p1, Ll/njm;->g:I

    .line 38
    .line 39
    iget-object p1, p0, Ll/njm$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Ll/njm$a;->b:Ll/njm;

    .line 46
    .line 47
    iget-object v0, v0, Ll/njm;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/njm$a;->b:Ll/njm;

    .line 53
    .line 54
    iget-object p1, p0, Ll/njm;->f:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 55
    .line 56
    iget p0, p0, Ll/njm;->g:I

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method
