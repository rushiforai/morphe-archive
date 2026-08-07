.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;Ll/bqq;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;->c:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;->a:Ll/bqq;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;->a:Ll/bqq;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$d$b;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
