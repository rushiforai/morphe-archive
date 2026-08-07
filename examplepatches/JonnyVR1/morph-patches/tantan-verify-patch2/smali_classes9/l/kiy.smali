.class public final synthetic Ll/kiy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/liy;

.field public final synthetic b:Ll/zbr;


# direct methods
.method public synthetic constructor <init>(Ll/liy;Ll/zbr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kiy;->a:Ll/liy;

    iput-object p2, p0, Ll/kiy;->b:Ll/zbr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kiy;->a:Ll/liy;

    iget-object p0, p0, Ll/kiy;->b:Ll/zbr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    invoke-static {v0, p0, p1}, Ll/liy;->Y3(Ll/liy;Ll/zbr;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    return-void
.end method
