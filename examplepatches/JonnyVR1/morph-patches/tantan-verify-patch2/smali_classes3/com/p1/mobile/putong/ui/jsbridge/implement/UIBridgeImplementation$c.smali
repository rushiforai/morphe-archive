.class public Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->t(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Ljava/lang/String;Ll/bqq;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->d:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->b:Ll/bqq;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->c:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->b:Ll/bqq;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/bqq;->d()Ll/hqq;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p1, v0}, Ll/hqq;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->c:Z

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$c;->b:Ll/bqq;

    .line 25
    .line 26
    invoke-interface {p0}, Ll/bqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
