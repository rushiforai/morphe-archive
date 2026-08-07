.class public final synthetic Ll/zoc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zoc0;->a:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;

    iput-object p2, p0, Ll/zoc0;->b:Ljava/util/List;

    iput-object p3, p0, Ll/zoc0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zoc0;->a:Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;

    iget-object v1, p0, Ll/zoc0;->b:Ljava/util/List;

    iget-object p0, p0, Ll/zoc0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->a(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ljava/util/List;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
