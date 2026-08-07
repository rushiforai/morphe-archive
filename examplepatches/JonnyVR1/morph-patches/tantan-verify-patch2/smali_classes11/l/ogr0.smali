.class public final Ll/ogr0;
.super Lcom/google/android/gms/common/api/internal/IStatusCallback$Stub;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/gjr0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/ogr0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/IStatusCallback$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onResult(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogr0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ll/sni0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
