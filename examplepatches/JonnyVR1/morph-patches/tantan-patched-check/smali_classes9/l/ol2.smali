.class public final synthetic Ll/ol2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# instance fields
.field public final synthetic a:Ll/xl2;


# direct methods
.method public synthetic constructor <init>(Ll/xl2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ol2;->a:Ll/xl2;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ol2;->a:Ll/xl2;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-virtual {p0, p1, p2, p3}, Ll/xl2;->U3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
