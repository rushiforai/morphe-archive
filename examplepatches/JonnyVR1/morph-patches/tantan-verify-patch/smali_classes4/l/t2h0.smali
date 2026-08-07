.class public final synthetic Ll/t2h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/u2h0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CardPattern;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;


# direct methods
.method public synthetic constructor <init>(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2h0;->a:Ll/u2h0;

    iput-object p2, p0, Ll/t2h0;->b:Lcom/p1/mobile/putong/core/data/CardPattern;

    iput-object p3, p0, Ll/t2h0;->c:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t2h0;->a:Ll/u2h0;

    iget-object v1, p0, Ll/t2h0;->b:Lcom/p1/mobile/putong/core/data/CardPattern;

    iget-object p0, p0, Ll/t2h0;->c:Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    invoke-static {v0, v1, p0}, Ll/u2h0;->F(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    return-void
.end method
