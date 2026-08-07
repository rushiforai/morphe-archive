.class public final synthetic Ll/vju;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yju;


# direct methods
.method public synthetic constructor <init>(Ll/yju;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vju;->a:Ll/yju;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vju;->a:Ll/yju;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    invoke-static {p0, p1}, Ll/yju;->Y2(Ll/yju;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V

    return-void
.end method
