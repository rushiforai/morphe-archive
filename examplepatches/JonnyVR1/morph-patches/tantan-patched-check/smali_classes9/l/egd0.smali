.class public final synthetic Ll/egd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ogd0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/ogd0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/egd0;->a:Ll/ogd0;

    iput-boolean p2, p0, Ll/egd0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/egd0;->a:Ll/ogd0;

    iget-boolean p0, p0, Ll/egd0;->b:Z

    check-cast p1, Ll/ugd0;

    invoke-static {v0, p0, p1}, Ll/ogd0;->k0(Ll/ogd0;ZLl/ugd0;)V

    return-void
.end method
