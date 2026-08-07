.class public final synthetic Ll/bcm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lv/VImage;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bcm;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/bcm;->b:Lv/VImage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bcm;->a:Lv/VDraweeView;

    iget-object p0, p0, Ll/bcm;->b:Lv/VImage;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/hcm;->m(Lv/VDraweeView;Lv/VImage;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
