.class public final synthetic Ll/l9o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;Lcom/p1/mobile/putong/live/base/data/BLiveMember;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l9o0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    iput-object p2, p0, Ll/l9o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l9o0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    iget-object p0, p0, Ll/l9o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->h0(Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Landroid/view/View;)V

    return-void
.end method
