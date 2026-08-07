.class public final synthetic Ll/t7e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x7e;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/x7e;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7e;->a:Ll/x7e;

    iput-boolean p2, p0, Ll/t7e;->b:Z

    iput-object p3, p0, Ll/t7e;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t7e;->a:Ll/x7e;

    iget-boolean v1, p0, Ll/t7e;->b:Z

    iget-object p0, p0, Ll/t7e;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    invoke-static {v0, v1, p0, p1}, Ll/x7e;->S3(Ll/x7e;ZLjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V

    return-void
.end method
