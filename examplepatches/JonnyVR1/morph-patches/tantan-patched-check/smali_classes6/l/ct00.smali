.class public final synthetic Ll/ct00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

.field public final synthetic b:Ll/qo00;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Ll/qo00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ct00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

    iput-object p2, p0, Ll/ct00;->b:Ll/qo00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ct00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

    iget-object p0, p0, Ll/ct00;->b:Ll/qo00;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->g(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Ll/qo00;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
