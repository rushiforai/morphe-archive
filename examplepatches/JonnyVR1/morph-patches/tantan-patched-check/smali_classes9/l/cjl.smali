.class public final synthetic Ll/cjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fjl;


# direct methods
.method public synthetic constructor <init>(Ll/fjl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cjl;->a:Ll/fjl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjl;->a:Ll/fjl;

    invoke-static {p0}, Ll/fjl;->G(Ll/fjl;)V

    return-void
.end method
