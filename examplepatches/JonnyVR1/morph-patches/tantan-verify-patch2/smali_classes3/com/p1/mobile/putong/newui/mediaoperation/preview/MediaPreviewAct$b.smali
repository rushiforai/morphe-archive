.class public final Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/content/Context;

.field public e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

.field public f:Z

.field public g:Lcom/p1/mobile/putong/data/Media;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/String;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->d:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ll/q2y;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/content/Intent;
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->d:Landroid/content/Context;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "selectedMedias"

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const-string v1, "initialShowIndex"

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->b:I

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v1, "maxCount"

    .line 25
    .line 26
    iget v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a:I

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string v1, "MediaPickerParamsObject"

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    const-string v1, "showAllPhotoInPhone"

    .line 39
    .line 40
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f:Z

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    const-string v1, "selectedMedia"

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g:Lcom/p1/mobile/putong/data/Media;

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    const-string v1, "filterPhoto"

    .line 53
    .line 54
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->h:Z

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    const-string v1, "disableScroll"

    .line 60
    .line 61
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i:Z

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    const-string v1, "filterVideo"

    .line 67
    .line 68
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    const-string v1, "selectFolder"

    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->k:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    const-string v1, "needPassThrough"

    .line 81
    .line 82
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->l:Z

    .line 83
    .line 84
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    return-object v0
.end method

.method public b()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->h:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public f(I)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method
