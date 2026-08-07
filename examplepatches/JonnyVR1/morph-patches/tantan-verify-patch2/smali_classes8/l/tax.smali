.class public final synthetic Ll/tax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xbx;


# direct methods
.method public synthetic constructor <init>(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tax;->a:Ll/xbx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tax;->a:Ll/xbx;

    invoke-static {p0}, Ll/xbx;->j1(Ll/xbx;)V

    return-void
.end method
