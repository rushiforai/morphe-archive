.class public final synthetic Ll/uw00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vw00;


# direct methods
.method public synthetic constructor <init>(Ll/vw00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uw00;->a:Ll/vw00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uw00;->a:Ll/vw00;

    invoke-static {p0}, Ll/vw00;->r(Ll/vw00;)V

    return-void
.end method
