.class public final Ltd2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;


# direct methods
.method public synthetic constructor <init>(Lumi;)V
    .registers 2

    iput-object p1, p0, Ltd2;->a:Lumi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/app/NotificationManager;Lfd2;)V
    .registers 7

    new-instance v0, Lva2;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Lva2;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lab;

    const/16 v3, 0x13

    invoke-direct {v2, p2, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Ltd2;->a:Lumi;

    invoke-virtual {p0, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p2

    new-instance v0, Llw0;

    invoke-direct {v0, v2, v1}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p0, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p2, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {p2, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
