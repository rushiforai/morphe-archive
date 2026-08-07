.class public final synthetic Ll/lv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lv8;->a:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lv8;->a:Ll/qcj;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrx/c;

    return-object p0
.end method
