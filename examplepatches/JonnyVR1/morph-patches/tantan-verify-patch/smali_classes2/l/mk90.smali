.class public final synthetic Ll/mk90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/lifecycle/o;


# direct methods
.method public synthetic constructor <init>(Landroidx/lifecycle/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mk90;->a:Landroidx/lifecycle/o;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mk90;->a:Landroidx/lifecycle/o;

    invoke-static {p0}, Landroidx/lifecycle/o;->a(Landroidx/lifecycle/o;)V

    return-void
.end method
