.class public final synthetic Ll/a1s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/a1s;->a:Z

    iput-object p2, p0, Ll/a1s;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/a1s;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/a1s;->a:Z

    iget-object v1, p0, Ll/a1s;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/a1s;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->l(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
