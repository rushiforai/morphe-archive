.class public Lcom/p1/mobile/putong/location/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/location/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/location/Location;

.field public final b:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/location/Location;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/location/a$a;->a:Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    float-to-double v1, p1

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 15
    .line 16
    .line 17
    float-to-double p1, p2

    .line 18
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 19
    .line 20
    .line 21
    iput p3, p0, Lcom/p1/mobile/putong/location/a$a;->b:F

    .line 22
    .line 23
    return-void
.end method
