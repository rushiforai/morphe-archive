.class public final synthetic Ll/pf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;


# direct methods
.method public synthetic constructor <init>(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pf9;->a:Ll/xf9;

    iput-object p2, p0, Ll/pf9;->b:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf9;->a:Ll/xf9;

    iget-object p0, p0, Ll/pf9;->b:Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/xf9;->m3(Ll/xf9;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
