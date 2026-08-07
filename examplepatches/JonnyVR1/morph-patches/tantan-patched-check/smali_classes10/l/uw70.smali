.class public final synthetic Ll/uw70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gx70;

.field public final synthetic b:Ll/ja80;


# direct methods
.method public synthetic constructor <init>(Ll/gx70;Ll/ja80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uw70;->a:Ll/gx70;

    iput-object p2, p0, Ll/uw70;->b:Ll/ja80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uw70;->a:Ll/gx70;

    iget-object p0, p0, Ll/uw70;->b:Ll/ja80;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/gx70;->V3(Ll/gx70;Ll/ja80;Ljava/util/List;)V

    return-void
.end method
