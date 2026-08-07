.class public final synthetic Ll/zbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bci;


# direct methods
.method public synthetic constructor <init>(Ll/bci;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zbi;->a:Ll/bci;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zbi;->a:Ll/bci;

    invoke-static {p0}, Ll/bci;->c(Ll/bci;)V

    return-void
.end method
