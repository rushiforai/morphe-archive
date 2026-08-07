.class public final synthetic Ll/qgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rgr$a;


# direct methods
.method public synthetic constructor <init>(Ll/rgr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qgr;->a:Ll/rgr$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qgr;->a:Ll/rgr$a;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/rgr$a;->a(Ll/rgr$a;Ljava/lang/Long;)V

    return-void
.end method
