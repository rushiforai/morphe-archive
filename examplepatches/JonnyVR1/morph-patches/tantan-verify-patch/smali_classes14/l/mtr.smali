.class public final synthetic Ll/mtr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rtr;


# direct methods
.method public synthetic constructor <init>(Ll/rtr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mtr;->a:Ll/rtr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mtr;->a:Ll/rtr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    invoke-static {p0, p1}, Ll/rtr;->d(Ll/rtr;Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V

    return-void
.end method
