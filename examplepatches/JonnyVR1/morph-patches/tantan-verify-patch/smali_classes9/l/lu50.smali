.class public final synthetic Ll/lu50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lu50;->a:Ll/z20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lu50;->a:Ll/z20;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2PeiLiaoView;->i(Ll/z20;Landroid/view/View;)V

    return-void
.end method
