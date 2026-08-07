.class public final synthetic Ll/nb80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qb80;


# direct methods
.method public synthetic constructor <init>(Ll/qb80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nb80;->a:Ll/qb80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nb80;->a:Ll/qb80;

    invoke-static {p0}, Ll/qb80;->g(Ll/qb80;)V

    return-void
.end method
