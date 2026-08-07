.class public final synthetic Ll/q2t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/t2t;


# direct methods
.method public synthetic constructor <init>(Ll/t2t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q2t;->a:Ll/t2t;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2t;->a:Ll/t2t;

    invoke-static {p0}, Ll/t2t;->d(Ll/t2t;)Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    move-result-object p0

    return-object p0
.end method
