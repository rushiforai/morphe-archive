.class public final synthetic Ll/d3h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d3h0;->a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    iput-object p2, p0, Ll/d3h0;->b:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    iput-object p3, p0, Ll/d3h0;->c:Ll/x20;

    iput-object p4, p0, Ll/d3h0;->d:Ll/x20;

    iput-object p5, p0, Ll/d3h0;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d3h0;->a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    iget-object v1, p0, Ll/d3h0;->b:Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;

    iget-object v2, p0, Ll/d3h0;->c:Ll/x20;

    iget-object v3, p0, Ll/d3h0;->d:Ll/x20;

    iget-object v4, p0, Ll/d3h0;->e:Ll/x20;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->b(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardPatternOptionIcon;Ll/x20;Ll/x20;Ll/x20;Landroid/view/View;)V

    return-void
.end method
