.class public Lv/VPullDownRefreshLayout$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tm50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VPullDownRefreshLayout;->M(Ll/tm50;)Ll/mvc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tm50;

.field public final synthetic b:Lv/VPullDownRefreshLayout;


# direct methods
.method public constructor <init>(Lv/VPullDownRefreshLayout;Ll/tm50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VPullDownRefreshLayout$b;->b:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lv/VPullDownRefreshLayout$b;->a:Ll/tm50;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lv/VPullDownRefreshLayout$b;->a:Ll/tm50;

    .line 2
    .line 3
    iget-object p0, p0, Lv/VPullDownRefreshLayout$b;->b:Lv/VPullDownRefreshLayout;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/tm50;->a(Ll/mvc0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
