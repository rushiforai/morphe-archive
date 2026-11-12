.class public final Liw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnue;


# instance fields
.field public a:Lmue;

.field public final synthetic b:Ltw3;


# direct methods
.method public constructor <init>(Ltw3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liw3;->b:Ltw3;

    return-void
.end method


# virtual methods
.method public final getVisibility()Lize;
    .registers 3

    iget-object v0, p0, Liw3;->a:Lmue;

    if-eqz v0, :cond_7

    iget-object p0, v0, Lmue;->h:Lkze;

    return-object p0

    :cond_7
    iget-object v0, p0, Liw3;->b:Ltw3;

    iget-object v1, v0, Ltw3;->D:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmue;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    iput-object v1, p0, Liw3;->a:Lmue;

    iget-object p0, v1, Lmue;->h:Lkze;

    return-object p0
.end method
