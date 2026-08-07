.class public final synthetic Ll/sx80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wx80;


# direct methods
.method public synthetic constructor <init>(Ll/wx80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sx80;->a:Ll/wx80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sx80;->a:Ll/wx80;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/wx80;->l0(Ll/wx80;Ljava/lang/Throwable;)V

    return-void
.end method
