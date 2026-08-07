.class public final synthetic Ll/ya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/db;


# direct methods
.method public synthetic constructor <init>(Ll/db;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ya;->a:Ll/db;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ya;->a:Ll/db;

    invoke-static {p0}, Ll/db;->S(Ll/db;)V

    return-void
.end method
