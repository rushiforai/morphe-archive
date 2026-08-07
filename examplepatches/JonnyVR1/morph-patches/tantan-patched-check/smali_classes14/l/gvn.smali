.class public final synthetic Ll/gvn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mvn;


# direct methods
.method public synthetic constructor <init>(Ll/mvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gvn;->a:Ll/mvn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvn;->a:Ll/mvn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    invoke-static {p0, p1}, Ll/mvn;->d(Ll/mvn;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;)V

    return-void
.end method
