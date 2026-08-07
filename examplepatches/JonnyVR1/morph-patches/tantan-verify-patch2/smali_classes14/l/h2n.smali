.class public final synthetic Ll/h2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/j2n;


# direct methods
.method public synthetic constructor <init>(Ll/j2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h2n;->a:Ll/j2n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h2n;->a:Ll/j2n;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    invoke-static {p0, p1}, Ll/j2n;->R2(Ll/j2n;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
