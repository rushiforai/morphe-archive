.class final Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;
.super Lnt5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x230
.end annotation

.annotation runtime Lri6;
    c = "com.leanplum.messagetemplates.UtilsKt"
    f = "Utils.kt"
    l = {
        0x8c
    }
    m = "validateActionUrlInternal"
    v = 0x2
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmt5;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmt5<",
            "-",
            "Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->result:Ljava/lang/Object;

    iget p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    const/4 p1, 0x0

    # invokes: Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    invoke-static {p1, p1, p1, p0}, Lcom/leanplum/messagetemplates/UtilsKt;->access$validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
