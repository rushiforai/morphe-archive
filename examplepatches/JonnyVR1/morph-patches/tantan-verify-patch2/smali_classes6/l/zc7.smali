.class public final synthetic Ll/zc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zc7;->a:Lcom/p1/mobile/putong/feed/api/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zc7;->a:Lcom/p1/mobile/putong/feed/api/a;

    check-cast p1, Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/api/a;->Q1(Lcom/p1/mobile/putong/feed/api/a;Lcom/p1/mobile/putong/data/DbLinks;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
