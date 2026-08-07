.class public final synthetic Ll/fl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ll0;


# direct methods
.method public synthetic constructor <init>(Ll/ll0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl0;->a:Ll/ll0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fl0;->a:Ll/ll0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    invoke-static {p0, p1}, Ll/ll0;->S3(Ll/ll0;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
