.class public final synthetic Ll/tct;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xct;


# direct methods
.method public synthetic constructor <init>(Ll/xct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tct;->a:Ll/xct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tct;->a:Ll/xct;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/xct;->U3(Ll/xct;Ll/jsv;)V

    return-void
.end method
