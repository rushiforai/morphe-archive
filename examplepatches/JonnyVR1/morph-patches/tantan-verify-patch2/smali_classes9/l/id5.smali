.class public final synthetic Ll/id5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/nd5;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/nd5;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/id5;->a:Ll/nd5;

    iput-object p2, p0, Ll/id5;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/id5;->a:Ll/nd5;

    iget-object p0, p0, Ll/id5;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/nd5;->i(Ll/nd5;Ll/y20;)V

    return-void
.end method
