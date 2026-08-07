.class public final synthetic Ll/qwn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i5o;

.field public final synthetic b:Ll/nvn;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/i5o;Ll/nvn;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwn;->a:Ll/i5o;

    iput-object p2, p0, Ll/qwn;->b:Ll/nvn;

    iput p3, p0, Ll/qwn;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qwn;->a:Ll/i5o;

    iget-object v1, p0, Ll/qwn;->b:Ll/nvn;

    iget p0, p0, Ll/qwn;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveFollowInfiltrationItemPicView;->a(Ll/i5o;Ll/nvn;ILandroid/view/View;)V

    return-void
.end method
