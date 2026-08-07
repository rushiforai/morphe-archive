.class public final synthetic Ll/b29;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b29;->a:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b29;->a:Ll/gcg0;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/k;->m3(Ll/gcg0;Lrx/Notification;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
