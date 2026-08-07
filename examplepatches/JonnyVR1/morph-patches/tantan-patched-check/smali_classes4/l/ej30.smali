.class public final synthetic Ll/ej30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Lv/VImage;

.field public final synthetic d:Lv/VText;

.field public final synthetic e:Landroid/view/View;

.field public final synthetic f:Lcom/p1/mobile/android/app/Act;

.field public final synthetic g:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

.field public final synthetic h:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ej30;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/ej30;->b:Lv/VText;

    iput-object p3, p0, Ll/ej30;->c:Lv/VImage;

    iput-object p4, p0, Ll/ej30;->d:Lv/VText;

    iput-object p5, p0, Ll/ej30;->e:Landroid/view/View;

    iput-object p6, p0, Ll/ej30;->f:Lcom/p1/mobile/android/app/Act;

    iput-object p7, p0, Ll/ej30;->g:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-object p8, p0, Ll/ej30;->h:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ej30;->a:Lv/VDraweeView;

    iget-object v1, p0, Ll/ej30;->b:Lv/VText;

    iget-object v2, p0, Ll/ej30;->c:Lv/VImage;

    iget-object v3, p0, Ll/ej30;->d:Lv/VText;

    iget-object v4, p0, Ll/ej30;->e:Landroid/view/View;

    iget-object v5, p0, Ll/ej30;->f:Lcom/p1/mobile/android/app/Act;

    iget-object v6, p0, Ll/ej30;->g:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iget-object v7, p0, Ll/ej30;->h:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    move-object v8, p1

    check-cast v8, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v8}, Ll/vj30;->j(Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
