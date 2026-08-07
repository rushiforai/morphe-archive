.class public final synthetic Ll/u5f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b6f0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/b6f0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u5f0;->a:Ll/b6f0;

    iput-boolean p2, p0, Ll/u5f0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u5f0;->a:Ll/b6f0;

    iget-boolean p0, p0, Ll/u5f0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    invoke-static {v0, p0, p1}, Ll/b6f0;->O3(Ll/b6f0;ZLcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    return-void
.end method
