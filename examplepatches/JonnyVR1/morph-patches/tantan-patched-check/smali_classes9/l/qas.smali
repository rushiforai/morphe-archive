.class public final synthetic Ll/qas;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/las;


# direct methods
.method public synthetic constructor <init>(Ll/las;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qas;->a:Ll/las;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qas;->a:Ll/las;

    invoke-virtual {p0}, Ll/las;->R3()V

    return-void
.end method
