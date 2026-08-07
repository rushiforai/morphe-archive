.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$a;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3$a;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->e:Ll/x20;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    new-array p0, p0, [Ll/sfj0$a;

    .line 12
    .line 13
    const-string p1, "e_city_cover_go_up"

    .line 14
    .line 15
    const-string v0, "p_city_cover_desc_show_someone"

    .line 16
    .line 17
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
