.class public Ll/dem0$b;
.super Ll/eej;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dem0;->i(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dem0;


# direct methods
.method public constructor <init>(Ll/dem0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dem0$b;->a:Ll/dem0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/eej;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/eej;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dem0$b;->a:Ll/dem0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/dem0;->b(Ll/dem0;)Ll/uam;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/dem0$b;->a:Ll/dem0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/dem0;->b(Ll/dem0;)Ll/uam;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VVirtualVoiceWindowView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VVirtualVoiceWindowView;->e()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/dem0$b;->a:Ll/dem0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/dem0;->b(Ll/dem0;)Ll/uam;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/uam;->c()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
