.class public final synthetic Ll/zcd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j9d0;

.field public final synthetic b:Ll/ycd0;


# direct methods
.method public synthetic constructor <init>(Ll/j9d0;Ll/ycd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zcd0;->a:Ll/j9d0;

    iput-object p2, p0, Ll/zcd0;->b:Ll/ycd0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zcd0;->a:Ll/j9d0;

    iget-object p0, p0, Ll/zcd0;->b:Ll/ycd0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->h0(Ll/j9d0;Ll/ycd0;Landroid/view/View;)V

    return-void
.end method
