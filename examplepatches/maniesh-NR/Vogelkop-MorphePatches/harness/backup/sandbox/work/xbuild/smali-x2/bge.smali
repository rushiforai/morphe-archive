.class public final Lbge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Livj;


# instance fields
.field public a:J

.field public final synthetic b:Lfge;


# direct methods
.method public constructor <init>(Lfge;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbge;->b:Lfge;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lbge;->b:Lfge;

    iget-object v1, v0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v1, :cond_13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lbge;->a:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1f4

    cmp-long p0, v1, v3

    if-gez p0, :cond_14

    :cond_13
    return-void

    :cond_14
    iget-object p0, v0, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public final b()V
    .registers 1

    iget-object p0, p0, Lbge;->b:Lfge;

    iget-object p0, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method
