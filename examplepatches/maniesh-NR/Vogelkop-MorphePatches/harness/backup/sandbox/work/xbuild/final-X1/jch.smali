.class public final Ljch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ljch;->a:I

    iput p2, p0, Ljch;->b:I

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1e

    sget-object p1, Lcom/opera/android/PushedContentHandler;->p:Lcom/opera/android/PushedContentHandler;

    iget-object v0, p1, Lcom/opera/android/PushedContentHandler;->g:Lumi;

    new-instance v1, Lpy4;

    const/4 v2, 0x1

    iget v3, p0, Ljch;->a:I

    iget p0, p0, Ljch;->b:I

    invoke-direct {v1, p1, v3, p0, v2}, Lpy4;-><init>(Ljava/lang/Object;IIB)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_1e
    return-void
.end method
