.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ig0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 2
    .line 3
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->W(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 7
    .line 8
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->V(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->S(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)Ll/ig0;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2, p1}, Ll/ig0;->M(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->S(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)Ll/ig0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->f:Lv/VText;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b(Ljava/lang/String;I)V
    .locals 2

    .line 1
    add-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "intl_ai_photo_no"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "e_intl_ai_photo_result_save_btn"

    .line 18
    .line 19
    const-string v1, "p_intl_ai_photo_result"

    .line 20
    .line 21
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;->a:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->T(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)Ll/ye0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ll/ye0;->f0(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
