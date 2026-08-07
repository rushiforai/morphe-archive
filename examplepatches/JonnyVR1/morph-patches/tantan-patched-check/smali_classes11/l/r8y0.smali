.class public final Ll/r8y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wmu0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;Ll/wmu0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/r8y0;->a:Ll/wmu0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/r8y0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/r8y0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/r8y0;->d:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r8y0;->d:Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->a:Ll/atx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/atx0;->E()Ll/hcy0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/r8y0;->a:Ll/wmu0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/r8y0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/r8y0;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, p0}, Ll/hcy0;->H(Ll/wmu0;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
