.class public final synthetic Ll/jn90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pn90;


# direct methods
.method public synthetic constructor <init>(Ll/pn90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jn90;->a:Ll/pn90;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jn90;->a:Ll/pn90;

    invoke-static {p0}, Ll/pn90;->n(Ll/pn90;)V

    return-void
.end method
