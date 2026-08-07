.class public final synthetic Ll/lq1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rq1;


# direct methods
.method public synthetic constructor <init>(Ll/rq1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lq1;->a:Ll/rq1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq1;->a:Ll/rq1;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-virtual {p0, p1}, Ll/rq1;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method
