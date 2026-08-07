.class public final synthetic Ll/ly4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ly4;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    iput-object p2, p0, Ll/ly4;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ly4;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    iget-object v1, p0, Ll/ly4;->b:Ljava/util/List;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->u(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
