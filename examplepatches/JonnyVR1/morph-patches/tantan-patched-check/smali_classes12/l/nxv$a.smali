.class Ll/nxv$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nxv;->c()Ll/nxv$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/location/LocationManager;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/nxv;


# direct methods
.method public constructor <init>(Ll/nxv;Landroid/location/LocationManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxv$a;->c:Ll/nxv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nxv$a;->a:Landroid/location/LocationManager;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nxv$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nxv$a;->a:Landroid/location/LocationManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxv$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v5, Ll/nxv$a$a;

    .line 6
    .line 7
    invoke-direct {v5, p0}, Ll/nxv$a$a;-><init>(Ll/nxv$a;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    const/high16 v4, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
