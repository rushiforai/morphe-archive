.class public Lv/VPullDownRefreshLayout$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/urd;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VPullDownRefreshLayout;->setDefaultRefreshInitializer(Ll/urd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/urd;


# direct methods
.method public constructor <init>(Ll/urd;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VPullDownRefreshLayout$f;->a:Ll/urd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ll/mvc0;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lv/VPullDownRefreshLayout$f;->a:Ll/urd;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/urd;->a(Landroid/content/Context;Ll/mvc0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
