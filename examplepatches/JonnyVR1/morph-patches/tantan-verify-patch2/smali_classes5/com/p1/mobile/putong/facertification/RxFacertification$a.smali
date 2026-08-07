.class public Lcom/p1/mobile/putong/facertification/RxFacertification$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltl$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/facertification/RxFacertification;->d(Landroid/content/Context;Ljava/util/Map;Lcom/p1/mobile/putong/data/VerificationToken;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/gcg0;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->a:Ll/gcg0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->b:Ljava/util/Map;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/jxf;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->a:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->a:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bb50;->onCompleted()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->a:Ll/gcg0;

    .line 17
    .line 18
    new-instance v2, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->b:Ljava/util/Map;

    .line 21
    .line 22
    invoke-direct {v2, p1, v0, p0}, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;-><init>(Ll/jxf;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v1, v2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ll/jxf;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->a:Ll/gcg0;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/RuntimeException;

    .line 6
    .line 7
    const-string v3, "error occurs during preDetect for option"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/facertification/RxFacertification$a;->b:Ljava/util/Map;

    .line 13
    .line 14
    invoke-direct {v1, p1, v2, p0}, Lcom/p1/mobile/putong/facertification/RxFacertification$PreDetectException;-><init>(Ll/jxf;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
