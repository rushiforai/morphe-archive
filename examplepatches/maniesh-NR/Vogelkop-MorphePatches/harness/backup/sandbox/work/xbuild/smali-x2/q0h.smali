.class public final Lq0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lcom/opera/android/BrowserActivity;

.field public final d:Leej;

.field public final e:Lk6l;

.field public final f:Lqz;

.field public g:I


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Leej;Lk6l;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lqz;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lq0h;->f:Lqz;

    iput-object p1, p0, Lq0h;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lq0h;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lq0h;->c:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lq0h;->d:Leej;

    iput-object p5, p0, Lq0h;->e:Lk6l;

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p5, v0}, Lk6l;->b(La2l;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    iget-object p1, p0, Lq0h;->e:Lk6l;

    iget-object v0, p0, Lq0h;->f:Lqz;

    invoke-virtual {p1, v0}, Lk6l;->v(La2l;)V

    iget-object p1, p0, Lq0h;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method
