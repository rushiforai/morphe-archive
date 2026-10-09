.class public final Le/e/a/ModernPopupStart;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final service:Lcom/sauzask/nicoid/NicoidPopupViewService;

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidPopupViewService;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernPopupStart;->service:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iput-object p2, p0, Le/e/a/ModernPopupStart;->url:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const-string v0, "Direct popup: setting HLS URL"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-popup"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le/e/a/ModernPopupStart;->service:Lcom/sauzask/nicoid/NicoidPopupViewService;

    iget-object v1, p0, Le/e/a/ModernPopupStart;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Ljava/lang/String;)V

    return-void
.end method
