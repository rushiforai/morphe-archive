.class public final synthetic Ll/uds;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uds;->a:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uds;->a:Landroid/view/View$OnClickListener;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->h0(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
