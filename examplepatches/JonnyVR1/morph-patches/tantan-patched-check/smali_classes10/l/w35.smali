.class public final synthetic Ll/w35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/v35;


# direct methods
.method public synthetic constructor <init>(Ll/v35;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w35;->a:Ll/v35;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w35;->a:Ll/v35;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;->p(Ll/v35;Landroid/view/View;)V

    return-void
.end method
