.class public final synthetic Ll/l0q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q0q;


# direct methods
.method public synthetic constructor <init>(Ll/q0q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l0q;->a:Ll/q0q;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l0q;->a:Ll/q0q;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {p0, p1}, Ll/q0q;->w4(Ll/q0q;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
