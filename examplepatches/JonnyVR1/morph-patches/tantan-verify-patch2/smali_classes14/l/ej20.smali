.class public final synthetic Ll/ej20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/Network;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/Network;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ej20;->a:Lcom/p1/mobile/putong/api/api/Network;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ej20;->a:Lcom/p1/mobile/putong/api/api/Network;

    check-cast p1, Lcom/p1/mobile/android/app/Act$r;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->i(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/android/app/Act$r;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
