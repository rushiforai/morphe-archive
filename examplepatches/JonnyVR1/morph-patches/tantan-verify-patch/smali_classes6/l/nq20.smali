.class public final synthetic Ll/nq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/nq20;->a:I

    iput-object p2, p0, Ll/nq20;->b:Lcom/p1/mobile/putong/app/PutongAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/nq20;->a:I

    iget-object p0, p0, Ll/nq20;->b:Lcom/p1/mobile/putong/app/PutongAct;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->a(ILcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V

    return-void
.end method
