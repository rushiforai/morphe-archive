.class Lcom/cosmos/mdlog/MDLog$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/mdlog/MDLog$1;->logF(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/mdlog/MDLog$1;

.field final synthetic val$log:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/cosmos/mdlog/MDLog$1;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/mdlog/MDLog$1$1;->this$0:Lcom/cosmos/mdlog/MDLog$1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/mdlog/MDLog$1$1;->val$log:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    sget-object v0, Lcom/cosmos/mdlog/MDLog;->toastSupportContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/cosmos/mdlog/MDLog$1$1;->val$log:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
