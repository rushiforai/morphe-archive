.class public final synthetic Ll/mwc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qvk;

.field public final synthetic b:Ll/dqm0;


# direct methods
.method public synthetic constructor <init>(Ll/qvk;Ll/dqm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwc0;->a:Ll/qvk;

    iput-object p2, p0, Ll/mwc0;->b:Ll/dqm0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mwc0;->a:Ll/qvk;

    iget-object p0, p0, Ll/mwc0;->b:Ll/dqm0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationchoose/RelationPageItemView;->b(Ll/qvk;Ll/dqm0;Landroid/view/View;)V

    return-void
.end method
