.class public final synthetic Ll/j110;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j110;->a:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j110;->a:Ll/pf60;

    invoke-static {p0}, Ll/k110;->a(Ll/pf60;)V

    return-void
.end method
