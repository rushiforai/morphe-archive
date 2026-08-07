.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiteratureMessageLayout;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/pql;


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public f:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ki4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiteratureMessageLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getBaseInfoLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiteratureMessageLayout;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiteratureMessageLayout;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiteratureMessageLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
