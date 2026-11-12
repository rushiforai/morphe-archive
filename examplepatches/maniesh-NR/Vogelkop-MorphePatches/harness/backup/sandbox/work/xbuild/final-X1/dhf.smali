.class public final Ldhf;
.super Lyi2;
.source "SourceFile"


# instance fields
.field public final synthetic g:Lab;


# direct methods
.method public constructor <init>(Lqie;Lcom/opera/android/oauth2/OperaAccessToken;Lab;)V
    .registers 4

    iput-object p3, p0, Ldhf;->g:Lab;

    const-string p1, "social-accounts"

    invoke-direct {p0, p2, p1}, Lyi2;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Ldhf;->g:Lab;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lab;->run(Ljava/lang/Object;)V

    return-void
.end method
