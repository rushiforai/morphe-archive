.class public final synthetic Ll/lhx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mhx;


# direct methods
.method public synthetic constructor <init>(Ll/mhx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lhx;->a:Ll/mhx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhx;->a:Ll/mhx;

    invoke-static {p0}, Ll/mhx;->a(Ll/mhx;)V

    return-void
.end method
