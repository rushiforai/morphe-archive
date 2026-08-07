.class public final synthetic Ll/l09;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d19;


# direct methods
.method public synthetic constructor <init>(Ll/d19;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l09;->a:Ll/d19;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l09;->a:Ll/d19;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/d19;->s3(Ll/d19;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p0

    return-object p0
.end method
