.class public final synthetic Lzu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcv8;


# direct methods
.method public synthetic constructor <init>(Lcv8;B)V
    .registers 3

    iput-byte p2, p0, Lzu8;->a:B

    iput-object p1, p0, Lzu8;->b:Lcv8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lzu8;->a:B

    iget-object p0, p0, Lzu8;->b:Lcv8;

    packed-switch v0, :pswitch_data_6e

    check-cast p1, Ltvl;

    iget-object v0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {v0}, Lnjm;->b()V

    iget-object p0, p0, Lcv8;->d:Lcom/opera/android/feed/FeedScrollViewContentWrapper;

    iget p1, p1, Ltvl;->d:I

    iget v0, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->a:I

    if-eq p1, v0, :cond_1b

    iput p1, p0, Lcom/opera/android/feed/FeedScrollViewContentWrapper;->a:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_1b
    return-void

    :pswitch_1c
    check-cast p1, Lavl;

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void

    :pswitch_24
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void

    :pswitch_2f
    check-cast p1, Lzaa;

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void

    :pswitch_37
    check-cast p1, Lt8k;

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void

    :pswitch_3f
    check-cast p1, Lf8k;

    iget-object p0, p0, Lcv8;->m:Lnjm;

    invoke-virtual {p0}, Lnjm;->b()V

    return-void

    :pswitch_47
    check-cast p1, Lgr8;

    iget v0, p1, Lgr8;->b:I

    iget v1, p1, Lgr8;->a:I

    mul-int/2addr v0, v1

    iget p1, p1, Lgr8;->c:I

    add-int/lit8 v1, v1, -0x1

    mul-int/2addr v1, p1

    add-int/2addr v1, v0

    iget-object p1, p0, Lcv8;->c:Lcom/opera/android/feed/FeedScrollView;

    iget p1, p1, Lcom/opera/android/feed/FeedScrollView;->F:I

    sub-int/2addr p1, v1

    div-int/lit8 p1, p1, 0x2

    iget v0, p0, Lcv8;->u:I

    if-eq p1, v0, :cond_64

    iput p1, p0, Lcv8;->u:I

    invoke-virtual {p0}, Lcv8;->c()V

    :cond_64
    return-void

    :pswitch_65
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lcv8;->c()V

    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_65
        :pswitch_47
        :pswitch_3f
        :pswitch_37
        :pswitch_2f
        :pswitch_24
        :pswitch_1c
    .end packed-switch
.end method
