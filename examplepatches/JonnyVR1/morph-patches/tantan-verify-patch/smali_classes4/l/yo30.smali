.class public final synthetic Ll/yo30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$IntRef;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ll/xp30;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$IntRef;Ljava/util/List;Ll/xp30;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yo30;->a:Lkotlin/jvm/internal/Ref$IntRef;

    iput-object p2, p0, Ll/yo30;->b:Ljava/util/List;

    iput-object p3, p0, Ll/yo30;->c:Ll/xp30;

    iput-object p4, p0, Ll/yo30;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yo30;->a:Lkotlin/jvm/internal/Ref$IntRef;

    iget-object v1, p0, Ll/yo30;->b:Ljava/util/List;

    iget-object v2, p0, Ll/yo30;->c:Ll/xp30;

    iget-object p0, p0, Ll/yo30;->d:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xp30;->m(Lkotlin/jvm/internal/Ref$IntRef;Ljava/util/List;Ll/xp30;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)V

    return-void
.end method
