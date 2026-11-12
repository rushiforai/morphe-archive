.class public final Lntn;
.super Liz4;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Ljava/util/function/Supplier;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Ljava/util/function/Supplier;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lntn;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lntn;->b:Ljava/util/function/Supplier;

    return-void
.end method


# virtual methods
.method public final A(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 6

    iget-object p0, p0, Lntn;->b:Ljava/util/function/Supplier;

    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iput p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->v:I

    iget-wide v0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_17

    return-void

    :cond_17
    iget-boolean p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->w:Z

    if-eqz p1, :cond_1d

    const/high16 p0, -0x1000000

    :cond_1d
    invoke-static {v0, v1, p0}, LJ/N;->MGUpE$PE(JI)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Lntn;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->v:I

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_13

    return-void

    :cond_13
    iget-boolean p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->w:Z

    if-eqz p0, :cond_19

    const/high16 p1, -0x1000000

    :cond_19
    invoke-static {v0, v1, p1}, LJ/N;->MGUpE$PE(JI)V

    return-void
.end method

.method public final r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 5

    const/4 p0, 0x1

    iput-boolean p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->w:Z

    iget-wide p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v0, 0x0

    cmp-long p2, p0, v0

    if-nez p2, :cond_c

    return-void

    :cond_c
    const/high16 p2, -0x1000000

    invoke-static {p0, p1, p2}, LJ/N;->MGUpE$PE(JI)V

    return-void
.end method

.method public final s(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 6

    const/4 p0, 0x0

    iput-boolean p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->w:Z

    iget-wide v0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_c

    return-void

    :cond_c
    iget p0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->v:I

    invoke-static {v0, v1, p0}, LJ/N;->MGUpE$PE(JI)V

    return-void
.end method
