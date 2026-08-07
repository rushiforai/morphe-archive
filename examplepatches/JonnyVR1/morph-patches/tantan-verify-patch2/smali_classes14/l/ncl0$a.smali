.class public Ll/ncl0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ncl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:Landroid/view/SurfaceView;

.field public c:Z


# direct methods
.method public constructor <init>(JLandroid/view/SurfaceView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ncl0$a;->c:Z

    .line 6
    .line 7
    iput-wide p1, p0, Ll/ncl0$a;->a:J

    .line 8
    .line 9
    iput-object p3, p0, Ll/ncl0$a;->b:Landroid/view/SurfaceView;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ncl0$a;->c:Z

    .line 2
    .line 3
    return-void
.end method
