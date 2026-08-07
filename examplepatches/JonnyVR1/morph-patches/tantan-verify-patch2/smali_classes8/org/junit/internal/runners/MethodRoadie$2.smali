.class Lorg/junit/internal/runners/MethodRoadie$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/internal/runners/MethodRoadie;->runTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/internal/runners/MethodRoadie;


# direct methods
.method public constructor <init>(Lorg/junit/internal/runners/MethodRoadie;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/internal/runners/MethodRoadie$2;->this$0:Lorg/junit/internal/runners/MethodRoadie;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/internal/runners/MethodRoadie$2;->this$0:Lorg/junit/internal/runners/MethodRoadie;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/internal/runners/MethodRoadie;->runTestMethod()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
