.class public final synthetic Ll/v8m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v8m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    iput-object p2, p0, Ll/v8m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v8m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    iget-object p0, p0, Ll/v8m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->f(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Landroid/view/View;)V

    return-void
.end method
