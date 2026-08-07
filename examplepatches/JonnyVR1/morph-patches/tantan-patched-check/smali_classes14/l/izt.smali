.class public final synthetic Ll/izt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/dbd0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/dbd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/izt;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/izt;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/izt;->c:Ll/dbd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/izt;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/izt;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/izt;->c:Ll/dbd0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->o(Ljava/lang/String;Ljava/lang/String;Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;)V

    return-void
.end method
