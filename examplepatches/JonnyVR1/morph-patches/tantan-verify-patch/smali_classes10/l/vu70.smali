.class public final synthetic Ll/vu70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/av70;


# direct methods
.method public synthetic constructor <init>(Ll/av70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vu70;->a:Ll/av70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vu70;->a:Ll/av70;

    invoke-static {p0}, Ll/av70;->J3(Ll/av70;)V

    return-void
.end method
