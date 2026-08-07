.class public final synthetic Ll/ngh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ngh0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ngh0;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iput-object p3, p0, Ll/ngh0;->c:Landroid/view/View;

    iput-object p4, p0, Ll/ngh0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ngh0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/ngh0;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iget-object v2, p0, Ll/ngh0;->c:Landroid/view/View;

    iget-object p0, p0, Ll/ngh0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, v1, v2, p0}, Ll/uih0;->H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
