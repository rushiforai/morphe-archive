.class public final synthetic Ll/iq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq20;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
