.class public final synthetic Ll/rbb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/sbb;


# direct methods
.method public synthetic constructor <init>(Ll/sbb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rbb;->a:Ll/sbb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rbb;->a:Ll/sbb;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlTopPickUserIdEnvelope;

    invoke-static {p0, p1}, Ll/sbb;->g3(Ll/sbb;Lcom/p1/mobile/putong/core/data/IntlTopPickUserIdEnvelope;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
