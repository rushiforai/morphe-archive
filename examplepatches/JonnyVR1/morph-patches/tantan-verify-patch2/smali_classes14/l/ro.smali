.class public final synthetic Ll/ro;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vo;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/vo;Landroid/content/Context;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ro;->a:Ll/vo;

    iput-object p2, p0, Ll/ro;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/ro;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ro;->a:Ll/vo;

    iget-object v1, p0, Ll/ro;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/ro;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Ll/vo;->a(Ll/vo;Landroid/content/Context;Ll/y20;)V

    return-void
.end method
