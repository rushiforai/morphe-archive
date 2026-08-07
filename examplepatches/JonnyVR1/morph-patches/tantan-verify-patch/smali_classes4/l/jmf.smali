.class public final synthetic Ll/jmf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/omf;


# direct methods
.method public synthetic constructor <init>(Ll/omf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jmf;->a:Ll/omf;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmf;->a:Ll/omf;

    invoke-static {p0}, Ll/omf;->h(Ll/omf;)V

    return-void
.end method
