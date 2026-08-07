.class public final synthetic Ll/ig2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kg2;


# direct methods
.method public synthetic constructor <init>(Ll/kg2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ig2;->a:Ll/kg2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig2;->a:Ll/kg2;

    invoke-static {p0}, Ll/kg2;->f(Ll/kg2;)V

    return-void
.end method
