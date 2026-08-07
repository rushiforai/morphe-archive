.class public final synthetic Ll/tap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vap;


# direct methods
.method public synthetic constructor <init>(Ll/vap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tap;->a:Ll/vap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tap;->a:Ll/vap;

    invoke-static {p0}, Ll/vap;->a(Ll/vap;)V

    return-void
.end method
