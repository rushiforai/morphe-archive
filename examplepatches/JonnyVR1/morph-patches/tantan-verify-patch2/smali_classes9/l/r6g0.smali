.class public final synthetic Ll/r6g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q6g0;


# direct methods
.method public synthetic constructor <init>(Ll/q6g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r6g0;->a:Ll/q6g0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r6g0;->a:Ll/q6g0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->a(Ll/q6g0;Landroid/view/View;)V

    return-void
.end method
