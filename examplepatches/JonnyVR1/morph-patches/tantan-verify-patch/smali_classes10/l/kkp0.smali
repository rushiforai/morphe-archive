.class public final synthetic Ll/kkp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/mkp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mkp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kkp0;->a:Ll/mkp0;

    iput-object p2, p0, Ll/kkp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;

    iput-object p3, p0, Ll/kkp0;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    iput-object p4, p0, Ll/kkp0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kkp0;->a:Ll/mkp0;

    iget-object v1, p0, Ll/kkp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;

    iget-object v2, p0, Ll/kkp0;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    iget-object p0, p0, Ll/kkp0;->d:Ljava/lang/String;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->i0(Ll/mkp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;Ljava/lang/String;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
