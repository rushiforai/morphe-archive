.class public Lcom/p1/mobile/putong/live/LiveServiceImpl$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/LiveServiceImpl;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Lcom/p1/mobile/putong/live/LiveServiceImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$b;->b:Lcom/p1/mobile/putong/live/LiveServiceImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
