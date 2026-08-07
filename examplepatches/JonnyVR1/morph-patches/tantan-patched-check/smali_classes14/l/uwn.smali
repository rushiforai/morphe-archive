.class public final synthetic Ll/uwn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i5o;


# direct methods
.method public synthetic constructor <init>(Ll/i5o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uwn;->a:Ll/i5o;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uwn;->a:Ll/i5o;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveFollowView;->a(Ll/i5o;Landroid/view/View;)V

    return-void
.end method
