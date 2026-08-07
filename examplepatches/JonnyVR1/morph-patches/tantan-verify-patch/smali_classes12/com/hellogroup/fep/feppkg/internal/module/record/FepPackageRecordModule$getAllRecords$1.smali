.class final Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->s(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0018\u0010\u0004\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00010\u0000H\u0086@\u00a2\u0006\u0004\u0008\u0006\u0010\u0007"
    }
    d2 = {
        "Lkotlin/coroutines/Continuation;",
        "",
        "",
        "Ll/lhi;",
        "continuation",
        "",
        "getAllRecords",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hellogroup.fep.feppkg.internal.module.record.FepPackageRecordModule"
    f = "FepPackageRecordModule.kt"
    l = {
        0x2da
    }
    m = "getAllRecords"
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;->result:Ljava/lang/Object;

    iget p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;->label:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;->label:I

    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$getAllRecords$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    invoke-virtual {p1, p0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->s(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
