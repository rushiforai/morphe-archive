.class public final synthetic Ll/tih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tih0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/tih0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/tih0;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iput-object p4, p0, Ll/tih0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-object p5, p0, Ll/tih0;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tih0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/tih0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/tih0;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iget-object v3, p0, Ll/tih0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-object p0, p0, Ll/tih0;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, v1, v2, v3, p0}, Ll/uih0;->m(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
