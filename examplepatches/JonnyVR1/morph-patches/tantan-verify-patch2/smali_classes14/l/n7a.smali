.class public final synthetic Ll/n7a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/o7a;


# direct methods
.method public synthetic constructor <init>(Ll/o7a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7a;->a:Ll/o7a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n7a;->a:Ll/o7a;

    check-cast p1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;

    invoke-static {p0, p1}, Ll/o7a;->c3(Ll/o7a;Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
