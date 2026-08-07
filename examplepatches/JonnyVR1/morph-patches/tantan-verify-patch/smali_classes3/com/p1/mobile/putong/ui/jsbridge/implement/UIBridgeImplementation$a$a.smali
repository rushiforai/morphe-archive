.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a$a;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a$a;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a$a;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;->a:Ll/bqq;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a$a;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$a;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p1, p0}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
