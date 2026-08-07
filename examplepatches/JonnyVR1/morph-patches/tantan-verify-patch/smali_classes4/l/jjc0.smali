.class public final synthetic Ll/jjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;

.field public final synthetic b:Landroid/view/Surface;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;Landroid/view/Surface;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jjc0;->a:Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;

    iput-object p2, p0, Ll/jjc0;->b:Landroid/view/Surface;

    iput-wide p3, p0, Ll/jjc0;->c:J

    iput-object p5, p0, Ll/jjc0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jjc0;->a:Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;

    iget-object v1, p0, Ll/jjc0;->b:Landroid/view/Surface;

    iget-wide v2, p0, Ll/jjc0;->c:J

    iget-object p0, p0, Ll/jjc0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;->a(Lcom/ss/bytertc/base/media/RTCSurfaceViewListener;Landroid/view/Surface;JLjava/lang/String;)V

    return-void
.end method
