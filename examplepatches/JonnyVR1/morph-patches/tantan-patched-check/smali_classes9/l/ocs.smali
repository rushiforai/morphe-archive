.class public final synthetic Ll/ocs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ocs;->a:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocs;->a:Ll/i6t;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->b(Ll/i6t;Landroid/view/View;)V

    return-void
.end method
