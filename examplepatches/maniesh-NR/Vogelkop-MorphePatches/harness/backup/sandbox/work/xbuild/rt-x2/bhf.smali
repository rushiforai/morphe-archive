.class public final Lbhf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/oauth2/OperaAccessTokenProvider;


# direct methods
.method public constructor <init>(Lcom/opera/android/oauth2/OperaAccessTokenProvider;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbhf;->a:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lbhf;->a:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    iget-boolean v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->e:Z

    if-eqz v0, :cond_d

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->e:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    :cond_d
    return-void
.end method
