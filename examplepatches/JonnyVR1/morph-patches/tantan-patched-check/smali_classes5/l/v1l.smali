.class public final synthetic Ll/v1l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x1l;


# direct methods
.method public synthetic constructor <init>(Ll/x1l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1l;->a:Ll/x1l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1l;->a:Ll/x1l;

    check-cast p1, Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageEnvelope;

    invoke-static {p0, p1}, Ll/x1l;->f0(Ll/x1l;Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageEnvelope;)V

    return-void
.end method
