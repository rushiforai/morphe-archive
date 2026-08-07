.class public final synthetic Ll/g420;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/i420;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/i420;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g420;->a:Ll/y20;

    iput-object p2, p0, Ll/g420;->b:Ll/i420;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g420;->a:Ll/y20;

    iget-object p0, p0, Ll/g420;->b:Ll/i420;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->b(Ll/y20;Ll/i420;Landroid/view/View;)V

    return-void
.end method
