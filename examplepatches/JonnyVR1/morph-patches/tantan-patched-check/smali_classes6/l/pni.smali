.class public final synthetic Ll/pni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/doi;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/doi;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pni;->a:Ll/doi;

    iput-object p2, p0, Ll/pni;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pni;->a:Ll/doi;

    iget-object p0, p0, Ll/pni;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/doi;->b(Ll/doi;Ll/y20;)V

    return-void
.end method
