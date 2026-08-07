.class public final synthetic Ll/kd40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kd40;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kd40;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->C(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
