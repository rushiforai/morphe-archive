.class public final synthetic Ll/ha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cb0;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ha0;->a:Ll/cb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ha0;->a:Ll/cb0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    invoke-static {p0, p1}, Ll/cb0;->j(Ll/cb0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method
