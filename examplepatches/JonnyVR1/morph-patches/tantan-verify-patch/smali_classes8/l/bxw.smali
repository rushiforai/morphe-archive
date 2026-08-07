.class public final synthetic Ll/bxw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Ll/bf3;

.field public final synthetic c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxw;->a:Ll/z20;

    iput-object p2, p0, Ll/bxw;->b:Ll/bf3;

    iput-object p3, p0, Ll/bxw;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bxw;->a:Ll/z20;

    iget-object v1, p0, Ll/bxw;->b:Ll/bf3;

    iget-object p0, p0, Ll/bxw;->c:Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->P(Ll/z20;Ll/bf3;Lcom/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo;Landroid/view/View;)V

    return-void
.end method
