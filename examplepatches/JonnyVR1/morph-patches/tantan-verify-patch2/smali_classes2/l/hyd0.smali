.class public final synthetic Ll/hyd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/savedstate/a$b;


# instance fields
.field public final synthetic a:Ll/iyd0;


# direct methods
.method public synthetic constructor <init>(Ll/iyd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hyd0;->a:Ll/iyd0;

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hyd0;->a:Ll/iyd0;

    invoke-static {p0}, Ll/iyd0;->a(Ll/iyd0;)Landroid/os/Bundle;

    move-result-object p0

    return-object p0
.end method
