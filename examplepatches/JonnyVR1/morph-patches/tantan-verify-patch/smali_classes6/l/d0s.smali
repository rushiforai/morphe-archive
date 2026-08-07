.class public final synthetic Ll/d0s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d0s;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/d0s;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/d0s;->c:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d0s;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/d0s;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/d0s;->c:Ll/aqq;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/LiveBridgeImpl;->v(Ljava/lang/String;Ljava/lang/String;Ll/aqq;)V

    return-void
.end method
