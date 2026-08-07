.class public final synthetic Ll/dgd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ogd0;

.field public final synthetic b:Ll/x5;


# direct methods
.method public synthetic constructor <init>(Ll/ogd0;Ll/x5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgd0;->a:Ll/ogd0;

    iput-object p2, p0, Ll/dgd0;->b:Ll/x5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dgd0;->a:Ll/ogd0;

    iget-object p0, p0, Ll/dgd0;->b:Ll/x5;

    check-cast p1, Ll/jsv;

    invoke-static {v0, p0, p1}, Ll/ogd0;->e0(Ll/ogd0;Ll/x5;Ll/jsv;)V

    return-void
.end method
