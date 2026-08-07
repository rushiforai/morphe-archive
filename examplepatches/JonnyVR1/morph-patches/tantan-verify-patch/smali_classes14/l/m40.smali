.class public final synthetic Ll/m40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q40;


# direct methods
.method public synthetic constructor <init>(Ll/q40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m40;->a:Ll/q40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m40;->a:Ll/q40;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    invoke-static {p0, p1}, Ll/q40;->T2(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
