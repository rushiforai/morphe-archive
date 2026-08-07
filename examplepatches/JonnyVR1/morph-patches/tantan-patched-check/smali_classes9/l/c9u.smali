.class public final synthetic Ll/c9u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->S3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
