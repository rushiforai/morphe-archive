.class public final synthetic Ll/ege;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/BannerLoc;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/BannerLoc;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ege;->a:Lcom/p1/mobile/putong/data/BannerLoc;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ege;->a:Lcom/p1/mobile/putong/data/BannerLoc;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/mge;->d(Lcom/p1/mobile/putong/data/BannerLoc;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method
