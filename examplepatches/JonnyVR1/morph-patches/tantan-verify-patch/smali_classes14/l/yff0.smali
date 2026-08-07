.class public final synthetic Ll/yff0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mgf0;


# direct methods
.method public synthetic constructor <init>(Ll/mgf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yff0;->a:Ll/mgf0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yff0;->a:Ll/mgf0;

    check-cast p1, Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;

    invoke-static {p0, p1}, Ll/mgf0;->c0(Ll/mgf0;Lcom/p1/mobile/putong/account/data/RegisterNameEnvelope;)V

    return-void
.end method
