.class public final synthetic Ll/iha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q7m;


# direct methods
.method public synthetic constructor <init>(Ll/q7m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iha0;->a:Ll/q7m;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iha0;->a:Ll/q7m;

    check-cast p1, [I

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->W4(Ll/q7m;[I)V

    return-void
.end method
