.class public final synthetic Ll/pwn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i5o;

.field public final synthetic b:Ll/nvn;


# direct methods
.method public synthetic constructor <init>(Ll/i5o;Ll/nvn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pwn;->a:Ll/i5o;

    iput-object p2, p0, Ll/pwn;->b:Ll/nvn;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pwn;->a:Ll/i5o;

    iget-object p0, p0, Ll/pwn;->b:Ll/nvn;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveFollowInfiltrationItemPicView;->b(Ll/i5o;Ll/nvn;Landroid/view/View;)V

    return-void
.end method
