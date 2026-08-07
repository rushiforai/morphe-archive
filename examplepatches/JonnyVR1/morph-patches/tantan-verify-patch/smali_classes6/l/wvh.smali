.class public final synthetic Ll/wvh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/share/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wvh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wvh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->w(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    return-void
.end method
