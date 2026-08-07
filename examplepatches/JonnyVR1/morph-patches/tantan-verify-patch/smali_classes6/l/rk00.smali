.class public final synthetic Ll/rk00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/n570;


# direct methods
.method public synthetic constructor <init>(Ll/n570;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rk00;->a:Ll/n570;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rk00;->a:Ll/n570;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {p0, p1}, Ll/n570;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
