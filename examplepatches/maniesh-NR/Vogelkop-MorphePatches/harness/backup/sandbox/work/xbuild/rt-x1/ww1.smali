.class public final Lww1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/attribution/AppsFlyerRequestListener;


# instance fields
.field public final synthetic a:Ll45;


# direct methods
.method public constructor <init>(Ll45;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lww1;->a:Ll45;

    return-void
.end method


# virtual methods
.method public final onError(ILjava/lang/String;)V
    .registers 3

    sget-object p2, Ltw1;->g:Ltw1;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lww1;->a:Ll45;

    invoke-virtual {p0, p2, p1}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    return-void
.end method

.method public final onSuccess()V
    .registers 1

    return-void
.end method
