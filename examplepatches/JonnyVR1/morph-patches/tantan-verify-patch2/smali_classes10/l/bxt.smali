.class public final synthetic Ll/bxt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxt;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bxt;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->i(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Landroid/view/View;)V

    return-void
.end method
