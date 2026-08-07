.class public final synthetic Ll/vva;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/x;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/x;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vva;->a:Lcom/p1/mobile/putong/core/api/x;

    iput-object p2, p0, Ll/vva;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vva;->a:Lcom/p1/mobile/putong/core/api/x;

    iget-object p0, p0, Ll/vva;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/x;->f3(Lcom/p1/mobile/putong/core/api/x;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
