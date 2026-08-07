.class public final synthetic Ll/sn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/no7;


# direct methods
.method public synthetic constructor <init>(Ll/no7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sn7;->a:Ll/no7;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sn7;->a:Ll/no7;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/no7;->m3(Ll/no7;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CityCData;

    move-result-object p0

    return-object p0
.end method
