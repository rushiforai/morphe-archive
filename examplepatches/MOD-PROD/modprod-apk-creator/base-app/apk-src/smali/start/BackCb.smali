.class public Lstart/BackCb;
.super Ljava/lang/Object;
.source "BackCb.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public a:Lstart/MainActivity;


# direct methods
.method public constructor <init>(Lstart/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lstart/BackCb;->a:Lstart/MainActivity;

    return-void
.end method


# virtual methods
.method public onReceiveValue(Ljava/lang/Object;)V
    .locals 1

    const-string v0, "\"exit\""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lstart/BackCb;->a:Lstart/MainActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method
