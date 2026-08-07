.class public final synthetic Ll/bvz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bvz;->a:Ll/tvz;

    iput-boolean p2, p0, Ll/bvz;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bvz;->a:Ll/tvz;

    iget-boolean p0, p0, Ll/bvz;->b:Z

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/tvz;->A8(Ll/tvz;ZLl/pf60;)V

    return-void
.end method
