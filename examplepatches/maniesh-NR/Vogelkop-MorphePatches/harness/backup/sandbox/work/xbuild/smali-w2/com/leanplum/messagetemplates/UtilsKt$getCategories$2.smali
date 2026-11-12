.class final synthetic Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/UtilsKt;->getCategories(Lcom/leanplum/ActionContext;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1018
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lnr9;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x530
.end annotation


# static fields
.field public static final INSTANCE:Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;-><init>()V

    sput-object v0, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;->INSTANCE:Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;

    return-void
.end method

.method public constructor <init>()V
    .registers 7

    const-string v4, "isNotEmpty(Ljava/lang/CharSequence;)Z"

    const/4 v5, 0x1

    const/4 v1, 0x1

    const-class v2, Lkotlin/text/StringsKt;

    const-string v3, "isNotEmpty"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-lez p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 14
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;->invoke(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
