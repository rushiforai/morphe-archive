.class public final synthetic Ll/a98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Double;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a98;->a:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a98;->a:Ljava/lang/Double;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->M4(Ljava/lang/Double;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method
