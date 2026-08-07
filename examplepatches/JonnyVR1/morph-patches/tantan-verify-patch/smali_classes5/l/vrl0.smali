.class public final synthetic Ll/vrl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gsl0;


# direct methods
.method public synthetic constructor <init>(Ll/gsl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vrl0;->a:Ll/gsl0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vrl0;->a:Ll/gsl0;

    invoke-static {p0}, Ll/gsl0;->x0(Ll/gsl0;)V

    return-void
.end method
