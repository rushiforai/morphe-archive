.class public final synthetic Ll/dsp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sh3;


# direct methods
.method public synthetic constructor <init>(Ll/sh3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dsp;->a:Ll/sh3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dsp;->a:Ll/sh3;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->j0(Ll/sh3;Landroid/view/View;)V

    return-void
.end method
