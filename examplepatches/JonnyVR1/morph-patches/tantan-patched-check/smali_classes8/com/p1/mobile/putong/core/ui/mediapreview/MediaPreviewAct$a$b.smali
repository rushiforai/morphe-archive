.class public Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/am50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->c:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->a:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c(FF)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->a:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 6
    .line 7
    const-string v0, "real_shot"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->b:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 17
    .line 18
    cmpg-float v1, p2, v0

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    if-gtz v1, :cond_0

    .line 23
    .line 24
    move v1, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, v2

    .line 27
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->a:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 28
    .line 29
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->a:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 38
    .line 39
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Message;->isLocal()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    move v2, v3

    .line 48
    :cond_1
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->O(ZZ)V

    .line 49
    .line 50
    .line 51
    :cond_2
    cmpl-float p1, p2, v0

    .line 52
    .line 53
    if-ltz p1, :cond_3

    .line 54
    .line 55
    invoke-static {}, Ll/bnl0;->w0()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    int-to-float p1, p1

    .line 60
    invoke-static {}, Ll/bnl0;->w0()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    int-to-float v0, v0

    .line 65
    add-float/2addr v0, p2

    .line 66
    div-float/2addr p1, v0

    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->c:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/high16 p2, 0x437f0000    # 255.0f

    .line 80
    .line 81
    mul-float/2addr p1, p2

    .line 82
    float-to-int p1, p1

    .line 83
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;->c:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
