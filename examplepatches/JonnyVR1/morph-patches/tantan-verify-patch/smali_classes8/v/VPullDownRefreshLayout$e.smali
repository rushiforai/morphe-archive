.class public Lv/VPullDownRefreshLayout$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/srd;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VPullDownRefreshLayout;->setDefaultRefreshFooterCreator(Ll/srd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/srd;


# direct methods
.method public constructor <init>(Ll/srd;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VPullDownRefreshLayout$e;->a:Ll/srd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ll/mvc0;)Ll/jvc0;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VPullDownRefreshLayout$e;->a:Ll/srd;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/srd;->a(Landroid/content/Context;Ll/mvc0;)Ll/jvc0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Lv/smart_refresh/footer/TTRefreshFooter;

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lv/smart_refresh/footer/TTRefreshFooter;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method
