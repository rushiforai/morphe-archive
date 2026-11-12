.class public final Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwmn;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1",
        "Lwmn;",
        "Lhjm;",
        "reason",
        "",
        "wallpaperChanged",
        "",
        "onFinished",
        "(Lhjm;Z)V",
        "",
        "details",
        "onInvalidData",
        "(Ljava/lang/String;)V",
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
.field final synthetic $actionContext:Lcom/leanplum/ActionContext;

.field final synthetic $avatarPair:Lkotlin/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Pair<",
            "Lcom/leanplum/messagetemplates/ResourceWrapper;",
            "Lcom/leanplum/messagetemplates/ResourceWrapper;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $usageReporter:Lorm;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            "Lorm;",
            "Lkotlin/Pair<",
            "Lcom/leanplum/messagetemplates/ResourceWrapper;",
            "Lcom/leanplum/messagetemplates/ResourceWrapper;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$usageReporter:Lorm;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$avatarPair:Lkotlin/Pair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished(Lhjm;Z)V
    .registers 10

    if-eqz p2, :cond_11

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v1, "Primary Action"

    const-wide/16 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/leanplum/ActionContext;->trackMessageEvent(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    sget-object p1, Lvb0;->b:Lvb0;

    :goto_f
    move-object v2, p1

    goto :goto_1b

    :cond_11
    sget-object p2, Lhjm;->a:Lhjm;

    if-ne p1, p2, :cond_18

    sget-object p1, Lvb0;->c:Lvb0;

    goto :goto_f

    :cond_18
    sget-object p1, Lvb0;->d:Lvb0;

    goto :goto_f

    :goto_1b
    iget-object p1, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$usageReporter:Lorm;

    iget-object p2, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$avatarPair:Lkotlin/Pair;

    iget-object p2, p2, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast p2, Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v5, p2, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v6

    move-object v0, p1

    check-cast v0, Lx5f;

    sget-object v1, Lgg0;->g:Lgg0;

    const-wide/16 v3, 0x2

    invoke-virtual/range {v0 .. v6}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    return-void
.end method

.method public onInvalidData(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$usageReporter:Lorm;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;->$actionContext:Lcom/leanplum/ActionContext;

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p0

    check-cast v0, Lx5f;

    sget-object v1, Leg0;->e:Leg0;

    invoke-virtual {v0, p1, v1, p0}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void
.end method
