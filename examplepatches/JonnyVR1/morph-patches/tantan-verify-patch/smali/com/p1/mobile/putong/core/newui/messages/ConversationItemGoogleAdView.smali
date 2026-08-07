.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(ZLcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "e_messages_match_list_ad"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "e_messages_message_list_ad"

    .line 7
    .line 8
    :goto_0
    const-string p2, "p_messages_view"

    .line 9
    .line 10
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/admob/GoogleAdAct;->a2(Lcom/p1/mobile/putong/app/PutongAct;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t96;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/app/PutongAct;Z)V
    .locals 2

    return-void

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string v0, "e_messages_match_list_ad"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "e_messages_message_list_ad"

    .line 7
    .line 8
    :goto_0
    const-string v1, "p_messages_view"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/s96;

    .line 14
    .line 15
    invoke-direct {v0, p2, p1}, Ll/s96;-><init>(ZLcom/p1/mobile/putong/app/PutongAct;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->e:Landroid/widget/TextView;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->c:Lv/VText;

    .line 28
    .line 29
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->d:Lv/VText;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->a:Lv/VImage;

    .line 39
    .line 40
    sget p1, Ll/dbc0;->y9:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemGoogleAdView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
