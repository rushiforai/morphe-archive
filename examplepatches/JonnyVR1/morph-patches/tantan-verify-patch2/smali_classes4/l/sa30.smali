.class public final synthetic Ll/sa30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sa30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sa30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->o5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
