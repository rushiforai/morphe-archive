.class public final synthetic Ll/fj20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/Network;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/Network;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fj20;->a:Lcom/p1/mobile/putong/api/api/Network;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fj20;->a:Lcom/p1/mobile/putong/api/api/Network;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->e(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/String;)V

    return-void
.end method
