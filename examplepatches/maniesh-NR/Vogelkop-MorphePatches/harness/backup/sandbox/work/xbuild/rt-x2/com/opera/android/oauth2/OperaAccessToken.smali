.class public final Lcom/opera/android/oauth2/OperaAccessToken;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Date;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/opera/android/oauth2/OperaAccessToken;->b:Ljava/util/Date;

    return-void
.end method

.method public static create(Ljava/lang/String;J)Lcom/opera/android/oauth2/OperaAccessToken;
    .registers 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/oauth2/OperaAccessToken;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-direct {v0, p0, v1}, Lcom/opera/android/oauth2/OperaAccessToken;-><init>(Ljava/lang/String;Ljava/util/Date;)V

    return-object v0
.end method


# virtual methods
.method public final a()Z
    .registers 2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessToken;->b:Ljava/util/Date;

    invoke-virtual {p0, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p0

    return p0
.end method
