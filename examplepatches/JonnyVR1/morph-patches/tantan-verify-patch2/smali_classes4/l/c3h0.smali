.class public final synthetic Ll/c3h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CardOption;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c3h0;->a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    iput-object p2, p0, Ll/c3h0;->b:Lcom/p1/mobile/putong/core/data/CardOption;

    iput-object p3, p0, Ll/c3h0;->c:Ll/x20;

    iput-object p4, p0, Ll/c3h0;->d:Ll/x20;

    iput-object p5, p0, Ll/c3h0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/c3h0;->a:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    iget-object v1, p0, Ll/c3h0;->b:Lcom/p1/mobile/putong/core/data/CardOption;

    iget-object v2, p0, Ll/c3h0;->c:Ll/x20;

    iget-object v3, p0, Ll/c3h0;->d:Ll/x20;

    iget-object v4, p0, Ll/c3h0;->e:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->d(Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;Lcom/p1/mobile/putong/core/data/CardOption;Ll/x20;Ll/x20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
