.class public final Lrq3;
.super Lmq3;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ltq3;


# direct methods
.method public constructor <init>(Ltq3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrq3;->a:Ltq3;

    return-void
.end method


# virtual methods
.method public final c(ILandroid/view/View;)V
    .registers 3

    const/4 p2, 0x5

    if-ne p1, p2, :cond_8

    iget-object p0, p0, Lrq3;->a:Ltq3;

    invoke-virtual {p0}, Ltq3;->cancel()V

    :cond_8
    return-void
.end method
