.class public final synthetic Ll/ap70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hp70;


# direct methods
.method public synthetic constructor <init>(Ll/hp70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ap70;->a:Ll/hp70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ap70;->a:Ll/hp70;

    invoke-static {p0}, Ll/hp70;->f(Ll/hp70;)V

    return-void
.end method
