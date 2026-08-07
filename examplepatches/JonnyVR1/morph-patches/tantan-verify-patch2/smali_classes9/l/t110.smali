.class public final synthetic Ll/t110;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/b210;

.field public final synthetic b:Ll/zmw;


# direct methods
.method public synthetic constructor <init>(Ll/b210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t110;->a:Ll/b210;

    iput-object p2, p0, Ll/t110;->b:Ll/zmw;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t110;->a:Ll/b210;

    iget-object p0, p0, Ll/t110;->b:Ll/zmw;

    invoke-static {v0, p0}, Ll/b210;->S0(Ll/b210;Ll/zmw;)V

    return-void
.end method
