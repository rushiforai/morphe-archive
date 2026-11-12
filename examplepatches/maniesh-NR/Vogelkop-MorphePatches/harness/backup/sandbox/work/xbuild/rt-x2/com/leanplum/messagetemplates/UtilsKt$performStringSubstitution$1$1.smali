.class public final Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgx1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/UtilsKt;->performStringSubstitution(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/opera/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "com/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1",
        "Lgx1;",
        "Lhx1;",
        "success",
        "",
        "handleArgumentLookupResult",
        "(Lhx1;)V",
        "Lfx1;",
        "failure",
        "(Lfx1;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $callback:Lcom/opera/api/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/opera/api/Callback;"
        }
    .end annotation
.end field

.field final synthetic $model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;


# direct methods
.method public constructor <init>(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;->$callback:Lcom/opera/api/Callback;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;->$model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleArgumentLookupResult(Lfx1;)V
    .registers 4

    .line 109
    iget-object p0, p0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;->$callback:Lcom/opera/api/Callback;

    .line 110
    new-instance v0, Lcom/leanplum/messagetemplates/DiscardInfo;

    .line 111
    iget-object p1, p1, Lfx1;->c:Ljava/lang/String;

    .line 112
    sget-object v1, Leg0;->d:Leg0;

    .line 113
    invoke-direct {v0, p1, v1}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    .line 114
    new-instance p1, Lrw7;

    invoke-direct {p1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    .line 115
    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public handleArgumentLookupResult(Lhx1;)V
    .registers 15

    new-instance v0, Lrii;

    iget-object p1, p1, Lhx1;->c:Lu7k;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;->$callback:Lcom/opera/api/Callback;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;->$model:Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    :try_start_c
    sget-object p0, Lt0i;->b:Lp0i;

    iget-object p0, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lrii;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object p0, v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lrii;->x(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v11, 0x1f3

    const/4 v12, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v1 .. v12}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->copy$default(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;ILjava/lang/Object;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    move-result-object p0
    :try_end_28
    .catchall {:try_start_c .. :try_end_28} :catchall_29

    goto :goto_33

    :catchall_29
    move-exception v0

    move-object p0, v0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_33
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_3f

    new-instance v0, Lsw7;

    invoke-direct {v0, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_45

    :cond_3f
    new-instance p0, Lrw7;

    invoke-direct {p0, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    move-object v0, p0

    :goto_45
    instance-of p0, v0, Lrw7;

    if-eqz p0, :cond_61

    check-cast v0, Lrw7;

    iget-object p0, v0, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Throwable;

    new-instance v0, Lcom/leanplum/messagetemplates/DiscardInfo;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Leg0;->d:Leg0;

    invoke-direct {v0, p0, v1}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    move-object v0, p0

    goto :goto_65

    :cond_61
    instance-of p0, v0, Lsw7;

    if-eqz p0, :cond_69

    :goto_65
    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_69
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
