.class public final Lvu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Linh;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    iput-object p1, p0, Lvu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j()Lb2l;
    .registers 2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lvu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Lk6l;->A()Lb2l;

    move-result-object p0

    return-object p0
.end method
