.class public final synthetic Ll/sz6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sz6;->a:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    iput-object p2, p0, Ll/sz6;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sz6;->a:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    iget-object p0, p0, Ll/sz6;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->j3(Lcom/p1/mobile/putong/core/api/CoreAutoPay;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
