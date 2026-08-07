.class public final Ll/jfn$b;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jfn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0019\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\n\u001a\u0004\u0018\u00010\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u000fR0\u0010\u0018\u001a\u0010\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u00108\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/jfn$b;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;",
        "Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;",
        "question",
        "<init>",
        "(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "H",
        "(Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;)V",
        "a",
        "Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;",
        "Lkotlin/Function1;",
        "",
        "b",
        "Lkotlin/jvm/functions/Function1;",
        "getFunction",
        "()Lkotlin/jvm/functions/Function1;",
        "I",
        "(Lkotlin/jvm/functions/Function1;)V",
        "function",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/jfn$b;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/jfn$b;->a:Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;

    .line 7
    .line 8
    iget-object p0, p0, Ll/jfn$b;->b:Lkotlin/jvm/functions/Function1;

    .line 9
    .line 10
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;->R(Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO$FaqListDTO;Lkotlin/jvm/functions/Function1;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final I(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jfn$b;->b:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jfn$b;->H(Lcom/p1/mobile/putong/live/external/intl/feedback/item/IntlFeedbackQuestionItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
