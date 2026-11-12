.class public final Lcom/opera/android/oauth2/LoginResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/opera/android/oauth2/LoginResult;->a:I

    iput-object p2, p0, Lcom/opera/android/oauth2/LoginResult;->b:Ljava/lang/String;

    return-void
.end method

.method public static forError(I)Lcom/opera/android/oauth2/LoginResult;
    .registers 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/oauth2/LoginResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/opera/android/oauth2/LoginResult;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public static forUser(Ljava/lang/String;)Lcom/opera/android/oauth2/LoginResult;
    .registers 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/oauth2/LoginResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/opera/android/oauth2/LoginResult;-><init>(ILjava/lang/String;)V

    return-object v0
.end method
