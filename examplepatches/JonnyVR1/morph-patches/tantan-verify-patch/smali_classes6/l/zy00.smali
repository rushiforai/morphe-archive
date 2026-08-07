.class public final synthetic Ll/zy00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zy00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p2, p0, Ll/zy00;->b:Landroid/view/View;

    iput-object p3, p0, Ll/zy00;->c:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zy00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, p0, Ll/zy00;->b:Landroid/view/View;

    iget-object p0, p0, Ll/zy00;->c:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o2(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Landroid/view/View;)V

    return-void
.end method
