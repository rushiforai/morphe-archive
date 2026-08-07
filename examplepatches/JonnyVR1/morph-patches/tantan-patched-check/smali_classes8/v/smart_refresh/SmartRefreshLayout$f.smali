.class public Lv/smart_refresh/SmartRefreshLayout$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout;->C(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$f;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$f;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->E0:Ll/tm50;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ll/tm50;->a(Ll/mvc0;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    const/16 v1, 0x7d0

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->p(I)Ll/mvc0;

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$f;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 21
    .line 22
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {v0, p0}, Ll/tm50;->a(Ll/mvc0;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method
