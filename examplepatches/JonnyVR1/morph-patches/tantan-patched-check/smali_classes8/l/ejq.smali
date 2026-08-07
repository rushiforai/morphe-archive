.class public final synthetic Ll/ejq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bkj0;


# direct methods
.method public synthetic constructor <init>(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejq;->a:Ll/bkj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ejq;->a:Ll/bkj0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->e(Ll/bkj0;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
