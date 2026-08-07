.class public final synthetic Ll/ngn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ngn;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;

    iput-object p2, p0, Ll/ngn;->b:Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;

    iput-object p3, p0, Ll/ngn;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ngn;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;

    iget-object v1, p0, Ll/ngn;->b:Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;

    iget-object p0, p0, Ll/ngn;->c:Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;->P(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;Lkotlin/jvm/functions/Function1;Landroid/view/View;)V

    return-void
.end method
