.class public final synthetic Ll/ijt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/vit;


# direct methods
.method public synthetic constructor <init>(Ll/vit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ijt;->a:Ll/vit;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijt;->a:Ll/vit;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->P(Ll/vit;Landroid/view/View;)V

    return-void
.end method
