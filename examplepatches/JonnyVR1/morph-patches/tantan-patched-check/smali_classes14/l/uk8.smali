.class public final synthetic Ll/uk8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qcj;

.field public final synthetic b:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/qcj;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uk8;->a:Ll/qcj;

    iput-object p2, p0, Ll/uk8;->b:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk8;->a:Ll/qcj;

    iget-object p0, p0, Ll/uk8;->b:Ll/qcj;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0, p1}, Ll/il8;->l(Ll/qcj;Ll/qcj;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
