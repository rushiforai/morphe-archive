.class public final synthetic Ll/i2q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v3q0;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2q0;->a:Ll/v3q0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2q0;->a:Ll/v3q0;

    check-cast p1, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;

    invoke-static {p0, p1}, Ll/v3q0;->W0(Ll/v3q0;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
