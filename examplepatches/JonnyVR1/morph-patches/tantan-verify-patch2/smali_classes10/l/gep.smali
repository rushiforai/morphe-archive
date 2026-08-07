.class public final synthetic Ll/gep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mkj;


# direct methods
.method public synthetic constructor <init>(Ll/mkj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gep;->a:Ll/mkj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gep;->a:Ll/mkj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    invoke-static {p0, p1}, Ll/tep;->e4(Ll/mkj;Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;)Ll/mkj;

    move-result-object p0

    return-object p0
.end method
