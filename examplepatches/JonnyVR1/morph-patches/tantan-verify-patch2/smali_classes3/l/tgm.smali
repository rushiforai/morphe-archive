.class public final synthetic Ll/tgm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tgm;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iput-boolean p2, p0, Ll/tgm;->b:Z

    iput-object p3, p0, Ll/tgm;->c:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tgm;->a:Lcom/p1/mobile/putong/app/PutongAct;

    iget-boolean v1, p0, Ll/tgm;->b:Z

    iget-object p0, p0, Ll/tgm;->c:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/ui/jsbridge/implement/ImageBridgeImplementation;->j(Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
