.class public final synthetic Ll/m110;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m110;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m110;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;->Z1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
