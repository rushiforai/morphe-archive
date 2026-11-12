.class public final Ldi2;
.super Ls43;
.source "SourceFile"


# instance fields
.field public final d:Lpi;


# direct methods
.method public constructor <init>(Lumi;Lpi;)V
    .registers 3

    invoke-direct {p0, p1}, Ls43;-><init>(Lumi;)V

    iput-object p2, p0, Ldi2;->d:Lpi;

    return-void
.end method

.method public static c(Lcom/opera/android/oauth2/OperaAccessToken;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bearer "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final b()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Ldi2;->d:Lpi;

    invoke-virtual {p0}, Lpi;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0
.end method
