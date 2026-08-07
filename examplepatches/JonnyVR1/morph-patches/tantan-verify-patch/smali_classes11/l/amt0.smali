.class public final Ll/amt0;
.super Ll/boy0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/sni0;


# direct methods
.method public constructor <init>(Ll/f5u0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/amt0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/boy0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final K4(Lcom/google/android/gms/common/api/Status;Landroid/location/Location;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/amt0;->a:Ll/sni0;

    .line 2
    .line 3
    invoke-static {p1, p2, p0}, Lcom/google/android/gms/common/api/internal/TaskUtil;->setResultOrApiException(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ll/sni0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
