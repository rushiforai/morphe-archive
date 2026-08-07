.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->g:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->g:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;->s(Lcom/p1/mobile/putong/core/newui/home/views/CardPhotoFeedbackViewOpt;Lcom/p1/mobile/putong/data/User;Z)V

    .line 17
    .line 18
    .line 19
    const-string p0, "e_fake_online_yes"

    .line 20
    .line 21
    const-string p1, "p_suggest_users_home_view"

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
