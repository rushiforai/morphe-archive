.class public final synthetic Ll/hfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hfn;->a:Ljava/util/List;

    iput-object p2, p0, Ll/hfn;->b:Ljava/util/List;

    iput-object p3, p0, Ll/hfn;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hfn;->a:Ljava/util/List;

    iget-object v1, p0, Ll/hfn;->b:Ljava/util/List;

    iget-object p0, p0, Ll/hfn;->c:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;

    invoke-static {v0, v1, p0, p1}, Ll/jfn;->f0(Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;)V

    return-void
.end method
