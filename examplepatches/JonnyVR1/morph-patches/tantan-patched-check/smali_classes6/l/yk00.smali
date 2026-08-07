.class public final synthetic Ll/yk00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

.field public final synthetic b:Landroid/text/SpannableStringBuilder;

.field public final synthetic c:[Landroid/text/style/URLSpan;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yk00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    iput-object p2, p0, Ll/yk00;->b:Landroid/text/SpannableStringBuilder;

    iput-object p3, p0, Ll/yk00;->c:[Landroid/text/style/URLSpan;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yk00;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    iget-object v1, p0, Ll/yk00;->b:Landroid/text/SpannableStringBuilder;

    iget-object p0, p0, Ll/yk00;->c:[Landroid/text/style/URLSpan;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->n(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Landroid/view/View;)V

    return-void
.end method
