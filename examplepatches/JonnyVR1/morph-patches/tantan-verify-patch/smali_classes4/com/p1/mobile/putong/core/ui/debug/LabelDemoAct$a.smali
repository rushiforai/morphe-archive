.class public Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$a;->a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$a;->a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;->f:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 4
    .line 5
    const-string p1, "\u5168\u65b0\u6807\u7b7e"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
