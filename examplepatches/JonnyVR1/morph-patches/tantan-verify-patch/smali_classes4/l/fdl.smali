.class public final synthetic Ll/fdl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fdl;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fdl;->a:Ll/tel;

    check-cast p1, Ll/bkj0;

    invoke-static {p0, p1}, Ll/tel;->P0(Ll/tel;Ll/bkj0;)V

    return-void
.end method
