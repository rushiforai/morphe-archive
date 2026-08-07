.class public final synthetic Ll/ge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/api/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/api/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ge;->a:Lcom/p1/mobile/putong/account/api/a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ge;->a:Lcom/p1/mobile/putong/account/api/a;

    invoke-static {p0}, Lcom/p1/mobile/putong/account/api/a;->P(Lcom/p1/mobile/putong/account/api/a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
