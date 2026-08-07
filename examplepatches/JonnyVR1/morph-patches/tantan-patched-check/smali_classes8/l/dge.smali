.class public final synthetic Ll/dge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mge;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Banners;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/mge;Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dge;->a:Ll/mge;

    iput-object p2, p0, Ll/dge;->b:Lcom/p1/mobile/putong/data/Banners;

    iput-object p3, p0, Ll/dge;->c:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    iput-object p4, p0, Ll/dge;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/dge;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dge;->a:Ll/mge;

    iget-object v1, p0, Ll/dge;->b:Lcom/p1/mobile/putong/data/Banners;

    iget-object v2, p0, Ll/dge;->c:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;

    iget-object v3, p0, Ll/dge;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/dge;->e:Ll/y20;

    move-object v5, p1

    check-cast v5, [I

    invoke-static/range {v0 .. v5}, Ll/mge;->h(Ll/mge;Lcom/p1/mobile/putong/data/Banners;Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView;Lcom/p1/mobile/android/app/Act;Ll/y20;[I)V

    return-void
.end method
