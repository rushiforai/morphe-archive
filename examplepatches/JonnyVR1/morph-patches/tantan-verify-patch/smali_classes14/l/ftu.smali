.class public final synthetic Ll/ftu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/stu;


# direct methods
.method public synthetic constructor <init>(Ll/stu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ftu;->a:Ll/stu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftu;->a:Ll/stu;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    invoke-static {p0, p1}, Ll/stu;->R2(Ll/stu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
