.class public final synthetic Ll/n2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r2s;


# direct methods
.method public synthetic constructor <init>(Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n2s;->a:Ll/r2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2s;->a:Ll/r2s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {p0, p1}, Ll/r2s;->p4(Ll/r2s;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
