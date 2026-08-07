.class public final synthetic Ll/po2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po2;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/po2;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/po2;->c:Ljava/util/List;

    iput-object p4, p0, Ll/po2;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/po2;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/po2;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/po2;->c:Ljava/util/List;

    iget-object p0, p0, Ll/po2;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    check-cast p1, Ll/jxn0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qo2;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/jxn0;)V

    return-void
.end method
