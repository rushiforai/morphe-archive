.class public final synthetic Ll/vq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:I

.field public final synthetic e:Ll/xl80;

.field public final synthetic f:Ll/y0m;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

    iput-object p2, p0, Ll/vq20;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p3, p0, Ll/vq20;->c:Ljava/util/ArrayList;

    iput p4, p0, Ll/vq20;->d:I

    iput-object p5, p0, Ll/vq20;->e:Ll/xl80;

    iput-object p6, p0, Ll/vq20;->f:Ll/y0m;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/vq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;

    iget-object v1, p0, Ll/vq20;->b:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object v2, p0, Ll/vq20;->c:Ljava/util/ArrayList;

    iget v3, p0, Ll/vq20;->d:I

    iget-object v4, p0, Ll/vq20;->e:Ll/xl80;

    iget-object v5, p0, Ll/vq20;->f:Ll/y0m;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->s(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Landroid/view/View;)V

    return-void
.end method
