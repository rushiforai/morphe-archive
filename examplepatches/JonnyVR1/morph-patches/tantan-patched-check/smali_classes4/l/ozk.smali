.class public final synthetic Ll/ozk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/pzk;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/pzk;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ozk;->a:Ll/pzk;

    iput-boolean p2, p0, Ll/ozk;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ozk;->a:Ll/pzk;

    iget-boolean p0, p0, Ll/ozk;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/pzk;->L(Ll/pzk;ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
