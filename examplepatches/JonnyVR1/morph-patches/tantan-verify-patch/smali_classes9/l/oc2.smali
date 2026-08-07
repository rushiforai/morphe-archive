.class public final synthetic Ll/oc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pc2;


# direct methods
.method public synthetic constructor <init>(Ll/pc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oc2;->a:Ll/pc2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oc2;->a:Ll/pc2;

    invoke-static {p0}, Ll/pc2;->f(Ll/pc2;)V

    return-void
.end method
