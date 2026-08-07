.class public final synthetic Ll/hdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pdf;


# direct methods
.method public synthetic constructor <init>(Ll/pdf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdf;->a:Ll/pdf;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hdf;->a:Ll/pdf;

    invoke-static {p0}, Ll/pdf;->W(Ll/pdf;)V

    return-void
.end method
