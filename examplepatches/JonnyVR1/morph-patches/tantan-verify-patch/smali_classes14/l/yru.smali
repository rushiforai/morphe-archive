.class public final synthetic Ll/yru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/isu;


# direct methods
.method public synthetic constructor <init>(Ll/isu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yru;->a:Ll/isu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yru;->a:Ll/isu;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    invoke-virtual {p0, p1, p2}, Ll/isu;->w(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
