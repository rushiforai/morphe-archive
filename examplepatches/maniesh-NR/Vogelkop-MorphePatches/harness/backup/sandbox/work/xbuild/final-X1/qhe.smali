.class public final Lqhe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Ltqo;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ltqo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqhe;->a:Landroid/net/Uri;

    iput-object p2, p0, Lqhe;->b:Ltqo;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    :cond_10
    return-void
.end method
