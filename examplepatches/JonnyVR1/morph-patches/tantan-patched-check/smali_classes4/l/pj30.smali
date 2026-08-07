.class public final synthetic Ll/pj30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lv/VImage;

.field public final synthetic d:Lv/VText;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Recommended;

.field public final synthetic f:Landroid/view/View;

.field public final synthetic g:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic h:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pj30;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/pj30;->b:Lv/VText;

    iput-object p3, p0, Ll/pj30;->c:Lv/VImage;

    iput-object p4, p0, Ll/pj30;->d:Lv/VText;

    iput-object p5, p0, Ll/pj30;->e:Lcom/p1/mobile/putong/core/data/Recommended;

    iput-object p6, p0, Ll/pj30;->f:Landroid/view/View;

    iput-object p7, p0, Ll/pj30;->g:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iput-object p8, p0, Ll/pj30;->h:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/pj30;->a:Lv/VDraweeView;

    iget-object v1, p0, Ll/pj30;->b:Lv/VText;

    iget-object v2, p0, Ll/pj30;->c:Lv/VImage;

    iget-object v3, p0, Ll/pj30;->d:Lv/VText;

    iget-object v4, p0, Ll/pj30;->e:Lcom/p1/mobile/putong/core/data/Recommended;

    iget-object v5, p0, Ll/pj30;->f:Landroid/view/View;

    iget-object v6, p0, Ll/pj30;->g:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iget-object v7, p0, Ll/pj30;->h:Lcom/p1/mobile/android/app/Act;

    move-object v8, p1

    check-cast v8, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v8}, Ll/vj30;->d(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
