.class public final synthetic Ll/hyl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iyl0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;


# direct methods
.method public synthetic constructor <init>(Ll/iyl0;Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hyl0;->a:Ll/iyl0;

    iput-object p2, p0, Ll/hyl0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hyl0;->a:Ll/iyl0;

    iget-object p0, p0, Ll/hyl0;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;

    invoke-static {v0, p0, p1}, Ll/iyl0;->F(Ll/iyl0;Lcom/p1/mobile/putong/live/livingroom/virtual/endSuggest/SuggestedStopped;Landroid/view/View;)V

    return-void
.end method
