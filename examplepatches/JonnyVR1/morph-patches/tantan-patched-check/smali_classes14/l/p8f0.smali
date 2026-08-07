.class public final synthetic Ll/p8f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/r8f0;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/r8f0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p8f0;->a:Ll/r8f0;

    iput-object p2, p0, Ll/p8f0;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8f0;->a:Ll/r8f0;

    iget-object p0, p0, Ll/p8f0;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Ll/r8f0;->b(Ll/r8f0;Landroid/content/Context;)V

    return-void
.end method
