.class public final synthetic Ll/f27;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/m27;


# direct methods
.method public synthetic constructor <init>(Ll/m27;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f27;->a:Ll/m27;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f27;->a:Ll/m27;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/m27;->b3(Ll/m27;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
