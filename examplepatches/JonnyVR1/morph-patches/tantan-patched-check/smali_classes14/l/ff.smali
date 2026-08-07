.class public final synthetic Ll/ff;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ff;->a:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ff;->a:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->u0(Lcom/p1/mobile/putong/data/SignUpData;Lrx/Notification;)Lcom/p1/mobile/putong/data/SignUpData;

    move-result-object p0

    return-object p0
.end method
