.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_city_cover_go_up"

    .line 5
    .line 6
    const-string v1, "p_city_cover_feature_show"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)Ll/x20;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$b;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)Ll/x20;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
