.class public final synthetic Ll/gge0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hge0;

.field public final synthetic b:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ll/hge0;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gge0;->a:Ll/hge0;

    iput-object p2, p0, Ll/gge0;->b:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gge0;->a:Ll/hge0;

    iget-object p0, p0, Ll/gge0;->b:Landroid/view/ViewGroup;

    invoke-static {v0, p0}, Ll/hge0;->a(Ll/hge0;Landroid/view/ViewGroup;)V

    return-void
.end method
