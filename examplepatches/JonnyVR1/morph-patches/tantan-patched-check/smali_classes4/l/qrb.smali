.class public Ll/qrb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IILl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/qrb;->b:I

    .line 6
    .line 7
    iput p1, p0, Ll/qrb;->a:I

    .line 8
    .line 9
    iput p2, p0, Ll/qrb;->c:I

    .line 10
    .line 11
    iput-object p3, p0, Ll/qrb;->d:Ll/y20;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public run()V
    .locals 7

    .line 1
    iget v0, p0, Ll/qrb;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/qrb;->a:I

    .line 4
    .line 5
    mul-int/lit16 v2, v1, 0x3e8

    .line 6
    .line 7
    if-ge v0, v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/qrb;->d:Ll/y20;

    .line 10
    .line 11
    int-to-long v3, v1

    .line 12
    const-wide/16 v5, 0x3e8

    .line 13
    .line 14
    mul-long/2addr v3, v5

    .line 15
    int-to-long v0, v0

    .line 16
    sub-long/2addr v3, v0

    .line 17
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/qrb;->b:I

    .line 25
    .line 26
    iget v1, p0, Ll/qrb;->c:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    iput v0, p0, Ll/qrb;->b:I

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 32
    .line 33
    int-to-long v1, v1

    .line 34
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
