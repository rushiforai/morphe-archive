.class public final synthetic Ll/tti;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uti;


# direct methods
.method public synthetic constructor <init>(Ll/uti;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tti;->a:Ll/uti;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tti;->a:Ll/uti;

    invoke-static {p0}, Ll/uti;->d(Ll/uti;)V

    return-void
.end method
