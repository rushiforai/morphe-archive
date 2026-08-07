.class public final synthetic Ll/t680;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k780;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/k780;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t680;->a:Ll/k780;

    iput-object p2, p0, Ll/t680;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/t680;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/t680;->d:Ljava/util/List;

    iput-object p5, p0, Ll/t680;->e:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t680;->a:Ll/k780;

    iget-object v1, p0, Ll/t680;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/t680;->c:Ljava/util/ArrayList;

    iget-object v3, p0, Ll/t680;->d:Ljava/util/List;

    iget-object v4, p0, Ll/t680;->e:Ljava/util/List;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    invoke-static/range {v0 .. v5}, Ll/k780;->R3(Ll/k780;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V

    return-void
.end method
