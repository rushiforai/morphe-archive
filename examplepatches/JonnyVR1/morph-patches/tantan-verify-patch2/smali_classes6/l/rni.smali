.class public final synthetic Ll/rni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/doi;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/doi;Landroid/content/Context;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rni;->a:Ll/doi;

    iput-object p2, p0, Ll/rni;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/rni;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rni;->a:Ll/doi;

    iget-object v1, p0, Ll/rni;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/rni;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Ll/doi;->a(Ll/doi;Landroid/content/Context;Ll/y20;)V

    return-void
.end method
