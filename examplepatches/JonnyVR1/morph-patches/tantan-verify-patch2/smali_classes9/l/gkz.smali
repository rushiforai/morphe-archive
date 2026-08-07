.class public final synthetic Ll/gkz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gkz;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gkz;->a:Ll/clz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Ll/clz;->d1(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
