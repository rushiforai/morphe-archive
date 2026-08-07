.class public final synthetic Ll/byf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dyf;


# direct methods
.method public synthetic constructor <init>(Ll/dyf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/byf;->a:Ll/dyf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byf;->a:Ll/dyf;

    invoke-static {p0}, Ll/dyf;->A(Ll/dyf;)V

    return-void
.end method
