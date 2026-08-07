.class public final synthetic Ll/kzr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yzr;


# direct methods
.method public synthetic constructor <init>(Ll/yzr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kzr;->a:Ll/yzr;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kzr;->a:Ll/yzr;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/blacklist/LiveBlackListItemView;->h0(Ll/yzr;Landroid/view/View;)V

    return-void
.end method
