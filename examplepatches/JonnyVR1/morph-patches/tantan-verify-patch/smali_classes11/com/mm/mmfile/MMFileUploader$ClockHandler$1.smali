.class Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mm/mmfile/MMFileUploader$ClockHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mm/mmfile/MMFileUploader$ClockHandler;

.field final synthetic val$timeConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/MMFileUploader$ClockHandler;Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;->this$1:Lcom/mm/mmfile/MMFileUploader$ClockHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;->val$timeConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$ClockHandler$1;->val$timeConfig:Lcom/mm/mmfile/MMFileUploader$TimeConfig;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/mm/mmfile/MMFileUploader;->access$300(Lcom/mm/mmfile/MMFileUploader$TimeConfig;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
