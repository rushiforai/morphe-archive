.class public final Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;


# instance fields
.field public final a:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a:Landroid/util/SparseArray;

    return-void
.end method

.method public static initialize()V
    .registers 1

    sget-object v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    invoke-direct {v0}, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;-><init>()V

    sput-object v0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->b:Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;

    return-void
.end method


# virtual methods
.method public final a(Ljkd;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/media/OperaMediaRouterClient;->a:Landroid/util/SparseArray;

    iget v0, p1, Ljkd;->e:I

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_f

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_f
    invoke-static {p1}, Lf03;->h0(Ljkd;)V

    return-void
.end method
