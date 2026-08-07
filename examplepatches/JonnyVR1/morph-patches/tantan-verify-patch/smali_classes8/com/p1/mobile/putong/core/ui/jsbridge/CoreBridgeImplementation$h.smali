.class public Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final a:Ll/bqq;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->b:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->a:Ll/bqq;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Ll/k87;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;-><init>(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;)V

    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p2, v0, :cond_2

    .line 3
    .line 4
    const/16 p2, 0x3f9

    .line 5
    .line 6
    if-ne p1, p2, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->b:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->a:Ll/bqq;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->O1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->S1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Landroid/content/Intent;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->b:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 21
    .line 22
    const/16 v0, 0x3f7

    .line 23
    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->a:Ll/bqq;

    .line 27
    .line 28
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->O1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {p2, v0, p3, v1, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->R1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Landroid/content/Intent;Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->a:Ll/bqq;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->O1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p2, v0, p3, v1, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->Q1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;Landroid/content/Intent;Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->b:Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation$h;->a:Ll/bqq;

    .line 48
    .line 49
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->T1(Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;Ll/bqq;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return p0
.end method
